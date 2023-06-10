compile-dev:
	pip-compile --extra dev -o dev-requirements.txt pyproject.toml
.PHONY: .compile-dev

compile:
	pip-compile -o requirements.txt pyproject.toml
.PHONY: .compile

install:
	pip install -r requirements.txt
.PHONY: .install

install-dev:
	pip install -r dev-requirements.txt
.PHONY: .install

start:
	python3 -m src.main
.PHONY: .start

build:
	docker build -t chatgpt-translator:0.1.0 .
.PHONY: .build

start-container:
	docker run --rm --name chatgpt-translator -p 8000:8000 chatgpt-translator:0.1.0
.PHONY: .start-container