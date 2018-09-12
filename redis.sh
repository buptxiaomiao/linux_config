#########################################################################
#!/bin/bash

# File Name: redis.sh
# Author: buptxiaomiao
# mail: buptwjh@outlook.com
# Created Time: 二  9/11 16:32:01 2018
#########################################################################

docker stop redis_6379
docker rm redis_6379

if [ "$1" != "stop" ]; then
    docker run -p 6379:6379 -v ~/data/redis/:/data/ --name redis_6379 -d redis
    #docker run -p 6379:6379 --name redis_6379 -d redis
    echo "start docker redis——6379 finish..."
    docker ps
else
    echo "stop redis-6479 finish."
fi
