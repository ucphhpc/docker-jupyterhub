OWNER=ucphhpc
IMAGE=jupyterhub
TAG=edge
ARGS=

.PHONY: build

all: clean init build test

init:
ifeq (,$(wildcard ./.env))
	ln -s defaults.env .env
endif

build:
	docker build -t $(OWNER)/$(IMAGE):$(TAG) $(ARGS) hub/

clean:
	docker rmi -f $(OWNER)/$(IMAGE):$(TAG) $(ARGS)

test:
	docker build --rm --force-rm -t $(OWNER)/$(IMAGE):$(TAG)-test $(ARGS) -f ./hub/Dockerfile.test ./hub
	docker run -it $(OWNER)/$(IMAGE):$(TAG)-test

push:
	docker push ${OWNER}/${IMAGE}:${TAG} $(ARGS)
