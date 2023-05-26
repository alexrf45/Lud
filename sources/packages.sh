#!/bin/bash

function base() {
	sudo apt-get install -y wget curl man git zsh \
		tmux ruby ruby-dev vim nano p7zip-full \
		djvulibre-bin python3-pip libpcap-dev jq figlet lolcat golang
}

base

function network() {
	sudo apt-get install -y netcat-traditional rlwrap nmap \
		netdiscover masscan dnsutils tcpdump \
		ftp telnet iputils-ping iproute2 proxychains prips
}

network

function web() {
	sudo apt-get install -y whatweb exiftool \
		default-mysql-client postgresql arjun crunch sqlmap
}

web
