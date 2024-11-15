IMAGE_NAME := camp-zipnerf
CONTAINER_NAME := camp-zipnerf
DOCKERFILE := Dockerfile
USER_HOME=$(shell echo "$(HOME)")
build:
	docker image build \
    	-t $(IMAGE_NAME) \
    	--build-arg USER_ID=$(id -u) \
    	--build-arg GROUP_ID=$(id -g) \
    	-f $(DOCKERFILE) \
    	.
run:
	docker run \
    	--name $(CONTAINER_NAME) \
    	-it \
    	-v /tmp/.X11-unix:/tmp/.X11-unix \
    	--net=host \
    	-e DISPLAY=$(DISPLAY) \
    	-v $(shell pwd):/app \
    	--ipc host \
    	--gpus all \
    	--device=/dev/dri:/dev/dri \
    	$(IMAGE_NAME):latest \
    	bash
start:
	docker start $(CONTAINER_NAME)
into:
	docker exec -it $(CONTAINER_NAME) bash
stop:
	docker stop $(CONTAINER_NAME)
remove:
	docker rm $(CONTAINER_NAME)
