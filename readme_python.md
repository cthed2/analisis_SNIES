# Automatización de Descarga y Limpieza de Datos de SNIES

Este proyecto tiene como objetivo automatizar la descarga de archivos en formato Excel desde la página [https://snies.mineducacion.gov.co/portal/ESTADISTICAS/Bases-consolidadas/](https://snies.mineducacion.gov.co/portal/ESTADISTICAS/Bases-consolidadas/) utilizando Selenium. Los archivos descargados contienen datos que requieren limpieza y posterior concatenación.

## Descripción

El objetivo principal de este proyecto es simplificar el proceso de obtención y limpieza de datos del Sistema Nacional de Información de Educación Superior (SNIES). La página web mencionada anteriormente proporciona archivos en formato Excel que contienen información relevante sobre las estadísticas de educación superior en Colombia. Sin embargo, los archivos descargados tienen algunas filas iniciales que deben eliminarse antes de concatenarlos.

Una vez que los archivos se han concatenado en un único archivo, se lleva a cabo un proceso de limpieza para asegurarse de que los datos estén en un formato adecuado y listos para su análisis.

## Requisitos previos

Antes de utilizar este proyecto, asegúrate de tener instalados los siguientes componentes:

- Python 3.x
- Biblioteca Selenium
- Navegador Chrome y ChromeDriver
