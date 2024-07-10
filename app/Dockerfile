FROM php:8.2-fpm

# Installe les dépendances
RUN apt-get update && apt-get install -y \
    libpq-dev \
    && docker-php-ext-install pdo_pgsql

# Copie le code de l'application dans le conteneur
WORKDIR /var/www/html
COPY ./app /var/www/html

# Installe Composer et les dépendances PHP
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Permissions (si nécessaire)
RUN chown -R www-data:www-data /var/www/html \
    && chmod -R 755 /var/www/html

# Expose le port (optionnel, selon la configuration)
EXPOSE 9000
