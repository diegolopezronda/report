# Reporte de Sprint

Este es un generador de reportes de sprint. El usuario configura el entorno y 

## Requisitos

Recomendamos usar las siguientes herramientas:

* Un compilador de LaTeX
  * MikTex (Windows)
  * TexLive (Linux)
  * MacTex (MacOS)
* Perl (para Windows)
* Visual Studio Code
  * Latex Workshop Extension
  * Latex Language Support Extension
  * Latex Utilities Extension

## Uso

Se debe crear el archivo `env.sh` con el siguiente formato:

### Configuración del entorno
Se necesita acceso a la API de JIRA. Para ello, las siguientes variables de entorno deben estar disponibles:

```bash
AX_API_HOST="<URL del host de la API de JIRA>"
AX_API_USER="<Usuario de la API de JIRA>"
AX_API_TOKEN="<Token de acceso a la API de JIRA>"
```
Ejemplo:

```bash
AX_API_HOST="https://servidor.atlassian.net"
AX_API_USER="usuario_api@alexaguayo.cl"
AX_API_TOKEN="token_de_acceso_123"
```
#### Archivo de variables 
Se puede crear un archivo `env.sh` en la raíz del proyecto con el siguiente contenido:

```bash
# Valores de ejemplo, reemplazar por los reales
export AX_API_HOST="https://servidor.atlassian.net"
export AX_API_USER="usuario_api@alexaguayo.cl"
export AX_API_TOKEN="token_de_acceso_123"
```
y luego ejecutar el siguiente comando en la terminal:

```bash
source env.sh
```

Esto cargará las variables de entorno necesarias para ejecutar el script.

### Generación de reporte

> [!WARNING]
>
> El script no funcionará si el proyecto no tiene la metadata correcta.

#### Con Latex Workshop

Para generar el reporte, se debe ejecutar el siguiente comando en la terminal:

```bash
./build.sh CODIGO_PROYECTO --no-compile
```
Esto solo descargará la información de JIRA sin generar el reporte. Usa Latex 
Workshop (xelatex) para compilar el archivo `book.tex` y generar el PDF.

#### Sin Latex Workshop

Para generar el reporte, se debe ejecutar el siguiente comando en la terminal:

```bash
./build.sh CODIGO_PROYECTO
```
Esto generará el archivo `book.pdf` que contiene el reporte del sprint.

## Sistema de archivos
 
 * **assets**: Contiene los archivos de imagenes y logos.
 * **chapters**: Contiene los archivos estáticos de cara parte del reporte.
 * **fonts**: Contiene los archivos de fuentes.
 * **scripts**: Contiene los scripts para consultar JIRA.
 * **book.tex**: Archivo principal del reporte.
 * **bookstyle.sty**: Archivo de estilo del reporte.
 * **build.sh**: Script para generar el reporte en PDF.
