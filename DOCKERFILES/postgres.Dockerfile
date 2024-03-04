FROM alpine:3.19

#Installation de postgres et création du User
RUN apk update --no-cache 
RUN apk add postgresql --no-cache 
RUN mkdir /run/postgresql 
RUN chown postgres:postgres /run/postgresql/ 
USER postgres

# Création de la db
RUN mkdir /var/lib/postgresql/data 
RUN chmod 0700 /var/lib/postgresql/data 
RUN initdb -D /var/lib/postgresql/data 

# AJout de l'entrypoint docker
USER root
COPY docker-entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

# Règle pour la connection de Symfony
ADD ./pg_hba.conf /var/lib/postgresql/data

USER postgres
ENTRYPOINT "docker-entrypoint.sh"

EXPOSE 5432
