all: build

include .env
export

build:
	docker build --build-arg CYPRESS_VERSION=$(CYPRESS_VERSION) --build-arg CYPRESS_IMAGE_VERSION=$(CYPRESS_IMAGE_VERSION) --no-cache=true -t mheers/cypress:$(CYPRESS_VERSION)_$(CYPRESS_IMAGE_VERSION) .

push:
	docker push mheers/cypress:$(CYPRESS_VERSION)_$(CYPRESS_IMAGE_VERSION)

start:
	docker-compose up
