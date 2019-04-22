FROM debian:stretch

RUN apt-get update && \
    apt-get upgrade -y && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
    apache2 curl && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

COPY --chown=www-data:www-data script /usr/lib/cgi-bin/
COPY --chown=www-data:www-data index.html /var/www

EXPOSE 80

CMD ["apache2ctl", "-D", "FOREGROUND"]
