FROM php:8.4.27-apache

# Composer
COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

# Extensiones necesarias para el proyecto
# y para PhpSpreadsheet, Dompdf, FPDF y FPDI
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libpng-dev \
        libzip-dev \
        libicu-dev \
        libxml2-dev \
        libonig-dev \
        unzip \
        git \
    && docker-php-ext-configure gd \
        --with-freetype \
        --with-jpeg \
    && docker-php-ext-install -j"$(nproc)" \
        gd \
        intl \
        mbstring \
        mysqli \
        pdo_mysql \
        zip \
        xml \
        xmlreader \
        xmlwriter \
        simplexml \
        exif \
        opcache \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Habilitar mod_rewrite para las rutas de Argus
RUN a2enmod rewrite

# Configuración de Apache
COPY docker/apache/000-default.conf /etc/apache2/sites-available/000-default.conf

# Copiar el proyecto al contenedor
COPY . /var/www/app

# Directorio de trabajo
WORKDIR /var/www/app

# Instalar dependencias PHP
RUN composer install --no-interaction --prefer-dist

# Configurar el directorio público de Apache
RUN rm -rf /var/www/html \
    && ln -s /var/www/app/public /var/www/html

# Permisos para Apache
RUN chown -R www-data:www-data /var/www/app

EXPOSE 80