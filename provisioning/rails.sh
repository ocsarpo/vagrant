#! /bin/bash
### Script for rails env.

echo "nodejs설치"
curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

sudo rm -rf /var/lib/apt/lists/*
sudo apt-get update  -y
sudo apt-get install git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev software-properties-common libffi-dev nodejs yarn -y

echo "루비 설치 시작"
cd
if [ ! -d ~/.rbenv ]; then
  git clone https://github.com/rbenv/rbenv.git ~/.rbenv
  echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
  echo 'eval "$(rbenv init -)"' >> ~/.bashrc
  exec $SHELL
fi

if [ ! -d ~/.rbenv/plugins/ruby-build ]; then
  git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
  echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bashrc
  exec $SHELL
fi

if [ ! -e .rbenv/versions/2.5.1 ]; then
  echo "ruby 2.5.1 설치"
  rbenv install 2.5.1
  rbenv global 2.5.1
  ruby -v
fi
echo "루비 설치 끝"

if [ ! -e .rbenv/shims/bundle ]; then
  echo "번들러 설치"
  gem install bundler
  rbenv rehash
fi

echo "Rails 설치 시작"
gem install rails -v 5.2.0
rbenv rehash
rails -v
echo "Rails 설치 끝"

echo "디버깅 젬 설치"
gem install ruby-debug-ide -v 0.7.0.beta6
gem install debase -v 0.2.3.beta2
echo "디버깅 젬 설치 끝"
