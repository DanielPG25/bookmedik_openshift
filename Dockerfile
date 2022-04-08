FROM docker.io/dparrales/bookmedik:base
MAINTAINER Daniel Parrales "daniparrales16@gmail.com"
EXPOSE 8080
ENV USUARIO_BOOKMEDIK=bookmedik
ENV CONTRA_BOOKMEDIK=bookmedik
ENV DATABASE_HOST=mariadb
ENV NOMBRE_DB=bookmedik
RUN sed -i 's/80/8080/' /etc/apache2/ports.conf && sed -i 's/443/8443/' /etc/apache2/ports.conf && sed -i 's/80/8080/' /etc/apache2/sites-available/000-default.conf && sed -i 's/443/8443/' /etc/apache2/sites-available/default-ssl.conf 
ADD bookmedik /var/www/html/
ADD script.sh /opt/
RUN chmod +x /opt/script.sh && chown -R 1001:1001 /opt
USER 1001
ENTRYPOINT ["/opt/script.sh"]
