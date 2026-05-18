# 🚀 Guia de Configuração no Servidor

Este guia descreve os passos para migrar e configurar o Web Scraper e Dashboard no seu servidor caseiro.

## 📋 Pré-requisitos
- **Docker** e **Docker Compose** instalados no servidor.
- **Nginx** instalado (como reverse proxy).
- Acesso SSH ao servidor.

## 📦 1. Transferência de Arquivos
Copie toda a pasta do projeto para o seu servidor. Pode usar `scp` ou `rsync` ou git clone.
Certifique-se de que os seguintes ficheiros estão presentes:
- `docker-compose.yml`
- `Dockerfile`
- `requirements.txt`
- Pasta `dashboard/`
- Pasta `adapters/`
- `scraper.py`, `database.py`
- `links` (a sua lista de sites a pesquisar)

## ⚙️ 2. Configuração de Variáveis (.env)
Crie um ficheiro `.env` na raiz do projeto no servidor com o seguinte conteúdo:

```bash
# Telegram
TELEGRAM_TOKEN=seu_token_aqui
CHAT_ID=seu_chat_id_aqui

# Base de Dados
DATABASE_URL=postgresql://user:pass@db:5432/imoveis

# Scraper Config
SCRAPE_INTERVAL=3600
CONCURRENCY_LIMIT=2
MIN_PRICE=100000

# Browserless (Docker interno)
BROWSER_WS_ENDPOINT=ws://browser:3000
```


## 🌐 3. Configuração do Nginx
Para deixar o dashboard acessível "ao mundo" de forma segura, vamos configurar o Nginx para redirecionar o tráfego.

1.  Abra o ficheiro de configuração do seu site no Nginx (ex: `/etc/nginx/sites-available/default` ou um ficheiro específico em `/etc/nginx/sites-available/meu-site`).
2.  Adicione ou modifique o bloco `location /` (ou crie um subdomínio/caminho específico) com o seguinte conteúdo:

```nginx
server {
    listen 80; # Ou 443 com SSL
    server_name seu-dominio.com; # Ou o IP do servidor

    location / {
        # Redireciona para o Dashboard a correr no Docker na porta 8080
        proxy_pass http://127.0.0.1:8080;
        
        # Cabeçalhos essenciais
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;

        # ⚠️ CRÍTICO: Suporte a WebSockets (para os logs funcionarem em tempo real)
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection "upgrade";
    }
}
```
3.  Teste a configuração e reinicie o Nginx:
    ```bash
    sudo nginx -t
    sudo systemctl restart nginx
    ```

## 🚀 4. Arrancar o Projeto
Dentro da pasta do projeto no servidor:

```bash
docker-compose up -d --build
```

O comando irá:
1.  Construir as imagens.
2.  Iniciar a Base de Dados (privada).
3.  Iniciar o Scraper.
4.  Iniciar o Dashboard (na porta 8080 local).

## ✅ 5. Verificação
1.  Aceda ao seu IP ou domínio no browser: `http://seu-dominio.com`
2.  Se vir o painel e os logs começarem a aparecer na secção "Logs em Tempo Real", está tudo pronto!

---
**Segurança**: A base de dados Postgres está configurada para **não** expor portas para a internet, comunicando apenas internamente com o scraper e o dashboard.
