FROM php:8.3-apache

# Enable Apache mod_rewrite
RUN a2enmod rewrite

# Install Composer (optional)
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Copy app files
COPY . /var/www/html/

# Set working dir
WORKDIR /var/www/html

# Set proper permissions (if Laravel or similar)
RUN chown -R www-data:www-data /var/www/html \
    && chmod -R 755 /var/www/html

# Expose port
EXPOSE 80
