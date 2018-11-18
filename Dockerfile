FROM debian:latest

ENV DEBIAN_FRONTEND noninteractive

RUN \
	apt update														&& \
	apt install -y -q wget gnupg unzip											&& \
	echo 'deb http://download.virtualbox.org/virtualbox/debian stretch contrib' > /etc/apt/sources.list.d/vbox.list		&& \
	wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | apt-key add -					&& \
	apt update														&& \
	apt upgrade -y -q													&& \
	apt install -y -q virtualbox-5.2											&& \
	rm -rf /var/lib/apt/lists

RUN	wget https://releases.hashicorp.com/packer/1.3.1/packer_1.3.1_linux_amd64.zip						&& \
	unzip packer_1.3.1_linux_amd64.zip packer										&& \
	rm packer_1.3.1_linux_amd64.zip												&& \
	mv packer /usr/local/bin

