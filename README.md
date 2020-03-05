# Indra

Scripts para la configuración del proxy de indra.

## En Linux

Los pasos para configurar el proxy son los siguientes:

 1. Se descarga el proyecto.

 2. Desde el archivo `.profile` (o equivalente) se referencia el archivo `<raiz del proyecto>/linux/proxy.bash`.

El script comprueba si la IP del equipo se corresponde con una de la red de Indra. En caso afirmativo:

 - Establece las variables de entorno `http_proxy`, `https_proxy`, `ftp_proxy` y `no_proxy`.

 - Establece un alias para configurar también el proxy con `apt-get`. Este alias sólo se invocará si se usa directamente `apt-get`, sin `sudo`. 
