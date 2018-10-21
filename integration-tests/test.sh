#!/bin/sh

echo "Waiting spring to launch on 8080..."
while ! nc -z web 8080; do   
  sleep 0.5 # wait for 1/10 of the second before check again
done

echo "Lauching integration-tests..."
wget web:8080/ && grep 'Hello World!' index.html
