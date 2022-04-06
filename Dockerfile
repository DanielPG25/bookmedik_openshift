FROM php:7.4-apache-bullseye
MAINTAINER Daniel Parrales García "daniparrales16@gmail.com"
EXPOSE 80
ENV USUARIO_BOOKMEDIK=bookmedik
ENV CONTRA_BOOKMEDIK=bookmedik
ENV DATABASE_HOST=mariadb
ENV NOMBRE_DB=bookmedik
RUN apt update && apt upgrade -y && docker-php-ext-install mysqli pdo pdo_mysql && apt install mariadb-client -y && apt clean && rm -rf /var/lib/apt/lists/*
ADD bookmedik /var/www/html/
ADD script.sh /opt/
RUN chmod +x /opt/script.sh && chown -R 1001:1001 /opt
USER 1001
ENTRYPOINT ["/opt/script.sh"]
