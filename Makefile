IMAGE_NAME=blue-space-ci
APP_PATH=/opt/zephyrproject/app

docker-build-image:
	docker build -t ${IMAGE_NAME} .

docker-run-container:
	docker container run -it --privileged --rm -v ${PWD}:${APP_PATH} ${IMAGE_NAME} bash