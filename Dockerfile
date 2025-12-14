FROM rockylinux:8

RUN dnf install -y httpd zip unzip curl ca-certificates \
    && dnf clean all

WORKDIR /var/www/html

RUN curl -L -o photogenic.zip \
    https://www.free-css.com/assets/files/free-css-templates/download/page254/photogenic.zip \
    && unzip photogenic.zip \
    && rm -f photogenic.zip

EXPOSE 80

CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]

