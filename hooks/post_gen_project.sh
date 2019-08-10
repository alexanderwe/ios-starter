#! /bin/bash

{%- if cookiecutter.runXcodeGen == 'y' %}
  xcodegen
{%- endif %}

{%- if cookiecutter.runCocoaPods == 'y' %}
  pod install
{%- endif %}


{%- if cookiecutter.runXcodeGen == 'y' %}
  xed .
{%- endif %}

git init
mv commit-msg .git/hooks/commit-msg
chmod u+x .git/hooks/commit-msg

printf 'all done - enjoy 🤓'