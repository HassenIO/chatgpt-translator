version := $(shell grep -E '^version\s*=' pyproject.toml | cut -d '"' -f 2)

install:
	@pip-compile -o requirements.txt pyproject.toml
	@pip-compile --extra dev -o dev-requirements.txt pyproject.toml
	@pip install -r dev-requirements.txt
.PHONY: install

format:
	@black .
.PHONY: format

build:
	docker build -t chatgpt-translator:$(version) .
.PHONY: build

start:
	python3 -m src.main
.PHONY: start

start-container:
	docker run --rm --name chatgpt-translator -p 8000:8000 chatgpt-translator:$(version)
.PHONY: start-container