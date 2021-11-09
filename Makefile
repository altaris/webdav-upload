NAME	= webdav-upload
TAG	   ?= latest
USER	= altaris

SUDO   ?= sudo

all: check build

build:
	$(SUDO) docker build . -t $(USER)/$(NAME):$(TAG)

check:
	shellcheck ./upload

push:
	$(SUDO) docker push $(USER)/$(NAME):$(TAG)
