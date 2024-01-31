# DOCKER

## COMANDOS DOCKERFILE

### COMANDOS MÁS HABITUALES

```
FROM # Establece la imagen base (ej. node, python, ubunto...). DOCKERHUB
RUN # Ejecuta comandos. Permite: instalar paquetes o realizar configuraciones
CMD # Comando que levantará la app dentro del contenedor. Solo puede haber uno. 
WORKDIR # Establece el directorio de trabajo (y lo crea si no existe) para cualquier instrucción `RUN`, `CMD`, `ENTRYPOINT`, `COPY` y `ADD` que se ejecute en la imagen.
EXPOSE # Informa a Docker sobre los puertos 
ENV # Establece variables de entorno. Estas variables persisten cuando se inicia un contenedor basado en la imagen.
ADD # Copia archivos, directorios o archivos remotos desde `src` y los agrega al sistema de archivos de la imagen en `dest`.
COPY # Copia archivos y directorios locales al contenedor. Es preferible a `ADD`, ya que es más transparente (no realiza descompresiones ni descargas).
VOLUME # Crea un punto de montaje con el nombre especificado y marca con él un directorio que puede ser montado desde el host o desde otros contenedores.
```

### OTROS COMANDOS

```
ENTRYPOINT # Configura un contenedor para que se ejecute como un ejecutable. Permite configurar un contenedor con un comando y argumentos por defecto que se pueden sobrescribir desde la línea de comando cuando se inicia el contenedor.
LABEL # Agrega metadatos a la imagen (clave-valor). Es útil para añadir información como mantenedor, versión de la imagen, etc.
USER # Establece el nombre de usuario (o UID) y opcionalmente el grupo de usuario (o GID) a usar al ejecutar la imagen y para cualquier `RUN`, `CMD` y `ENTRYPOINT`.
ARG # Define una variable que los usuarios pueden pasar en tiempo de construcción con el comando `docker build`.
ONBUILD # Agrega un comando de disparo que se ejecutará en una imagen descendiente. Es útil para imágenes que se van a usar como bases de otras imágenes.
STOPSIGNAL # Establece la señal del sistema que se enviará al contenedor para salir.
```



## USO DEL DOCKERFILE

1. Construir la imagen a partir del Dockerfile:

```docker build -t mi-aplicacion-web .```

2. Crear un container a partir de la imagen:

```docker run -p 8000:8000 mi-aplicacion-web```

- El primer 8000 es el puerto de nuestra máquina host.
- El segundo puerto dentro del contenedor de docker

3. Poner en marcha el contenedor:

```docker run -it ubuntu /bin/bash```


## COMANDOS DOCKER

`docker pull` --> descarga imagen de Dockerhub

`docker build` --> crea una imagen Docker a partir de un Dockerfile

`docker build -t mi-web-app .` 

--> -t permite nombrar la imagen

--> . indica en qué carpeta se encuentra el Dockerfile

`docker run` --> inicia un contenedor a partir de una imagen

`docker run -p 8000:5000 mi-web-app` --> -p permite definir los puertos 

`docker ps` y `docker ps -a` --> lista los contenedores activos y detenidos

`docker stop [CONTAINER_ID o [CONTAINER_NAME]` o `docker stop $(docker ps -q)` --> detiene uno o más contenedores.

`docker images` --> Lista todas las imágenes locales.

`docker rmi` --> Elimina una o más imágenes.

`docker exec` --> Ejecuta un comando en un contenedor en ejecución.

`docker logs` --> Obtiene los logs de un contenedor.

`docker volume create` --> Crea un volumen para almacenamiento persistente.

`docker network create` --> Crea una red para conectar contenedores.
