## Revision
## ¿Por qué usamos el paquete edgeR? 
## Para utilizar la funcion calcNorm que nos permite normalizar los datos
## si es que una muestra posee mas poblaciones de RNA que otra
## pero el tamaño de poblacion de aquellas que coinciden es el mismo

##¿Por qué es importante el argumento sort.by en topTable()?
## Porque se deben ordenar los valores de acuerdo al parametro 
## estadistico con que se desea ordenar los genes.

## ¿Por qué es importante el argumento coef en topTable()?
## Se decir que coeficiente es el de interes para obtenerlo.

## Ejercicio en equipo
speaqeasy_data <- file.path(tempdir(), "rse_speaqeasy.RData")
download.file("https://github.com/LieberInstitute/SPEAQeasy-example/blob/master/rse_speaqeasy.RData?raw=true", speaqeasy_data, mode = "wb")
library("SummarizedExperiment")
load(speaqeasy_data, verbose = TRUE)