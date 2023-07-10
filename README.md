# toolkit

[![ci](https://github.com/geocoug/toolkit/actions/workflows/build-and-deploy.yml/badge.svg)](https://github.com/geocoug/toolkit/actions/workflows/build-and-deploy.yml)
[![website status](https://img.shields.io/website.svg?down_color=red&down_message=down&up_color=green&up_message=up&url=http%3A%2F%2Ftoolkit.geocoug.com)](https://toolkit.geocoug.com)

Website containing a collection of resources I use on a regular basis, build with [Quarto](https://quarto.org/docs/websites/).

## Getting Started

### Setup

1. Clone the repository: `git clone https://github.com/geocoug/toolkit.git`
2. Move into the cloned repository: `cd toolkit`
3. Create a Python virtual environment and activate it
   1. **Windows**: `python3 -m venv .venv; .\.venv\Scripts\activate`
   2. **Linux/MacOS**: `python3 -m venv .venv && source ./.venv/bin/activate`

   The Python virtual environment needs to be activated when rendering or previewing the site. This is because Quarto uses Python kernels to run code chunks embeded within the `.qmd` documents.

4. Install the Python requirements: `python -m pip install -r requirements.txt`
5. (*optional*) Install `pre-commit` hooks: `python -m pre_commit install --install-hooks`
   > [Pre-commit](https://pre-commit.com/) hooks are composed of linters and formatters specifically selected for this project. Pre-commit will help keep our code files clean and make sure we are following best practices before committing changes. The pre-commit package is included in our Python [requirements](./requirements.txt). Hooks will run on the current commit snapshot when executing a `git commit`.

### Contributing

The following steps assume you have already completed all [setup](#setup) procedures.

1. Pull the latest changes from GitHub:
   1. Checkout the main branch `git checkout main`
   2. Pull changes from the remote (GitHub) repository:  `git pull origin main`
   3. Create or checkout a new branch to make changes:
      1. Creating a new branch: `git checkout -b <branch-name>`
      2. Checkout an existing branch: `git checkout <branch-name>`
2. Activate the Python virtual environment:
   1. **Windows**: `.\.venv\Scripts\activate`
   2. **Linux/MacOS**: `source ./.venv/bin/activate`
3. Start the preview server to see changes in real-time: `quarto preview`
4. Make changes to an existing `.qmd` file, or create a new one. When creating new files and folders, follow [Kebab case](https://en.wikipedia.org/wiki/Letter_case#Kebab_case)
   1. When creating new `.qmd` files, you will need to restart the preview server for Quarto to recognize them: `CTRL+C` to stop the server, then `quarto preview` to restart.
5. Update [`_quarto.yml`](_quarto.yml) if changes to the repository structure are made.
6. If using `pre-commit`, now is a good time to check files for issues: `python -m pre_commit run --all-files`.
7. Once finished, render the site (this may take a couple minutes): `quarto render`
8. Stage your changes with git: `git add <files>`
   1. To stage all modified files: `git add --all`
9. Narrate and commit changes: `git commit -m "YOUR COMMIT MESSAGE"`
   1. If you've installed `pre-commit`, it may halt your commit and prompt you to fix any linting errors. Make the changes, re-render the site, stage, changes, and try again.
10. Push changes to the remote: `git push origin <branch-name>`

### Syntax

The site uses [markdown](https://quarto.org/docs/authoring/markdown-basics.html) syntax, which is a plain text format that is designed to be easy to write, and, even more importantly, easy to read:

## Quarto Extensions

- [black-formatter](https://github.com/shafayetShafee/black-formatter)
- [fontawesome](https://github.com/quarto-ext/fontawesome)
- [interactive-sql](https://github.com/shafayetShafee/interactive-sql)
