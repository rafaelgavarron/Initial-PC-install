# Instalação de Programas Essenciais

Este é um script em Shell que automatiza a instalação e atualização de alguns programas essenciais para o desenvolvimento e uso geral do sistema. Ele é pensado para sistemas baseados em Debian/Ubuntu e realiza a atualização do sistema e a instalação de ferramentas como Docker, Java, Node.js, Git/GitHub CLI, Vim/SpaceVim e VS Code.

## Funcionalidades

O script executa as seguintes etapas:

1. **Atualização do Sistema**:

   - `sudo apt update && sudo apt upgrade -y && sudo apt full-upgrade -y`
   - Atualiza a lista de pacotes e aplica todas as atualizações e upgrades disponíveis para o sistema.

2. **Instalação do Docker**:

   - Baixa e instala o Docker, ferramenta essencial para containerização e DevOps.

3. **Instalação do Java**:

   - Instala o ambiente de desenvolvimento Java, necessário para rodar aplicações Java e outras ferramentas baseadas na linguagem.

4. **Instalação do Node.js**:

   - Baixa e instala o Node.js, plataforma essencial para desenvolvimento backend e frontend moderno.

5. **Instalação do Git e GitHub CLI**:

   - Instala o Git, ferramenta de controle de versão, e a CLI do GitHub (gh) para facilitar o gerenciamento de repositórios remotos no GitHub.

6. **Instalação do Vim e SpaceVim**:

   - Instala o editor de texto Vim e configura o SpaceVim como uma camada de personalização adicional.

7. **Instalação do Visual Studio Code (VS Code)**:

   - Instala o VS Code, um dos editores de código mais populares e amplamente utilizado para desenvolvimento em várias linguagens.

8. **Remoção de Pacotes Obsoletos**:
   - Executa `sudo apt autoremove` para remover pacotes desnecessários e liberar espaço no sistema.

## Requisitos

- Sistema operacional baseado em Debian/Ubuntu.
- Permissões de administrador (root ou sudo).

## Uso

Para usar o script, execute os seguintes comandos:

```bash
chmod +x instalar_essenciais.sh
./instalar_essenciais.sh
```
