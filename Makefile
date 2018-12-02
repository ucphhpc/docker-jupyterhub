OWNER=nielsbohr
IMAGE=jupyterhub
TAG=edge

.PHONY: build

all: clean build test push

build:
	docker build -t $(OWNER)/$(IMAGE):$(TAG) hub/

clean:
	docker rmi -f $(OWNER)/$(IMAGE):$(TAG)

test:
	docker build --rm --force-rm -t $(OWNER)/$(IMAGE):$(TAG)-test -f ./hub/Dockerfile.test ./hub
	docker run -it $(OWNER)/$(IMAGE):$(TAG)-test

push:
	docker push ${OWNER}/${IMAGE}:${TAG}
