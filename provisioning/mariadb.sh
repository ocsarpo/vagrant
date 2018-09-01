sudo apt-get remove mariadb-server -y
sudo apt autoremove -y

sudo apt-get install software-properties-common -y

curl -sL "http://keyserver.ubuntu.com/pks/lookup?op=get&search=0xF1656F24C74CD1D8" | sudo apt-key add
sudo add-apt-repository 'deb [arch=amd64,arm64,ppc64el] http://ftp.kaist.ac.kr/mariadb/repo/10.3/ubuntu bionic main'

sudo apt update -y
sudo apt install mariadb-server -y
sudo apt-get install libmysqlclient-dev -y
gem install mysql2
