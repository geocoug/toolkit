VENV = .venv
TIMESLOT=`date +%Y_%m_%d.%H_%M`

# Determine OS
OSFLAG :=
ifeq ($(OS),Windows_NT)
	OSFLAG = WIN32
else
	UNAME_S := $(shell uname -s)
	ifeq ($(UNAME_S),Linux)
		OSFLAG = UNIX
	endif
	ifeq ($(UNAME_S),Darwin)
		OSFLAG = UNIX
	endif
endif
ifeq ($(OSFLAG),UNIX)
	PYPATH = $(VENV)/bin
 	PYTHON = $(PYPATH)/python
	PIP = $(PYPATH)/pip
else
	PYPATH = $(VENV)/Scripts
 	PYTHON = $(PYPATH)/python
	PIP = $(PYPATH)/pip
endif


# Self documenting commands
.DEFAULT_GOAL := help
.PHONY: help
help: ## show this help
	@grep -E '^[a-zA-Z0-9_-]+:.*?## .*$$' $(MAKEFILE_LIST) \
	| awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%s\033[0m|%s\n", $$1, $$2}' \
	| column -t -s '|'

# Create a virtual python environment
$(PYPATH)/activate: requirements.txt
	@python3 -m venv .venv
	@$(PIP) install -U pip
	@$(PIP) install -r requirements.txt

render: $(PYPATH)/activate ## Render the site
	@printf "[$(TIMESLOT)] Rendering site\n"
	@quarto render

preview: $(PYPATH)/activate ## Start a preview server
	@printf "[$(TIMESLOT)] Starting site preview\n"
	@quarto preview

update: $(PYPATH)/activate ## Update pip and pre-commit
	@printf "[$(TIMESLOT)] Updating pip\n"
	@$(PIP) install -U pip
	@printf "[$(TIMESLOT)] Updating pre-commit hooks\n"
	@$(PYTHON) -m pre_commit autoupdate

lint: $(PYPATH)/activate ## Run pre-commit hooks
	@printf "[$(TIMESLOT)] Installing hooks\n"
	@$(PYTHON) -m pre_commit install --install-hooks
	@printf "[$(TIMESLOT)] Linting all files\n"
	@$(PYTHON) -m pre_commit run --all-files

clean:## Remove temporary files
	@rm -rf **/.ipynb_checkpoints
	@rm -rf **/__pycache__
