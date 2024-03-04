Lancement de l'application : 
* Installation des dépendances : <pre>
cd app
composer install</pre>
* Lancer les conteneurs : <pre>docker compose up -d</pre>
* Créer la base de données sur le conteneur postgres : <pre>
docker exec -it esgi_docker_projet_s1-postgres-1 psql
create database app;
exit</pre>
* Mettre à jour la base de données : <pre>docker exec -it esgi_docker_projet_s1-symfony-1 php bin/console d:m:m</pre>
* Remplir la base : <pre>docker exec -it esgi_docker_projet_s1-symfony-1 php bin/console doctrine:fixtures:load</pre>