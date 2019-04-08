FROM debian:stretch

RUN apt-get update && \
    apt-get upgrade -y && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
    apache2 curl && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN curl -LO http://snapshot.debian.org/archive/debian/20140201T040703Z/pool/main/b/bash/bash_4.2%2Bdfsg-1_amd64.deb && \
    dpkg -i *.deb \
    && rm *.deb

COPY --chown=www-data:www-data script /usr/lib/cgi-bin/
COPY --chown=www-data:www-data index.html /var/www

EXPOSE 80

CMD ["apache2ctl", "-D", "FOREGROUND"]
