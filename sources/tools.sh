#!/bin/bash

function install_go() {
	file=$(curl -Ls https://go.dev/dl | grep -oP '(?<=<a class="download downloadBox" href="/dl/).*linux.*(?=">)')

	version=$(echo "$file" | grep -oP '(?<=go).*(?=.linux)')

	wget "https://go.dev/dl/$file" -q --show-progress &&
		rm -rf /usr/local/go &&
		sudo tar -C /usr/local/bin -xzf "$file" &&
		rm "$file"
}

function waybackurls_install() {
	wget -q -O waybackurls.tgz https://github.com/tomnomnom/waybackurls/releases/download/v0.1.0/waybackurls-linux-amd64-0.1.0.tgz &&
		gunzip waybackurls.tgz &&
		tar -C /home/bounty/.local/ -xf waybackurls.tar &&
		chmod +x /home/bounty/.local/waybackurls &&
		rm /home/bounty/waybackurls.tar

}

function httpx_install() {
	wget -q https://github.com/projectdiscovery/httpx/releases/download/v1.3.0/httpx_1.3.0_linux_amd64.zip &&
		unzip httpx_1.3.0_linux_amd64.zip -d ./httpx &&
		rm httpx_1.3.9_linux_amd64.zip &&
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

wget https://github.com/alexrf45/Lud/raw/main/sources/hakrawler -O hakrawler &&
	mv hakrawler /home/bounty/.local/hakrawler

wget https://github.com/alexrf45/Lud/raw/main/sources/jsleak -O jsleak &&
	mv jsleak /home/bounty/.local/jsleak

go install -v github.com/owasp-amass/amass/v3/...@master

go install -v github.com/projectdiscovery/chaos-client/cmd/chaos@latest

go install github.com/hakluke/hakrevdns@latest

go install -v github.com/projectdiscovery/dnsx/cmd/dnsx@latest

wget https://raw.githubusercontent.com/Bo0oM/fuzz.txt/master/fuzz.txt -O /home/bounty/wordlists/fuzz.txt

wget https://github.com/arkadiyt/bounty-targets-data/blob/master/data/domains.txt -O /home/bounty/overall-scope.txt
