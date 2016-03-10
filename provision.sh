#!/usr/bin/env bash

sudo locale-gen en_US.UTF-8
sudo update-locale LANG=en_US.UTF-8
sudo update-locale LC_ALL=en_US.UTF-8

sudo apt-get update
sudo apt-get install -y build-essential git curl libxslt1-dev libxml2-dev libssl-dev

# postgres
echo "deb http://apt.postgresql.org/pub/repos/apt/ precise-pgdg main " | sudo tee -a /etc/apt/sources.list.d/pgdg.list
sudo wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
sudo apt-get update
sudo apt-get install -y postgresql-9.3 libpq-dev
echo '# "local" is for Unix domain socket connections only
local   all             all                                  trust
# IPv4 local connections:
host    all             all             0.0.0.0/0            trust
# IPv6 local connections:
host    all             all             ::/0                 trust' | sudo tee /etc/postgresql/9.3/main/pg_hba.conf
sudo sed -i "s/#listen_addresses = 'localhost'/listen_addresses = '*'/g" /etc/postgresql/9.3/main/postgresql.conf
sudo /etc/init.d/postgresql restart
sudo su - postgres -c 'createuser -s vagrant'

# # redis
# sudo apt-get install -y python-software-properties
# sudo add-apt-repository -y ppa:rwky/redis
# sudo apt-get update
# sudo apt-get install -y redis-server

# java 8
sudo add-apt-repository -y ppa:webupd8team/java
sudo apt-get update
echo "oracle-java8-installer shared/accepted-oracle-license-v1-1 select true" | sudo debconf-set-selections
sudo apt-get install -y oracle-java8-installer


# rvm and ruby
su - vagrant -c 'gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3'
su - vagrant -c '\curl -sSL https://get.rvm.io | bash -s stable --ruby --rails'
su - vagrant -c 'rvm rvmrc warning ignore allGemfiles'

# node
su - vagrant -c 'curl https://raw.githubusercontent.com/creationix/nvm/v0.14.0/install.sh | sh'
su - vagrant -c 'nvm install 0.10'
su - vagrant -c 'nvm alias default 0.10'

# echo "All done installing!
# Next steps: type 'vagrant ssh' to log into the machine."