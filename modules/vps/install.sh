#! /bin/bash

apt-get update && apt-get install -y zsh wget curl tmux python3 tmuxp

curl -fsSL https://get.docker.com -o get-docker.sh

sh get-docker.sh

usermod -aG docker ubuntu

sudo -u ubuntu -i <<'EOF'

sudo apt update

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

wget https://raw.githubusercontent.com/alexrf45/Lud/main/config/zsh/ka-tet.zsh-theme -O ~/.oh-my-zsh/themes/ka-tet.zsh-theme

wget https://raw.githubusercontent.com/alexrf45/Lud/main/config/zsh/zshrc -O /home/ubuntu/.zshrc

wget https://raw.githubusercontent.com/alexrf45/Lud/main/config/tmux.conf -O /home/ubuntu/.tmux.conf

mkdir -p /home/ubuntu/.tmux

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

cp .zshrc .zlogin && touch ~/.hushlogin

git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

mkdir -p /home/ubuntu/.logs && mkdir /home/ubuntu/.local && mkdir /home/ubuntu/wordlists

wget https://raw.githubusercontent.com/alexrf45/Lud/main/sources/packages.sh && chmod +x packages.sh && ./packages.sh && rm packages.sh

wget https://raw.githubusercontent.com/alexrf45/Lud/main/sources/tools.sh && chmod +x tools.sh && ./tools.sh && rm tools.sh

wget https://github.com/alexrf45/Lud/raw/main/sources/jsleak -O /home/ubuntu/.local/jsleak && chmod +x /home/ubuntu/.local/jsleak

wget https://raw.githubusercontent.com/alexrf45/Lud/main/config/zsh/bounty_history -O /home/ubuntu/.bounty_history

wget https://raw.githubusercontent.com/janmasarik/resolvers/master/resolvers.txt

wget https://raw.githubusercontent.com/alexrf45/Lud/main/config/recon.sh && chmod +x recon.sh && mv recon.sh /home/ubuntu/.local/recon.sh

EOF

chsh -s /usr/bin/zsh ubuntu

reboot
