IMAGE_USER := alexenge
IMAGE_NAME := r_eeg
IMAGE_TAG := 4.4.1
IMAGE := $(IMAGE_USER)/$(IMAGE_NAME):$(IMAGE_TAG)
PROJECT_DIR := $(CURDIR)

all:
	docker build -t $(IMAGE) $(PROJECT_DIR)

push:
	docker push $(IMAGE)

pull:
	docker pull $(IMAGE)
