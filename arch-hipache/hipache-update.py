#!/usr/bin/env python2

import time
import os
import etcd
import redis
import sys

from redis.exceptions import ConnectionError as RedisConnectionError
from requests.exceptions import ConnectionError as RequestsConnectionError

ETCD_PATH=os.environ.get('ETCD_HIPACHE_PATH', '/hipache')
ETCD_ADDR=os.environ.get('ETCD_ADDR', '127.0.0.1:4001')
ETCD_HOST, ETCD_PORT = ETCD_ADDR.split(':')
REDIS_HOST=os.environ.get('REDIS_HOST', '127.0.0.1')
REDIS_PORT=os.environ.get('REDIS_PORT', 6379) 

redis = redis.StrictRedis(host=REDIS_HOST, port=REDIS_PORT)

def parse_key(result_key):
    return result_key.split('/')[-2:]

def get_from_result(result):
    return get_from_pair(result.key, (result.value if result.action == "SET" else result.prevValue))

def get_from_pair(key, value):
    domain, container_hostname = parse_key(key)
    return domain, container_hostname, ("http://%s" % value)

def clear(domain):
    if not redis.exists("frontend:%s" % domain):
        redis.rpush("frontend:%s" % domain, domain)
    else:
        redis.ltrim("frontend:%s" % domain, 0, 0)

def perform_set(domain, container_hostname, address):
    if not redis.exists("frontend:%s" % domain):
        redis.rpush("frontend:%s" % domain, domain)

    if address not in redis.lrange("frontend:%s" % domain, 1, -1):
        redis.rpush("frontend:%s" % domain, address)

def perform_delete(domain, container_hostname, address):
    if address in redis.lrange("frontend:%s" % domain, 1, -1):
        redis.lrem("frontend:%s" % domain, 0, address)

def perform_action(action, domain, container_hostname, address):
    verb = "added" if action == "SET" else "removed"
    sys.stdout.write("Backend %s %s (domain %s | container %s)" % (address, verb, domain, container_hostname))
 
    action_func = perform_set if action == "SET" else perform_delete
    action_func(domain, container_hostname, address)
 
    print " backends:\n  %s" % "\n  ".join(redis.lrange("frontend:%s" % domain, 1, -1))

def updater():
    while True:
        result = client.watch(ETCD_PATH)
        perform_action(result.action, *get_from_result(result))

def init():
    for frontend in redis.keys("frontend:*"):
        clear(frontend.split(':')[-1])

    for key, value in client.get_recursive(ETCD_PATH).iteritems():
        domain, container_hostname, address = get_from_pair(key, value)
        clear(domain)
        perform_action("SET", domain, container_hostname, address)    

if __name__ == "__main__":
    print "Starting hipache updater..."
    
    while True:
        try:
             redis.ping()
             client = etcd.Etcd(host=ETCD_HOST, port=ETCD_PORT) 
        except RedisConnectionError as e:
            print "Waiting for Redis..."
            print e
            time.sleep(1)
        except RequestsConnectionError as e:
            print "Waiting for Etcd..."
            print e
            time.sleep(1)
        else:
            break

    init()
    updater()
