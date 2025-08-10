# Usa la imagen base de Node.js en su versión 8.
FROM node:8

# Establece el directorio de trabajo dentro del contenedor.
WORKDIR /usr/src/app

# Copia los archivos del paquete y la aplicación al contenedor.
COPY package*.json ./
COPY server.js ./

# Instala las dependencias del proyecto.
RUN npm install

# Expone el puerto 8080 del contenedor. Esto permite que el puerto 8080 en el
# host (la máquina virtual de GitHub) se mapee al puerto 8080 del contenedor.
# La instrucción -p 8080:3000 que vimos antes es para mapear a 3000 en el contenedor,
# así que cambiamos el EXPOSE para coincidir.
EXPOSE 3000

# El comando a ejecutar cuando el contenedor se inicie.
# "npm start" es el método más robusto para iniciar la aplicación, ya que
# ejecuta el script definido en package.json.
CMD ["npm", "start"]
