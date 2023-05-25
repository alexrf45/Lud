#!/bin/bash

function install_go() {
	file=$(curl -Ls https://go.dev/dl | grep -oP '(?<=<a class="download downloadBox" href="/dl/).*linux.*(?=">)')

	version=$(echo "$file" | grep -oP '(?<=go).*(?=.linux)')

	wget "https://go.dev/dl/$file" -q --show-progress &&
		rm -rf /usr/local/go &&
		sudo tar -C /usr/local/bin -xzf "$file" &&
		rm "$file"

}

function go-dorks() {
	wget -q https://github.com/dwisiswant0/go-dork/releases/download/v1.0.2/go-dork_1.0.2_linux_amd64 -O go-dork &&
		mv go-dork /home/ubuntu/.local/go-dork &&
		chmod +x /home/ubuntu/.local/go-dork
}

function rush() {
	wget https://github.com/shenwei356/rush/releases/download/v0.5.0/rush_linux_amd64.tar.gz -O rush.tar.gz &&
		gunzip rush.tar.gz && tar -xf rush.tar && rm rush.tar && mv rush /home/ubuntu/.local/rush && chmod +x /home/ubuntu/.local/rush
}

install_go
httprobe
go-dorks

wget https://github.com/alexrf45/Lud/raw/main/sources/jsleak -O jsleak &&
	mv jsleak /home/ubuntu/.local/jsleak

. ~/.zshrc

go install github.com/projectdiscovery/katana/cmd/katana@latest

go install -v github.com/owasp-amass/amass/v3/...@master

go install -v github.com/projectdiscovery/chaos-client/cmd/chaos@latest

go install github.com/hakluke/hakrevdns@latest

go install -v github.com/projectdiscovery/dnsx/cmd/dnsx@latest

go install github.com/lc/gau/v2/cmd/gau@latest

go install github.com/shenwei356/rush@latest

go install github.com/hakluke/hakrawler@latest

go install github.com/tomnomnom/waybackurls@latest

go install github.com/tomnomnom/unfurl@latest

go install github.com/tomnomnom/httprobe@latest

go install -v github.com/projectdiscovery/httpx/cmd/httpx@latest

go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest

go install -v github.com/projectdiscovery/notify/cmd/notify@latest

wget https://raw.githubusercontent.com/Bo0oM/fuzz.txt/master/fuzz.txt -O /home/ubuntu/wordlists/fuzz.txt

wget https://github.com/arkadiyt/ubuntu-targets-data/blob/master/data/domains.txt -O /home/ubuntu/overall-scope.txt
