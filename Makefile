.PHONY: install test lint format run doctor clean

install:
	uv sync
	uv add --dev ruff pytest mypy pre-commit
	uv run pre-commit install

test:
	uv run pytest

lint:
	uv run ruff check .

format:
	uv run ruff format .

doctor:
	uv run ai-dev doctor

run:
	uv run ai-dev --help

clean:
	find . -type d -name "__pycache__" -exec rm -rf {} +
	