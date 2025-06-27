# Indicamos la imagen de node que se va a utilizar, en este caso alpine3.22 (mas ligera)
FROM node:24-alpine3.22

# Establecemos el directorio de trabajo dentro del contenedor
# Todo lo que se copie o ejecute después será relativo a esta ruta
WORKDIR /app

# Copiamos todos los archivos del proyecto local al directorio de trabajo del contenedor
COPY . .

# Instalamos las dependencias del proyecto con npm, limpiamos el cache y eliminamos carpetas temporales,
# para reducir el tamaño de la imagen final y que sea lo más ligera posible
RUN npm install \
    && npm cache clean --force \
    && rm -rf /tmp/ /root/.npm/_cacache

# Definimos una variable de entorno para el puerto que usará la aplicación
ENV PORT=3000

# Exponemos el puerto definido anteriormente para indicarle que puerto interno usa la aplicacion
EXPOSE $PORT

# Comando por defecto al iniciar el contenedor
CMD ["npm", "start"]