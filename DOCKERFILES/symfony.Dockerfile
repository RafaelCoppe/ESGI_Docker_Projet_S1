FROM alpine:3.19

RUN apk add curl git

# Ajout des extensions php
RUN apk add php82 php82-ctype php82-iconv pcre2 php82-session php82-simplexml php82-tokenizer

# Extension php supplémentaires
RUN apk add php82-mbstring php82-posix php82-intl php82-fpm php82-pdo_pgsql

# Dépendances pour Composer
RUN apk add php82-phar php82-openssl php82-xml php82-dom

# Script d'installation pour Composer
RUN curl 'https://getcomposer.org/installer' | php -- --install-dir=bin --filename=composer

# Installation de Symfony
RUN curl -1sLf 'https://dl.cloudsmith.io/public/symfony/stable/setup.alpine.sh' | /bin/sh

# Installation de symfony cli
RUN apk add symfony-cli

# Vérification des dépendances nécéssaires
RUN symfony check:requirements

# Installation du pjet via composer (pour zviter la creation d'un repo git)
RUN composer create-project symfony/skeleton app

#Répertoire de travail
WORKDIR /app

ENV COMPOSER_ALLOW_SUPERUSER=1
# Ajout des dépendances d'une appli web
RUN composer require webapp

# Lancement du serveur
CMD symfony server:start

