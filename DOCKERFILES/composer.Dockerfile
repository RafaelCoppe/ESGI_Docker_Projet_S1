FROM alpine:3.19

RUN apk update && apk upgrade

# Ajout des extensions php
RUN apk add php82 php82-phar php82-iconv php82-openssl php82-ctype php82-xml php82-dom php82-tokenizer php82-mbstring php82-session php82-simplexml

# Script d'installation de Composer.
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"

# Execution du script d'installation.
RUN php composer-setup.php

# Suppression du script.
RUN php -r "unlink('composer-setup.php');"

# Déplacer l'executable de Composer pour pouvor l'utiliser globalement.
RUN mv composer.phar /usr/local/bin/composer

# Répertoire de travail
WORKDIR /app

ENTRYPOINT [ "composer" ]

