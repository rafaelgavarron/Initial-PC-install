#!/bin/bash

echo "Hello, welcome to script to first initial install your PC"

echo "This script will do the following steps:"
sleep 1
echo "We will update your PC first and install these softwares:"
echo "Docker"
echo "NVM (node version manager) node.js"
echo "Install and configure git"
echo "Install and configure github CLI"
echo "Install vscode"
echo "Install vim and neovim"
echo "Install zsh and turn the default shell"
read -p "Do you wanna proceed? [Y/n]: " answer
if [[ "$answer" != "Y" && "$answer" != "y" && "$answer" != "" ]]; then
  echo "Execution cancelled."
  exit 1
fi

echo "Updating your PC...."
sleep 0.5

if sudo -n true 2>/dev/null; then
    echo "You already have administrator rights, proceeding..."
else
    echo "Type your password to grant administrator rights and proceed to script:"
    if sudo true; then
        echo "Permission granted. Proceeding..."
    fi
fi
"sudo apt update ; sudo apt upgrade -y ; sudo apt dist-upgrade -y" &> /dev/null

# Add Docker's official GPG key:
sudo apt update &> /dev/null
sudo apt install ca-certificates curl &> /dev/null
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc
sudo cat README.md | pv | of=/tmp/readme.log bs=4M

# # Add the repository to Apt sources:
# echo \
#   "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
#   $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
#   sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
# sudo apt update
# sudo apt install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y

# # Install NVM (Node Version Manager)
# curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.0/install.sh | bash

# # Download and install Node.js (Maybe need reboot the terminal)
# nvm install --lts 

# # Install Git
# sudo apt install git-all -y

# # Configure git

# echo "What is your username?"
# read username
# git config --global user.name "$username"               

# echo "What is your email?"
# read email
# git config --global user.email "$email"

# #Install github
# (type -p wget >/dev/null || (sudo apt update && sudo apt-get install wget -y)) \
# 	&& sudo mkdir -p -m 755 /etc/apt/keyrings \
# 	&& wget -qO- https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo tee /etc/apt/keyrings/githubcli-archive-keyring.gpg > /dev/null \
# 	&& sudo chmod go+r /etc/apt/keyrings/githubcli-archive-keyring.gpg \
# 	&& echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
# 	&& sudo apt update \
# 	&& sudo apt install gh -y

# #Install vscode
# sudo apt update
# sudo apt install software-properties-common apt-transport-https wget -y
# wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
# sudo add-apt-repository "deb [arch=$(dpkg --print-architecture)] https://packages.microsoft.com/repos/vscode stable main"
# sudo apt update
# sudo apt install code -y

# #Install vim
# sudo apt install vim -y
# sudo add-apt-repository ppa:neovim-ppa/stable
# sudo apt-get update
# sudo apt-get install neovim


# #Instalar o zsh
# sudo apt install zsh -y

# #Deixar o zsh como padrão
# chsh -s $(which zsh)

# #Instalar o Oh my ZSH
# sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# #Instalar os plugins Zsh
#    # plugin zsh syntax highlighting
# # Variáveis para os caminhos dos plugins
# ZSH_CUSTOM=${ZSH_CUSTOM:-~/.oh-my-zsh/custom}
# ZSHRC=~/.zshrc

# # Repositórios dos plugins
# SYNTAX_HIGHLIGHTING_REPO="https://github.com/zsh-users/zsh-syntax-highlighting"
# AUTOSUGGESTIONS_REPO="https://github.com/zsh-users/zsh-autosuggestions"

# # Função para clonar o plugin se não existir
# install_plugin() {
#     local repo=$1
#     local folder=$2
#     if [ ! -d "$folder" ]; then
#         echo "Instalando plugin: $folder"
#         git clone "$repo" "$folder"
#     else
#         echo "Plugin já instalado: $folder"
#     fi
# }

# # Instalar plugins
# install_plugin "$SYNTAX_HIGHLIGHTING_REPO" "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting"
# install_plugin "$AUTOSUGGESTIONS_REPO" "$ZSH_CUSTOM/plugins/zsh-autosuggestions"

# # Adicionar plugins ao arquivo .zshrc, se necessário
# if ! grep -q "zsh-syntax-highlighting" "$ZSHRC"; then
#     sed -i 's/plugins=(\(.*\))/plugins=(\1 zsh-syntax-highlighting)/' "$ZSHRC"
#     echo "Adicionado zsh-syntax-highlighting ao .zshrc"
# fi

# if ! grep -q "zsh-autosuggestions" "$ZSHRC"; then
#     sed -i 's/plugins=(\(.*\))/plugins=(\1 zsh-autosuggestions)/' "$ZSHRC"
#     echo "Adicionado zsh-autosuggestions ao .zshrc"
# fi

# zs
# # Recarregar o shell
# echo "Recarregando o shell"
# source "$ZSHRC"

# #Criar arquivo .zsh_aliases

# echo "Instalação e configuração concluídas!"

# echo "Deleting obsolete packages..."
# #Remoção dos pacotes obsoletos
# sudo apt autoremove -y > /dev/null