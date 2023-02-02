##Modelos estadisticos 
##En R se utiliza mucho la funcion "model.matrix()"
## ?model.matrix
mat <- with(trees, model.matrix(log(Volume) ~ log(Height) + log(Girth)))
mat
colnames(mat)
#¿Como interpretar los nombres de las columnas de mat?
summary(lm(log(Volume) ~ log(Height) + log(Girth), data = trees))
##Explore Model Matrix
##Paquete de bioconductor que nos permite entender los modelos estadisticos
##que utilizamos gracias a visualizaciones. 
## Datos de ejemplo
(sampleData <- data.frame(
  genotype = rep(c("A", "B"), each = 4),
  treatment = rep(c("ctrl", "trt"), 4)
))
## Creemos las imágenes usando ExploreModelMatrix
vd <- ExploreModelMatrix::VisualizeDesign(
  sampleData = sampleData,
  designFormula = ~ genotype + treatment,
  textSizeFitted = 4
)

## Veamos las imágenes
## Usaremos shiny otra vez
app <- ExploreModelMatrix(
  sampleData = sampleData,
  designFormula = ~ genotype + treatment
)
if (interactive()) shiny::runApp(app)

