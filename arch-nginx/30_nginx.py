#!/bin/env python2
import os, sys

def start():
    print " [^] Ensuring log folder..."
    if not os.path.isdir("/var/log/nginx/"):
        os.mkdir("/var/log/nginx")

if __name__ == "__main__":
    if sys.argv[1] == "start":
        start()
