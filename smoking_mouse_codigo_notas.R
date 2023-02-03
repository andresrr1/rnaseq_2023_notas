## Organizar repositorio en: codigo, plots, raw-data y process-data.
## Crear un folder para cada etapa del proyecto. 
## Computar metricas de control de calidad antes de normalizar los datos
## Extraer los IDs de genes con biomark en lugar de utilizar los ensemblid
## Analisis exploratorio
## Control de calidad

## eje x- variable de separacion de muestras eje y- variable de control
## de calidad

## Filtrado de muestras por control de calidad:
## Se filtran de acuerdo a ser consideradas outliers
## No se quitan si son outliers de mayor calidad que las demas muestras. 

## Exploracion a nivel de muestras
## Funcion que extrae los componentes principales prcomp
## Remover las muestras extrañas y volver a correr el analisis 
## de componentes principales


## Particion de varianza y variables explanatorias
## Ajuste de model
## Dar una formula con las variables para las que se quiere calcular 
## la contribución
## Variables cualitativas modeladas como efectos fijos y cuantitativas 
## como aleatorias
## Analisis de particion de varianzas
## Especificar una formmula para especificar la varianza


## Analisis de expresion diferencial
## voom estima las relaciones entre la media y la varianza para cada
## gen, estimar los pesos para cada gen
## eBayes calcula los genes mas significativos
## toptable selecciona a los genes mejor rankeados
## venn.diagram tiene como ventaja que los circulos poseeran un tamaño
## proporcional al numero de muestras que contiene
## 





