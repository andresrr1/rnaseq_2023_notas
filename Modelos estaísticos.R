##Modelos estadisticos 
##En R se utiliza mucho la funcion "model.matrix()"
## ?model.matrix
mat <- with(trees, model.matrix(log(Volume) ~ log(Height) + log(Girth)))
mat
colnames(mat)
#¿Como interpretar los nombres de las columnas de mat?
summary(lm(log(Volume) ~ log(Height) + log(Girth), data = trees))
##Explore Model Matrix
##