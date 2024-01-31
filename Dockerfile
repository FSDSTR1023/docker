# COMANDOS:
# FROM    #Establece la imagen base para la construcción. Es el primer comando en cualquier Dockerfile y define de qué imagen se parte.
# RUN  # Ejecuta comandos en una nueva capa sobre la imagen actual y confirma los resultados. Es útil para instalar paquetes o realizar configuraciones.
# CMD  # Proporciona un comando y argumentos por defecto para el contenedor ejecutable. Solo puede haber un `CMD` en un Dockerfile. Si se especifican varios, solo el último tiene efecto.
# LABEL  # Agrega metadatos a la imagen como pares clave-valor. Es útil para añadir información como mantenedor, versión de la imagen, etc.
# EXPOSE  # Informa a Docker que la imagen escuchará en los puertos especificados en tiempo de ejecución. No publica el puerto, solo actúa como una forma de documentación entre quien construye la imagen y quien la ejecuta.
# ENV  # Establece variables de entorno. Estas variables persisten cuando se inicia un contenedor basado en la imagen.
# ADD    #Copia archivos, directorios o archivos remotos desde `src` y los agrega al sistema de archivos de la imagen en `dest`.
# COPY  # Copia archivos y directorios locales al contenedor. Es preferible a `ADD`, ya que es más transparente (no realiza descompresiones ni descargas).
# ENTRYPOINT  # Configura un contenedor para que se ejecute como un ejecutable. Permite configurar un contenedor con un comando y argumentos por defecto que se pueden sobrescribir desde la línea de comando cuando se inicia el contenedor.
# VOLUME  # Crea un punto de montaje con el nombre especificado y marca con él un directorio que puede ser montado desde el host o desde otros contenedores.
# USER  # Establece el nombre de usuario (o UID) y opcionalmente el grupo de usuario (o GID) a usar al ejecutar la imagen y para cualquier `RUN`, `CMD` y `ENTRYPOINT`.
# WORKDIR  # Establece el directorio de trabajo para cualquier instrucción `RUN`, `CMD`, `ENTRYPOINT`, `COPY` y `ADD` que se ejecute en la imagen.
# ARG  # Define una variable que los usuarios pueden pasar en tiempo de construcción con el comando `docker build`.
# ONBUILD  # Agrega un comando de disparo que se ejecutará en una imagen descendiente. Es útil para imágenes que se van a usar como bases de otras imágenes.
# STOPSIGNAL  # Establece la señal del sistema que se enviará al contenedor para salir.


FROM node:14

WORKDIR /app
# Indica a Docker que todos los comandos a posteriori
# deben ejecutarse en la carpeta especificada

COPY package.json /app
# archivo + carpeta en la que se copia
# al copiar el package.json primero, nos permite instalar npm antes de 
# copiar el código y que se guarde en cache.
# De este modo, al hacer build de nuevo, el proceso es mucho más rápido

RUN npm install

COPY . /app
# COPY . . 

# Punto 1: Host file systyem
# El primer . indica a docker que haga una copia de 
# los ficheros que se encuentran en la misma carpeta 
# que el Dockerfil

# Punto 2: image/container file systyem
# El segundo . es la ruta dentro del contenedor 
# donde se almacena la copia

EXPOSE 80
# Puerto en el que correrá el container

CMD ["node", "server.js"]
# CMD = command
# Último comando en la imagen para 'levantar' el proyecto
# Se ejecuta cuanto el contenedor se ha creado, basado en la imagen

