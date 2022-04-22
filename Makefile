.DEFAULT_GOAL := all
isort = isort pynuclino tests
black = black pynuclino tests

.PHONY : docs
docs :
	rm -rf docs/build/
	sphinx-autobuild -b html --watch pynuclino/ docs/source/ docs/build/

.PHONY: virtualenv
virtualenv:
	@echo "Creating virtualenv ... Make sure to have miniconda installed"
	conda create -n pynuclino python=3.9
	@echo "Environment succesfully created please run conda activate pynuclino"


.PHONY: install
install:
	pip install -U pip
	pip install -r requirements.txt
	pip install -r dev-requirements.txt
	pre-commit install

.PHONY: format
format:
	$(isort)
	$(black)

.PHONY: lint
lint:
	flake8 --max-complexity 10 --max-line-length 79 --ignore E203,W503 pynuclino tests
	$(isort) --check-only --df
	$(black) --check

.PHONY: clean
clean:
	rm -rf `find . -name __pycache__`
	rm -f `find . -type f -name '*.py[co]' `
	rm -f `find . -type f -name '*~' `
	rm -f `find . -type f -name '.*~' `
	rm -rf .cache
	rm -rf .pytest_cache
	rm -rf .mypy_cache
	rm -rf htmlcov
	rm -rf *.egg-info
	rm -f .coverage
	rm -f .coverage.*
	rm -rf build