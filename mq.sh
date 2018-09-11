#!/bin/sh
docker ps;
docker stop mq_test_38888;
docker rm mq_test_38888;
if [ "$1" != "stop" ]; then
    echo "start mq docker ...";
    docker run -p 38888:5672 --name mq_test_38888 -d rabbitmq;
else
    echo "stop mq docker finish..."
fi
