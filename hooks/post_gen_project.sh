#! /bin/bash

# Run xcodegen to create .xcodeproj file
{%- if cookiecutter.runXcodeGen == 'y' %}
  xcodegen
{%- endif %}

# Install Mint dependecies
{%- if cookiecutter.runMintBootstrap == 'y' %}
  mint bootstrap
{%- endif %}

# If xcodegen has generated a .xcodeproj file we want to open it
{%- if cookiecutter.runXcodeGen == 'y' %}
  xed .
{%- endif %}

# Set up git 
git init

## Configure git hooks
chmod +x ./.githooks/commit-msg
git config core.hooksPath .githooks

## Patch for GitKraken not using hooks configured via `git config core.hooksPath`, see https://stackoverflow.com/questions/51698712/does-git-kraken-support-global-git-hooks
cp ./.git/hooks/commit-msg.sample ./.git/hooks/commit-msg.sample.backup
cp ./.githooks/commit-msg ./.git/hooks/commit-msg
cp ./.githooks/verify_conventional_commit ./.git/hooks/verify_conventional_commit

## Make initial commit
git add .
git commit -m "chore(initial): Initial commit"

printf 'all done - enjoy your new project 🤓'