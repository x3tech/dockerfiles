#!/usr/bin/env python2
import subprocess, urllib, time, os, signal, sys, glob

def get_ip():
    return subprocess.check_output("ip a s eth0|sed -ne '/127.0.0.1/!{s/^[ \\t]*inet[ \\t]*\([0-9.]\+\)\/.*$/\\1/p}' | head -n1", shell=True).rstrip()

def get_init_scripts(*args, **kwargs):
    return sorted(glob.glob('/opt/init.d/*'), *args, **kwargs)


def run_init(action):
    for script in get_init_scripts(reverse = (action == "stop")):
        if os.access(script, os.X_OK):
            subprocess.call((script, action), stdout=sys.stdout, stderr=sys.stderr)


def stop_handler(signal, *args):
    unregister_stop_handler()
    print " /!\ Shutting down..."
    run_init("stop")
    supervisord.send_signal(signal)

def unregister_stop_handler():
    signal.signal(signal.SIGINT, signal.SIG_DFL)
    signal.signal(signal.SIGQUIT, signal.SIG_DFL)
    signal.signal(signal.SIGTERM, signal.SIG_DFL)

def register_stop_handler():
    signal.signal(signal.SIGINT, stop_handler)
    signal.signal(signal.SIGQUIT, stop_handler)
    signal.signal(signal.SIGTERM, stop_handler)


def main():
    wait_for_etcd()
    run_init("start")

    register_stop_handler()
    supervisord.wait()


if __name__ == "__main__":
    os.environ['IP_ADDR'] = get_ip()
    supervisord = subprocess.Popen([
        "/usr/bin/supervisord", "-n", "-c", "/etc/supervisord.conf"
    ], stdout=sys.stdout, stderr=sys.stderr)
    main()
