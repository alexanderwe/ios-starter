#! /bin/bash

# Run xcodegen to create .xcodeproj file
{%- if cookiecutter.runXcodeGen == 'y' %}
  xcodegen
{%- endif %}

# Install cocoapods dependecies
{%- if cookiecutter.runCocoaPods == 'y' %}
  pod install
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

printf 'all done - enjoy 🤓'