# Makefile

SHARELATEX_BASE_TAG := sharelatex/sharelatex-base
SHARELATEX_TAG := sharelatex/sharelatex
SHARELATEX_FULL_TAG := hoangtnm/sharelatex

build-base:
	docker build -f Dockerfile-base -t  $(SHARELATEX_BASE_TAG) .


build-community:
	docker build --build-arg SHARELATEX_BASE_TAG=$(SHARELATEX_BASE_TAG) -f Dockerfile -t $(SHARELATEX_TAG) .


build-community-full:
	docker build --build-arg SHARELATEX_TAG=$(SHARELATEX_TAG) -f Dockerfile-full -t $(SHARELATEX_FULL_TAG) .


PHONY: build-base build-community build-community-full
