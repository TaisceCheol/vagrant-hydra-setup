#!/usr/bin/env bash

echo "Running post provision script..."

# vim setup 
echo "set number" >> ~/.vimrc
echo "syntax on" >> ~/.vimrc
echo "set expandtab" >> ~/.vimrc

# # initialize hydra rails project
mkdir /vagrant/hydra && cd $_
rails new itma.hydra && cd itma.hydra

echo "gem 'therubyracer', platforms: :ruby" >> Gemfile && bundle install
# git init .
# git add . 
# git commit -m "Irish Traditional Music Archive Hydra Repository Test Application"

echo "gem 'hydra', '9.1.0'" >> Gemfile && bundle install
# git add . 
# git commit -m "Added Hydra dependency to Gemfile"

rails generate hydra:install

# git add .
# git commit -m "Ran hydra generator"

# echo "All ready to go; time to boot up Solr && Fedora!"

