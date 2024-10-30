#!bin/bash

sudo apt update ; sudo apt upgrade ; sudo apt distro-upgrade
# Add Docker's official GPG key:
sudo apt-get update
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

#Install SDKMan (Gerenciador de JDKs)
curl -s "https://get.sdkman.io" | bash
sdk install java x.y.z-open

# instala a nvm (Node Version Manager, ou Gestor de Pacote de Node)
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.0/install.sh | bash

# descarregar e instalar a Node.js (podemos precisar de reiniciar o terminal)
nvm install 22

# verifica se a versão correta da Node.js está no ambiente
node -v # deve imprimir `v22.11.0`

# verifica se a versão correta da npm está no ambiente
npm -v # deve imprimir `10.9.0`