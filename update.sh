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

echo "Adding Docker repository..."
# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt update

echo "Installing Docker..."
sudo apt install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y

echo "Installing NVM (Node Version Manager)..."
# Install NVM (Node Version Manager)
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.0/install.sh | bash

echo "Loading NVM and installing Node.js LTS..."
# Load NVM into the current shell session
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# Download and install Node.js
nvm install --lts

echo "Installing Git..."
# Install Git
sudo apt install git-all -y

echo "Configuring Git..."
# Configure git
echo "What is your username?"
read -r username
git config --global user.name "$username"

echo "What is your email?"
read -r email
git config --global user.email "$email"

echo "Installing GitHub CLI..."
#Install github
(type -p wget >/dev/null || (sudo apt update && sudo apt-get install wget -y)) \
	&& sudo mkdir -p -m 755 /etc/apt/keyrings \
	&& wget -qO- https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo tee /etc/apt/keyrings/githubcli-archive-keyring.gpg > /dev/null \
	&& sudo chmod go+r /etc/apt/keyrings/githubcli-archive-keyring.gpg \
	&& echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
	&& sudo apt update \
	&& sudo apt install gh -y

echo "Installing Visual Studio Code..."
#Install vscode
sudo apt install software-properties-common apt-transport-https wget -y

# Add Microsoft GPG key correctly (apt-key is deprecated)
sudo mkdir -p /etc/apt/keyrings
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor | sudo tee /etc/apt/keyrings/packages.microsoft.gpg > /dev/null

# Add VS Code repository
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/vscode stable main" | sudo tee /etc/apt/sources.list.d/vscode.list > /dev/null

sudo apt update
sudo apt install code -y

echo "Installing Vim and Neovim..."
#Install vim
sudo apt install vim -y
sudo add-apt-repository ppa:neovim-ppa/stable -y
sudo apt-get update
sudo apt-get install neovim -y

echo "Installing Zsh..."
#Instalar o zsh
sudo apt install zsh -y

echo "Setting Zsh as the default shell..."
#Deixar o zsh como padrão
chsh -s "$(which zsh)"

echo "Installing Oh My ZSH..."
#Instalar o Oh my ZSH (non-interactively)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

echo "Installing Zsh plugins..."
#Instalar os plugins Zsh
# Variáveis para os caminhos dos plugins
ZSH_CUSTOM=${ZSH_CUSTOM:-~/.oh-my-zsh/custom}
ZSHRC=~/.zshrc

# Repositórios dos plugins
SYNTAX_HIGHLIGHTING_REPO="https://github.com/zsh-users/zsh-syntax-highlighting.git"
AUTOSUGGESTIONS_REPO="https://github.com/zsh-users/zsh-autosuggestions.git"

# Função para clonar o plugin se não existir
install_plugin() {
    local repo=$1
    local folder_name
    folder_name=$(basename "$repo" .git)
    local folder="$ZSH_CUSTOM/plugins/$folder_name"
    if [ ! -d "$folder" ]; then
        echo "Installing plugin: $folder_name"
        git clone "$repo" "$folder"
    else
        echo "Plugin already installed: $folder_name"
    fi
}

# Instalar plugins
install_plugin "$SYNTAX_HIGHLIGHTING_REPO"
install_plugin "$AUTOSUGGESTIONS_REPO"

# Adicionar plugins ao arquivo .zshrc de forma segura
sed -i 's/^plugins=(git)$/plugins=(git zsh-syntax-highlighting zsh-autosuggestions)/' "$ZSHRC"
echo "Updated plugins in .zshrc"

echo "Installation and configuration completed!"
echo "IMPORTANT: Please log out and log back in, or restart your terminal to use Zsh and all the new tools."

echo "Deleting obsolete packages..."
#Remoção dos pacotes obsoletos
sudo apt autoremove -y &> /dev/null