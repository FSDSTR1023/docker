# DOCKER

### Comandos Dockerfile

1. **`FROM`** Establece la imagen base para la construcción. Es el primer comando en cualquier Dockerfile y define de qué imagen se parte.
    - Ejemplo: `FROM ubuntu:18.04`
2. **`RUN`**: Ejecuta comandos en una nueva capa sobre la imagen actual y confirma los resultados. Es útil para instalar paquetes o realizar configuraciones.
    - Ejemplo: `RUN apt-get update && apt-get install -y python`
3. **`CMD`**: Proporciona un comando y argumentos por defecto para el contenedor ejecutable. Solo puede haber un `CMD` en un Dockerfile. Si se especifican varios, solo el último tiene efecto.
    - Ejemplo: `CMD ["python", "./app.py"]`
4. **`LABEL`**: Agrega metadatos a la imagen como pares clave-valor. Es útil para añadir información como mantenedor, versión de la imagen, etc.
    - Ejemplo: `LABEL version="1.0"`
5. **`EXPOSE`**: Informa a Docker que la imagen escuchará en los puertos especificados en tiempo de ejecución. No publica el puerto, solo actúa como una forma de documentación entre quien construye la imagen y quien la ejecuta.
    - Ejemplo: `EXPOSE 80`
6. **`ENV`**: Establece variables de entorno. Estas variables persisten cuando se inicia un contenedor basado en la imagen.
    - Ejemplo: `ENV PATH /usr/local/bin:$PATH`
7. **`ADD`**: Copia archivos, directorios o archivos remotos desde `src` y los agrega al sistema de archivos de la imagen en `dest`.
    - Ejemplo: `ADD . /app`
8. **`COPY`**: Copia archivos y directorios locales al contenedor. Es preferible a `ADD`, ya que es más transparente (no realiza descompresiones ni descargas).
    - Ejemplo: `COPY ./requirements.txt /app/`
9. **`ENTRYPOINT`**: Configura un contenedor para que se ejecute como un ejecutable. Permite configurar un contenedor con un comando y argumentos por defecto que se pueden sobrescribir desde la línea de comando cuando se inicia el contenedor.
    - Ejemplo: `ENTRYPOINT ["python"]`
10. **`VOLUME`**: Crea un punto de montaje con el nombre especificado y marca con él un directorio que puede ser montado desde el host o desde otros contenedores.
    - Ejemplo: `VOLUME /myvol`
11. **`USER`**: Establece el nombre de usuario (o UID) y opcionalmente el grupo de usuario (o GID) a usar al ejecutar la imagen y para cualquier `RUN`, `CMD` y `ENTRYPOINT`.
    - Ejemplo: `USER myuser:mygroup`
12. **`WORKDIR`**: Establece el directorio de trabajo para cualquier instrucción `RUN`, `CMD`, `ENTRYPOINT`, `COPY` y `ADD` que se ejecute en la imagen.
    - Ejemplo: `WORKDIR /app`
13. **`ARG`**: Define una variable que los usuarios pueden pasar en tiempo de construcción con el comando `docker build`.
    - Ejemplo: `ARG VERSION=1.0`
14. **`ONBUILD`**: Agrega un comando de disparo que se ejecutará en una imagen descendiente. Es útil para imágenes que se van a usar como bases de otras imágenes.
    - Ejemplo: `ONBUILD RUN /usr/local/bin/python-build --dir /app`
15. **`STOPSIGNAL`**: Establece la señal del sistema que se enviará al contenedor para salir.
    - Ejemplo: `STOPSIGNAL SIGTERM`


### USO DEL DOCKERFILE

1. Construir la imagen a partir del Dockerfile:

```docker build -t mi-aplicacion-web .```

2. Crear un container a partir de la imagen:

```docker run -p 8000:8000 mi-aplicacion-web```

- El primer 8000 es el puerto de nuestra máquina host.
- El segundo puerto dentro del contenedor de docker

3. Poner en marcha el contenedor:

```docker run -it ubuntu /bin/bash```

### COMANDOS 

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
