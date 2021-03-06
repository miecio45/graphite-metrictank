#!/bin/sh

WAIT_TIMEOUT=${WAIT_TIMEOUT:-10}

for endpoint in $(echo $WAIT_HOSTS | tr "," "\n"); do
  _start_time=$(date +%s)  
  while true; do
    _now=$(date +%s)
    _run_time=$(( $_now - $_start_time ))
    if [ $_run_time -gt $WAIT_TIMEOUT ]; then
        echo "timed out waiting for $endpoint"
        break 
    fi
    echo "waiting for $endpoint to become up..."
    host=${endpoint%:*}
    port=${endpoint#*:}
    nc -z $host $port && echo "$endpoint is up!" && break
    sleep 1
  done
done

export GRAPHITE_API_CONFIG=${GRAPHITE_API_CONFIG:-/etc/graphite-metrictank/graphite-metrictank.yaml}

exec /usr/share/python/graphite/bin/python /usr/share/python/graphite/bin/gunicorn graphite_api.app:app -c /etc/graphite-metrictank/gunicorn_conf.py $@
