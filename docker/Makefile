# A makefile to build the docker images for caffe.

DOCKER ?= docker

all: jupyter

.PHONY: cpu gosu jupyter

cpu: cpu/Dockerfile
	$(DOCKER) build -t caffe:cpu cpu/

gosu: gpu/Dockerfile
	$(DOCKER) build -t caffe:cpu cpu/
	$(DOCKER) build -t caffe:gosu gosu/

jupyter: jupyter/Dockerfile
	$(DOCKER) build -t caffe:cpu cpu/
	$(DOCKER) build -t caffe:gosu gosu/
	$(DOCKER) build -t caffe:jupyter jupyter/
