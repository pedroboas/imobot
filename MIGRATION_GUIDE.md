# 🚀 Guia de Migração para o Servidor

Este guia explica como colocar o **Imobot** a correr no seu servidor pessoal, integrando-o com a sua stack existente (Nginx Proxy Manager, Portainer, etc.).

## 📋 Pré-requisitos
- Acesso SSH ao servidor.
- A rede Docker `backend` deve existir (normalmente já existe se usa Nginx Proxy Manager e Portainer na mesma rede).

## 📦 1. Transferir Ficheiros
Copie toda a pasta do projeto `web scrapper imo` para o servidor (ex: para `~/docker/imobot`).

Pode usar o comando `scp` (no seu Mac):
```bash
# Substitua 'user' e '192.168.1.10' pelos dados do seu servidor
scp -r "/Users/pedro.vilasboas/Desktop/web scrapper imo/" user@192.168.1.10:~/docker/imobot
```

## ⚙️ 2. Configurar Variáveis de Ambiente
No servidor, entre na pasta e crie o ficheiro `.env` (ou renomêie o exemplo existente):

```bash
cd ~/docker/imobot
cp .env.example .env  # Se tiver um example, senão crie um novo
nano .env
```

**Conteúdo essencial do `.env`:**
```ini
# Docker Config
BROWSER_WS_ENDPOINT=ws://browser:3000
DATABASE_URL=postgresql://user:pass@db:5432/imoveis

# User Config
TELEGRAM_TOKEN=seu_token_aqui
CHAT_ID=seu_chat_id_aqui
SCRAPE_INTERVAL=3600
CONCURRENCY_LIMIT=2
```

## 🚀 3. Arrancar a Stack
Vamos usar o ficheiro `docker-compose.server.yml` que foi criado especificamente para o servidor (usa a rede `backend` e porta `8085`).

```bash
# Construir e iniciar em background
docker compose -f docker-compose.server.yml up -d --build
```

## 🌐 4. Configurar Acesso Externo (Nginx Proxy Manager)
1. Aceda ao **Nginx Proxy Manager** (normalmente porta 81).
2. Adicione um novo **Proxy Host**:
   - **Domain Names:** `imoveis.ordepserver.duckdns.org` (ou outro subdomínio que queira)
   - **Scheme:** `http`
   - **Forward Hostname / IP:** `dashboard` (nome do serviço no docker) OU o IP do servidor (ex: `192.168.1.10`)
   - **Forward Port:** `8080` (A porta interna do container é 8080)
   - **Block Common Exploits:** ✅
   - **Websockets Support:** ✅ (Muito importante para os logs em tempo real!)

3. No separador **SSL**:
   - Request a new SSL Certificate (Let's Encrypt).
   - Force SSL: ✅

## 🛠️ Comandos Úteis

**Ver logs:**
```bash
docker compose -f docker-compose.server.yml logs -f
```

**Parar tudo:**
```bash
docker compose -f docker-compose.server.yml down
```

**Atualizar (após mudar código):**
```bash
docker compose -f docker-compose.server.yml up -d --build
```
