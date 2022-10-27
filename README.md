# KevinMorales-DSH-PI_DE
Proyecto Individual Data Engineer Henry 

En este primer proyecto se propone realizar un proceso de ETL (extract, transform and load) a partir de un conjunto de datos que se enfocarán en una misma perspectiva de negocio. Los datos vienen de diversas fuentes de relevamiento de precios en distintos mercados.
Se deben trabajar los archivos en su limpieza y llevarlos a una unica extensión para luego importarlos a MYSQL:
Eran 6 archivos los cuales venian en 4 formatos
+ JASON
+ CSV
+ PARQUET
+ EXCEL

De estos archivos, 4 venian con precios por semanas de distintos mercados y cada archivo con su fecha de la semana correspondiente y los otros dos eran de sucursal y producto.

![Slide]https://github.com/KevinMoralesVelosa/KevinMorales-DSH-PI_DE/blob/main/%C2%BFQu%C3%A9%20hicimos.png

**Flujo de proceso del proyecto**
https://drive.google.com/file/d/153UhPcdo_KdRuBGEv9w0ykn77kxcsF3T/view?usp=sharing

**Script Python**
En este repositorio encontraras el archivo llamado **'Kevin Morales DSH-PI_DE.jpynb'** y en él puedes ver los codigos que se usaron para la extracción, limpieza y transformación de los datos, dejandolos con una sola extensión y así mismo tenerlos listos para importarlos en MYSQL.
https://github.com/KevinMoralesVelosa/KevinMorales-DSH-PI_DE/blob/main/Kevin%20Morales%20DSH%20-%20PI_DE.ipynb

**Script SQL** 
Este archivo tambien se encuentra en el repositorio y muestra todas las querys utilizadas para la creación del modelo relacional en MYSQL...
+ Creación Database
+ Creación tablas (Precios, Sucursal, Productos)
+ Importación archivos a cada tabla de la database
+ Creación Indices, claves primarias y foraneas
+ consulta de prueba 

Este archivo esta en formato SQL y tiene el nombre **'Kevin Morales DSH-PI_DE.sql'** esta comentado para que veas cada una de sus instrucciones.
https://github.com/KevinMoralesVelosa/KevinMorales-DSH-PI_DE/blob/main/Kevin%20Morales%20DSH%20-%20PI_DE.sql

En youtube está el video explicativo de 5 minutos en donde se comentan los scripts y el resultado del proceso ETL.
https://youtu.be/dMI7JHpJ2WY

Para finalizar ya quedarian listos los datos para un respectivo analisis.
Muchas gracias.
