#! /bin/bash
### Script for rails env.

echo "nodejs설치"
curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

sudo apt-get update
sudo apt-get install git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev software-properties-common libffi-dev nodejs yarn -y

echo "루비 설치"
if [ ! -d ~/.rbenv ]; then
    git clone https://github.com/rbenv/rbenv.git ~/.rbenv
    echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
    echo 'eval "$(rbenv init -)"' >> ~/.bashrc
fi

if [ ! -d ~/.rbenv/plugins/ruby-build ]; then
    git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
    echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bashrc
fi

export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"
eval "$(rbenv init -)"

if [ ! -e .rbenv/versions/2.5.1 ]; then
echo "2.5.1 설치"
  rbenv install 2.5.1    
  rbenv global 2.5.1
  ruby -v
fi

if [ ! -e .rbenv/shims/bundle ]; then
  gem install bundler
  rbenv rehash
fi

echo "Rails 설치"
gem install rails -v 5.2.0
rbenv rehash
rails -v