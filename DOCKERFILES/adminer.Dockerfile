FROM alpine:3.19


# Ajout de curl
RUN apk add curl


# Ajout des extensions php
RUN apk add --no-cache curl php82 php82-pgsql php82-pdo_pgsql php82-ctype php82-iconv pcre2 php82-session php82-simplexml php82-tokenizer


# Téléchargement d'admniner
RUN mkdir -p /var/www/html && \
    curl -L https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1.php -o /var/www/html/index.php


# Répertoire de travail
WORKDIR /var/www/html

EXPOSE 8080

# Commande par défault
ENTRYPOINT ["php", "-S", "0.0.0.0:8080"]
