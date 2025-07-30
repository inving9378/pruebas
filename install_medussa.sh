#!/bin/bash

echo "🔧 Iniciando instalación de Medussa..."

# Actualizar e instalar dependencias básicas
apt update && apt upgrade -y
apt install -y apache2 mariadb-server php php-mbstring php-xml php-bcmath php-curl php-mysql php-zip unzip curl git composer

# Clonar el repositorio
cd /var/www
rm -rf medussa
git clone https://github.com/inving9378/pruebas.git medussa
cd medussa

# Instalar dependencias de PHP con Composer
composer install --no-interaction --prefer-dist

# Copiar archivo .env y generar clave de la aplicación
cp .env.example .env
php artisan key:generate

# Asignar permisos
chown -R www-data:www-data /var/www/medussa
chmod -R 755 /var/www/medussa

# Crear base de datos
mysql -u root <<EOF
CREATE DATABASE IF NOT EXISTS medussa CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
GRANT ALL PRIVILEGES ON medussa.* TO 'medussa_user'@'localhost' IDENTIFIED BY 'medussa_pass';
FLUSH PRIVILEGES;
EOF

# Configurar archivo .env automáticamente
sed -i 's/DB_DATABASE=.*/DB_DATABASE=medussa/' .env
sed -i 's/DB_USERNAME=.*/DB_USERNAME=medussa_user/' .env
sed -i 's/DB_PASSWORD=.*/DB_PASSWORD=medussa_pass/' .env

# Ejecutar migraciones
php artisan migrate --force

echo "✅ Medussa ha sido instalado correctamente aguevo ya quedo y ahora abre un navegador y visita http://localhost/medussa/public"
