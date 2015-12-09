#!/bin/bash
# Create new rails app from template
if [ $# -eq 0  ]
  then
    echo "Usage: $0 NEW_RAILS_APP_NAME"
  else
    rails new $1 -m https://raw.github.com/RailsApps/rails-composer/master/composer.rb
fi