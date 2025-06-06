SHELL=/bin/bash
PACKAGE_NAME=jupyterhub
PACKAGE_NAME_FORMATTED=$(subst -,_,${PACKAGE_NAME})
OWNER=ucphhpc
SERVICE_NAME=${PACKAGE_NAME}
IMAGE=${PACKAGE_NAME}

# Enable that the builder should use buildkit
# https://docs.docker.com/develop/develop-images/build_enhancements/
DOCKER_BUILDKIT=1
# NOTE: dynamic lookup with docker as default and fallback to podman
DOCKER = $(shell which docker 2>/dev/null || which podman 2>/dev/null)
# if docker compose plugin is not available, try old docker-compose/podman-compose
ifeq (, $(shell ${DOCKER} help|grep compose))
	DOCKER_COMPOSE = $(shell which docker-compose 2>/dev/null || which podman-compose 2>/dev/null)
else
	DOCKER_COMPOSE = ${DOCKER} compose
endif
$(echo ${DOCKER_COMPOSE} >/dev/null)

-include .env
ARGS=

.PHONY: all
all: init dockerbuild

.PHONY: init
init:
ifeq ($(shell test -e defaults.env && echo yes), yes)
ifneq ($(shell test -e .env && echo yes), yes)
		ln -s defaults.env .env
endif
endif

.PHONY: dockerbuild
dockerbuild:
	${DOCKER} build -f hub/Dockerfile -t $(OWNER)/${IMAGE}:${TAG} ${ARGS} .

.PHONY: dockerclean
dockerclean:
	${DOCKER} rmi -f $(OWNER)/${IMAGE}:${TAG}

.PHONY: dockerpush
dockerpush:
	${DOCKER} push $(OWNER)/${IMAGE}:${TAG}

.PHONY: deamon
daemon:
	${DOCKER} stack deploy -c docker-compose-swarm.yml ${SERVICE_NAME} $(ARGS)

.PHONY: daemon-down
daemon-down:
	${DOCKER} stack rm $(SERVICE_NAME)

.PHONY: up
up:
	${DOCKER_COMPOSE} up -d $(ARGS)

.PHONY: down
down:
	${DOCKER_COMPOSE} down $(ARGS)

.PHONY: clean
clean:
	$(MAKE) dockerclean
	$(MAKE) distclean
	rm -fr .env
	rm -fr .pytest_cache
	rm -fr tests/__pycache__

.PHONY: maintainer-clean
maintainer-clean: distclean
	@echo 'This command is intended for maintainers to use; it'
	@echo 'deletes files that may need special tools to rebuild.'

.PHONY: 
install:
	$(MAKE) install-dep
