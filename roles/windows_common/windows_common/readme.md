# Documentation

## Purpose

To have a template repository with the minimum required pre-commit hooks ready to ensure developers are able to work without obstacles from security and linting checks but also a customisable platform for them to build on to help improve code quality.

### Technology
We're using Pre-Commit Hooks and configuration from [https://pre-commit.com/](https://pre-commit.com/)

## History

|Version                |Author                          |Date|Changes
|----------------|-------------------------------|-----------------------------|-----------------------------|
|v0.1|Gareth Evans|01/03/2020|Initial Version
|v0.2|Gareth Evans|09/11/2020|Updated versions of components, added installation/setup for pre-commit, detect secrets and detect secrets use command lines.
|v0.3|Gareth Evans|10/11/2020|Added Ansible Linter.

## Under the bonnet/hood

### Security Tools
|Name                |Version                          |URL                         |
|----------------|-------------------------------|-----------------------------|
|**Detect Secrets**|v0.14.3            |https://github.com/Yelp/detect-secrets|

### Linting/Validation Tools
|Name                |Version                          |URL                         |
|----------------|-------------------------------|-----------------------------|
|**YAML Linting**|v3.3.0            |https://github.com/pre-commit/pre-commit-hooks
|**JSON Linting**|v3.3.0           |https://github.com/pre-commit/pre-commit-hooks
|**Ansible Linter**|v4.3.7           |https://github.com/ansible/ansible-lint

### Formatting
|Name                |Version                          |URL                         |
|----------------|-------------------------------|-----------------------------|
|**YAML Linting**|v3.3.0            |https://github.com/pre-commit/pre-commit-hooks
|**JSON Linting**|v3.3.0           |https://github.com/pre-commit/pre-commit-hooks
|**Shell Format**|v2.1.4           |https://github.com/jumanjihouse/pre-commit-hooks
|**Shell Check**|v2.1.4           |https://github.com/jumanjihouse/pre-commit-hooks
|**Ansible Linter**|v4.3.7           |https://github.com/ansible/ansible-lint

## Setup

### Developer(s) Machines Setup

#### Pre-Commit
Run```pip install pre-commit``` or ```brew install pre-commit``` on the developer machine to install pre-commit.
https://pre-commit.com/#install

#### Detect Secrets
Run ```pip install detect-secrets``` to install detect-secrets.
https://github.com/Yelp/detect-secrets
https://github.com/Yelp/detect-secrets-server

##### Using Detect-Secrets
To create a new baseline remove the .secrets.baseline file and run ```detect-secrets audit .secrets.baseline```
To audit a baseline run ```detect-secrets audit .secrets.baseline```
To scan/update a baseline run ```detect-secrets scan --update .secrets.baseline```

A baseline is an "white list" of secrets so the allowed secrets aren't caught in the scans.

#### Ansible Linter
Run ```pip install ansible-lint``` to install the ansible linter.

### Repository Setup
Create a new repository, remember *DO NOT* include any README otherwise it creates a master branch!

Run:
```
git remote add base <urlToThisRepo>
git fetch base
git merge base/master
git push origin master
```

This pulls the content of the base repo into the new repository - similar to copying files from one directory into another but this has the added bonus that if a change is made to the base repository, we can pull those changes in and have the full commit history to go with it.

## How to use

### Setup
To setup the repositroy for running pre-commit run ```pre-commit install```.

### Run automatically.
Make a change and commit your changes, this will run the pre-commit hooks.

### Run manually
To run pre-commit manually, run ```pre-commit run -a```.

### How to bypass
This is only to be used in an emergency as it will bypass the pre-commit hook checks.
```git commit -m "<message>" --no-verify```
