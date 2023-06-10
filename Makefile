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
