# Redis Data Integration (RDI) Upgrade Script

This repository contains a simple Bash script to upgrade **Redis Data Integration (RDI)** on a RHEL-based VM installation.

---

## English (EN-US)

### Overview

The script automates the process of upgrading RDI to a specified version.  
It performs the following actions:

1. Defines constants for RDI version, host, port, and password.
2. Cleans up immutable Kubernetes Jobs that may block upgrades.
3. Downloads and extracts the RDI installer.
4. Executes the `upgrade.sh` script with proper arguments.
5. Validates the upgrade by checking the installed version.

---

### Prerequisites

- RHEL or compatible Linux distribution
- `sudo` privileges
- `kubectl` configured and connected to the RDI Kubernetes environment
- Sufficient disk space for download and extraction

---

### Usage

1. Edit the script to configure:

   ```bash
   RDI_VERSION="1.12.3"
   RDI_PASSWORD="secret42"
   RDI_HOST="localhost"
   RDI_PORT="12000"
   ```

2. Run the script:

   ```bash
   chmod +x upgrade-rdi.sh
   ./upgrade-rdi.sh
   ```

3. When prompted with:

   ```
   You're about to reinstall RDI (1.12.3). Are you sure? [y/N]:
   ```

   Type `y` and press Enter.

4. Validate the upgrade:

   ```bash
   redis-di --version
   ```

   Expected output (example):

   ```
   redis-di, version 1.12.3
   ```

---

### Notes

- The script removes Jobs `rdi-operator-webhook-certgen` and `rdi-operator-webhook-certpatch` to prevent immutable field errors during upgrade.

---

## Português (PT-BR)

### Visão Geral

Este script automatiza o processo de upgrade do **Redis Data Integration (RDI)** para uma versão específica.  
Ele executa as seguintes ações:

1. Define constantes para a versão, host, porta e senha do RDI.
2. Remove Jobs imutáveis do Kubernetes que podem bloquear o upgrade.
3. Faz o download e extrai o instalador do RDI.
4. Executa o script `upgrade.sh` com os argumentos necessários.
5. Valida o upgrade verificando a versão instalada.

---

### Pré-requisitos

- RHEL ou distribuição Linux compatível
- Privilégios `sudo`
- `kubectl` configurado e conectado ao ambiente Kubernetes do RDI
- Espaço em disco suficiente para download e extração

---

### Uso

1. Edite o script para configurar:

   ```bash
   RDI_VERSION="1.12.3"
   RDI_PASSWORD="secret42"
   RDI_HOST="localhost"
   RDI_PORT="12000"
   ```

2. Execute o script:

   ```bash
   chmod +x upgrade-rdi.sh
   ./upgrade-rdi.sh
   ```

3. Quando solicitado com:

   ```
   You're about to reinstall RDI (1.12.3). Are you sure? [y/N]:
   ```

   Digite `y` e pressione Enter.

4. Valide o upgrade:

   ```bash
   redis-di --version
   ```

   Saída esperada (exemplo):

   ```
   redis-di, version 1.12.3
   ```

---

### Observações

- O script remove os Jobs `rdi-operator-webhook-certgen` e `rdi-operator-webhook-certpatch` para evitar erros de campo imutável durante o upgrade.

---
