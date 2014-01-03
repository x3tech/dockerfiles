#!/bin/env python2
import os, sys, subprocess

IP_ADDR = os.environ['IP_ADDR']
HOSTNAME=os.environ['HOSTNAME']
ETCD_ADDR=os.environ['ETCD_PORT_4001_TCP'].replace('tcp://', '')
HIPACHE_PATH=os.environ.get('HIPACHE_PATH', '/hipache')
WEB_HOSTNAMES=os.environ['WEB_HOSTNAME'].split('|')
WEB_PORT=os.environ.get('WEB_PORT', '80')
HIPACHE_BASE_URL = 'http://%s/v1/keys%s' % (ETCD_ADDR, HIPACHE_PATH)

def call(*args, **kwargs):
    kwargs['shell'] = True
    print subprocess.check_output(*args, **kwargs)

def start():
    print " [^] Registering domain names in etcd..."
    for web_hostname in WEB_HOSTNAMES:
        url = "%s/%s/%s" % (HIPACHE_BASE_URL, web_hostname, HOSTNAME)
        call('curl -SsL "%s" -d "value=%s:%s" > /dev/null' % (url, IP_ADDR, WEB_PORT))

def stop():
    print " [v] Removing domain names from etcd..."
    for web_hostname in WEB_HOSTNAMES:
        url = "%s/%s/%s" % (HIPACHE_BASE_URL, web_hostname, HOSTNAME)
        call('curl -SsL "%s" -X DELETE > /dev/null' % url)

if __name__ == "__main__":
    if sys.argv[1] == "start":
        start()
    elif sys.argv[1] == "stop":
        stop()
