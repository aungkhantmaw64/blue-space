IMAGE_NAME=blue-space-ci

docker-build-image:
	docker build -t ${IMAGE_NAME} .

docker-container-run:
	docker container run -it --privileged --rm -v ${PWD}:/app ${IMAGE_NAME} bash