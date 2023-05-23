#!/bin/bash

function install_go() {
	wget https://go.dev/dl/go1.20.3.linux-amd64.tar.gz &&
		rm -rf /usr/local/go &&
		sudo tar -C /usr/local -xzf go1.20.3.linux-amd64.tar.gz &&
		rm go1.20.3.linux-amd64.tar.gz
}

function waybackurls_install() {
	wget -q -O waybackurls.tgz https://github.com/tomnomnom/waybackurls/releases/download/v0.1.0/waybackurls-linux-amd64-0.1.0.tgz &&
		gunzip waybackurls.tgz &&
		tar -C /home/bounty/.local/ -xf waybackurls.tar &&
		chmod +x /home/bounty/.local/waybackurls &&
		rm /home/bounty/waybackurls.tar

}

function httpx_install() {
	wget -q https://github.com/projectdiscovery/httpx/releases/download/v1.2.9/httpx_1.2.9_linux_amd64.zip &&
		unzip httpx_1.2.9_linux_amd64.zip -d ./httpx &&
		rm httpx_1.2.9_linux_amd64.zip &&
		mv httpx/httpx /home/bounty/.local/http-x &&
		rm -r httpx/
}

function httprobe() {
	wget -q https://github.com/tomnomnom/httprobe/releases/download/v0.2/httprobe-linux-amd64-0.2.tgz &&
		gunzip httprobe-linux-amd64-0.2.tgz &&
		tar -C /home/bounty/.local/ -xf httprobe-linux-amd64-0.2.tar &&
		chmod +x /home/bounty/.local/httprobe &&
		rm /home/bounty/httprobe-linux-amd64-0.2.tar
}

function go-dorks() {
	wget -q https://github.com/dwisiswant0/go-dork/releases/download/v1.0.2/go-dork_1.0.2_linux_amd64 -O go-dork &&
		mv go-dork /home/bounty/.local/go-dork &&
		chmod +x /home/bounty/.local/go-dork
}

function subfinder() {
	wget -q https://github.com/projectdiscovery/subfinder/releases/download/v2.5.7/subfinder_2.5.7_linux_amd64.zip -O subfinder.zip &&
		unzip subfinder.zip &&
		rm subfinder.zip &&
		mv subfinder /home/bounty/.local/subfinder && chmod +x /home/bounty/.local/subfinder
}

function rush() {
	wget https://github.com/shenwei356/rush/releases/download/v0.5.0/rush_linux_amd64.tar.gz -O rush.tar.gz &&
		gunzip rush.tar.gz && tar -xf rush.tar && rm rush.tar && mv rush /home/bounty/.local/rush && chmod +x /home/bounty/.local/rush
}

function unfurl() {
	wget https://github.com/tomnomnom/unfurl/releases/download/v0.0.1/unfurl-linux-amd64-0.0.1.tgz &&
		tar -xzf unfurl-linux-amd64-0.0.1.tgz && rm unfurl-linux-amd64-0.0.1.tgz
	mv unfurl /home/bounty/.local/unfurl
}

install_go
waybackurls_install
httpx_install
httprobe
go-dorks
subfinder
rush
unfurl
sudo dpkg -i /home/bounty/resources/rustscan_2.1.1_amd64.deb
