FROM php:8.1-fpm

# Install system dependencies
RUN apt-get update && apt-get install -y \
    git \
    curl \
    libpng-dev \
    libonig-dev \
    libxml2-dev \
    libjpeg-dev \
    libwebp-dev \
    zip \
    unzip \
    libpq-dev \
    netcat-traditional

# Clear cache
RUN apt-get clean && rm -rf /var/lib/apt/lists/*


# Configure php extensions
RUN docker-php-ext-configure gd --enable-gd --with-jpeg --with-webp

# Install PHP extensions
RUN docker-php-ext-install pdo_mysql mbstring exif pcntl bcmath gd sockets pdo pdo_pgsql pgsql

# Install Redis extension
RUN pecl update-channels && pecl install redis && docker-php-ext-enable redis

# Install imagick
RUN apt-get update && apt-get install -y \
    libmagickwand-dev --no-install-recommends \
    && pecl install imagick \
    && docker-php-ext-enable imagick

# Get latest Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

COPY run.sh /tmp

COPY $PHP_INI_NAME /usr/local/etc/php/conf.d/40-custom.ini

ENTRYPOINT ["/tmp/run.sh","php-fpm","-F"]

