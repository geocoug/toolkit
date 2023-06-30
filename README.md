# toolkit

[![ci](https://github.com/geocoug/toolkit/actions/workflows/build-and-deploy.yml/badge.svg)](https://github.com/geocoug/toolkit/actions/workflows/build-and-deploy.yml)
[![website status](https://img.shields.io/website.svg?down_color=red&down_message=down&up_color=green&up_message=up&url=http%3A%2F%2Ftoolkit.geocoug.com)](https://toolkit.geocoug.com)

Website containing a collection of resources I use on a regular basis, build with [Quarto](https://quarto.org/docs/websites/).

## Getting Started

### Setup

1. Clone the repository: `git clone https://github.com/geocoug/toolkit.git && cd toolkit`
1. Create a Python virtual environment and activate it
   1. **Windows**: `python3 -m venv .venv; .\.venv\Scripts\activate`
   1. **Linux/MacOS**: `python3 -m venv .venv && source ./.venv/bin/activate`
1. Install the Python requirements: `python -m pip install -r requirements.txt`
1. (*optional*) Install `pre-commit` hooks: `python -m pre_commit install --install-hooks`
   > [Pre-commit](https://pre-commit.com/) hooks are composed of linters and formatters specifically selected for this project. Pre-commit will help keep our code files clean and make sure we are following best practices before committing changes. The pre-commit package is included in our Python [requirements](./requirements.txt). Hooks will run on the current commit snapshot when executing a `git commit`.

### Contributing

1. Pull the latest changes from GitHub:
   1. Checkout the main branch `git checkout main`
   2. Pull changes from the remote (GitHub) repository:  `git pull origin main`
   3. Create/checkout a new branch to make changes: `git checkout -b <branch-name>`
2. Activate the Python virtual environment:
   1. **Windows**: `python3 -m venv .venv; .\.venv\Scripts\activate`
   2. **Linux/MacOS**: `python3 -m venv .venv && source ./.venv/bin/activate`
3. Start the preview server to see changes in real-time: `quarto preview` or `make preview`
4. Make changes to an existing `.qmd` file, or create a new one.
   1. When creating new files and folders, follow [Kebab case](https://en.wikipedia.org/wiki/Letter_case#Kebab_case)
5. Update [`_quarto.yml`](_quarto.yml) if changes to the repository structure are made.
6. Staged your changes with git: `git add <files>`
7. Narrate and commit changes: `git commit -m "YOUR COMMIT MESSAGE"`
   1. At this point, `pre-commit` may halt your commit and prompt you to fix any linting errors. Make the changes, stage changes, and try again.
8. Push changes to the remote: `git push origin <branch-name>`

### Using the Makefile

The [Makefile](./Makefile) can be used to specify commands and simplify usage of this repository. Available rules are:

| Rule | Description |
| --- | --- |
**clean** | Remove temporary files
**lint** | Run linters with pre-commit
**preview** | Start a preview server
**render** | Render the site
**update** | Update pip and pre-commit hooks

To execute a rule, simply enter the command `make <rule>`.

### Syntax

The site uses [markdown](https://quarto.org/docs/authoring/markdown-basics.html) syntax, which is a plain text format that is designed to be easy to write, and, even more importantly, easy to read. In addition to markdown, Quarto allows for execution of [code chunks](https://quarto.org/docs/computations/python.html) written in Python, R, Julia, and Observable.

Check out the [Quarto documentation for creating a website](https://quarto.org/docs/websites/) for more information.

## Quarto Extensions

- [black-formatter](https://github.com/shafayetShafee/black-formatter)
- [downloadthis](https://github.com/shafayetShafee/downloadthis)
- [fontawesome](https://github.com/quarto-ext/fontawesome)
- [interactive-sql](https://github.com/shafayetShafee/interactive-sql)
