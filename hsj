#!/bin/bash

crystal --version

function start() {
  echo "start..."
  nohup ./main >> logs/application.log 2>&1 &
}

function stop() {
  kill `cat app.pid`
  echo "stop."
}

case $1 in
  start) start;;
  stop) stop;;
  restart) stop; start;;
esac
