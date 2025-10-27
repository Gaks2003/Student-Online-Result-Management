# Multi-stage Dockerfile for Student Result Management System

# Stage 1: Build stage with Node.js for asset compilation
FROM node:18-alpine AS build-stage
WORKDIR /app
COPY package.json gulpfile.babel.js ./
COPY sass/ ./sass/
COPY js/ ./js/
RUN npm ci
RUN npx gulp || echo "Gulp build failed, continuing without asset compilation"

# Stage 2: Production stage with PHP and Apache
FROM php:8.1-apache

# Install system dependencies
RUN apt-get update && apt-get install -y \
    git \
    curl \
    libpng-dev \
    libonig-dev \
    libxml2-dev \
    libzip-dev \
    zip \
    unzip \
    mysql-client \
    nodejs \
    npm \
    && docker-php-ext-install pdo_mysql mbstring exif pcntl bcmath gd zip

# Get latest Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Set working directory
WORKDIR /var/www/html

# Copy application code
COPY . /var/www/html/

# Copy compiled assets from build stage
COPY --from=build-stage /app/css /var/www/html/css
COPY --from=build-stage /app/js /var/www/html/js

# Install PHP dependencies (if composer.json exists)
RUN if [ -f composer.json ]; then composer install --no-dev --optimize-autoloader; fi

# Set permissions
RUN chown -R www-data:www-data /var/www/html \
    && chmod -R 755 /var/www/html \
    && chmod -R 777 /var/www/html/db (if needed for uploads)

# Copy Apache configuration
RUN echo '<VirtualHost *:80>\n\
    DocumentRoot /var/www/html\n\
    <Directory /var/www/html>\n\
        AllowOverride All\n\
        Require all granted\n\
        DirectoryIndex index.php\n\
    </Directory>\n\
    ErrorLog ${APACHE_LOG_DIR}/error.log\n\
    CustomLog ${APACHE_LOG_DIR}/access.log combined\n\
</VirtualHost>' > /etc/apache2/sites-available/000-default.conf

# Enable Apache modules
RUN a2enmod rewrite headers ssl

# Create startup script
RUN echo '#!/bin/bash\n\
# Wait for MySQL to be ready (if using external MySQL)\n\
if [ ! -z "$DB_HOST" ]; then\n\
    until mysqladmin ping -h"$DB_HOST" -P"${DB_PORT:-3306}" -u"$DB_USERNAME" -p"$DB_PASSWORD" --silent; do\n\
        echo "Waiting for MySQL..."\n\
        sleep 2\n\
    done\n\
    echo "MySQL is ready!"\n\
fi\n\
\n\
# Start Apache\n\
apache2-foreground' > /usr/local/bin/start.sh

RUN chmod +x /usr/local/bin/start.sh

# Expose port 80
EXPOSE 80

# Health check
HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
    CMD curl -f http://localhost/ || exit 1

# Start the application
CMD ["/usr/local/bin/start.sh"]
