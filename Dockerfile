FROM php:8.0-apache

# Apache Document Root
WORKDIR /var/www/html

# App Configuration
COPY ./example.conf /etc/apache2/sites-available/app.conf

# Set Server name and set app as default config, restart apache
RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf &&\
    a2enmod rewrite &&\
    a2dissite 000-default &&\
    a2ensite app &&\
    service apache2 restart

# Application code
COPY ./src/ .

EXPOSE 80