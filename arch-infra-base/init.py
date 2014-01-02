#!/usr/bin/env python2
import subprocess, urllib, time, os, signal, sys, glob
from functools import partial

def get_ip():
    """Get the container's IP"""

    return subprocess.check_output("ip a s eth0|sed -ne '/127.0.0.1/!{s/^[ \\t]*inet[ \\t]*\([0-9.]\+\)\/.*$/\\1/p}' | head -n1", shell=True).rstrip()

def get_init_scripts(*args, **kwargs):
    """Get the ordered init scripts"""
    return sorted(glob.glob('/opt/init.d/*'), *args, **kwargs)


def run_init(action):
    """Start running the init scripts, or stop scripts"""
    for script in get_init_scripts(reverse = (action == "stop")):
        if os.access(script, os.X_OK):
            subprocess.call((script, action), stdout=sys.stdout, stderr=sys.stderr)


def stop_handler(supervisord, signal, *args):
    """Handles shutdown of a container"""

    unregister_stop_handler()
    print " /!\ Shutting down..."
    run_init("stop")
    supervisord.send_signal(signal)

def unregister_stop_handler():
    """Remove the stop handler from the signal handlers"""
    signal.signal(signal.SIGINT, signal.SIG_DFL)
    signal.signal(signal.SIGQUIT, signal.SIG_DFL)
    signal.signal(signal.SIGTERM, signal.SIG_DFL)

def register_stop_handler(supervisord):
    partial_stop_handler = partial(stop_handler, supervisord)
    """Add the stop handler to the signal handlers"""
    signal.signal(signal.SIGINT, partial_stop_handler)
    signal.signal(signal.SIGQUIT, partial_stop_handler)
    signal.signal(signal.SIGTERM, partial_stop_handler)


def main():
    os.environ['IP_ADDR'] = get_ip()

    supervisord = subprocess.Popen([
        "/usr/bin/supervisord", "-n", "-c", "/etc/supervisord.conf"
    ], stdout=sys.stdout, stderr=sys.stderr)

    run_init("start")
    register_stop_handler(supervisord)
    supervisord.wait()


if __name__ == "__main__":
    main()
