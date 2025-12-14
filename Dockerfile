FROM centos:7

LABEL maintainer="reshufowzi29@gmail.com"

# Install required packages
RUN yum install -y httpd zip unzip && \
    yum clean all

# Download website template
ADD https://www.free-css.com/assets/files/free-css-templates/download/page254/photogenic.zip /var/www/html/

# Set working directory
WORKDIR /var/www/html/

# Unzip and move files
RUN unzip photogenic.zip && \
    cp -rvf photogenic/* . && \
    rm -rf photogenic photogenic.zip

# Expose HTTP port
EXPOSE 80 443

# Start Apache in foreground
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
