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
##Ejemplo 2
(sampleData <- data.frame(
  Response = rep(c("Resistant", "Sensitive"), c(12, 18)),
  Patient = factor(rep(c(1:6, 8, 11:18), each = 2)),
  Treatment = factor(rep(c("pre","post"), 15)), 
  ind.n = factor(rep(c(1:6, 2, 5:12), each = 2))))

vd <- ExploreModelMatrix::VisualizeDesign(
  sampleData = sampleData,
  designFormula = ~ Response + Response:ind.n + Response:Treatment,
  textSizeFitted = 3
)
cowplot::plot_grid(plotlist = vd$plotlist, ncol = 1)

app <- ExploreModelMatrix(
  sampleData = sampleData,
  designFormula = ~ Response + Response:ind.n + Response:Treatment
)
#> The `name` provided ('') does not correspond to a known icon
#> The `name` provided ('hand-o-right') does not correspond to a known icon
#> The `name` provided ('question-circle fa-1g') does not correspond to a known icon
if (interactive()) shiny::runApp(app)

vd <- ExploreModelMatrix::VisualizeDesign(sampleData = sampleData,
                      designFormula = ~ Treatment + Response, 
                      textSizeFitted = 4)
cowplot::plot_grid(plotlist = vd$plotlist, ncol = 1)

(sampleData = data.frame(
  condition = factor(rep(c("ctrl_minus", "ctrl_plus", 
                           "ko_minus", "ko_plus"), 3)),
  batch = factor(rep(1:6, each = 2))))
#>     condition batch
#> 1  ctrl_minus     1
#> 2   ctrl_plus     1
#> 3    ko_minus     2
#> 4     ko_plus     2
#> 5  ctrl_minus     3
#> 6   ctrl_plus     3
#> 7    ko_minus     4
#> 8     ko_plus     4
#> 9  ctrl_minus     5
#> 10  ctrl_plus     5
#> 11   ko_minus     6
#> 12    ko_plus     6
vd <- VisualizeDesign(sampleData = sampleData,
                      designFormula = ~ 0 + batch + condition, 
                      textSizeFitted = 4, lineWidthFitted = 20, 
                      dropCols = "conditionko_minus")
cowplot::plot_grid(plotlist = vd$plotlist, ncol = 1)

app <- ExploreModelMatrix::ExploreModelMatrix(sampleData = sampleData,
                          designFormula = ~ batch + condition)
#> The `name` provided ('') does not correspond to a known icon
#> The `name` provided ('hand-o-right') does not correspond to a known icon
#> The `name` provided ('question-circle fa-1g') does not correspond to a known icon
if (interactive()) shiny::runApp(app)

##Ejercicio:
##Interpretacion de ResponseResistant:Treatmentpre
##ResponseResistant:Treatmentpre = Treatment Pre - Treatment Post
##Cuando la resta anterior da un valor negativo el grupo de post treatment
##posee valores de expresion mayores a los del grupo resistant

##El 0 es clave en la formula del ejercicio 3 ya que este evita que se
##agregue el grupo intercept, sin este la funcion de model matrix agregaria
##automaticamente el grupo intercepto y no saldria el grupo batch 1.








