Introducción al ambiente de R
================
Macarena Valenzuela Beltrán
8 de julio

\#**Estructura de ambiente R**

\#\#**Familiarizarse con el teclado**

Recordar algunos shortcut

ctrl + shift (command) + r -\> insertar intersección

ctrl + shift + O -\> para ver lista costado lateral derecho

alt + shift + k -\> para ver toda la lista de keyboard shortcut

creacmos File -\> “new project” en R

verificamos el archivo en el computador local

creamos carpeta de scripts, graficos y data

comprobar donde está nuestra carpeta y archivos

ctrl + enter -\> para correr códigos

buscamos en que parte de nuestro directorio no encontramos

``` r
getwd()
```

    ## [1] "C:/Users/trist/Desktop/GitHub/Clases_TDI_2020]_S2.3/Scripts"

**Instalación de librerías**

``` r
library(tidyverse)
```

    ## -- Attaching packages ------------------ tidyverse 1.3.0 --

    ## v ggplot2 3.3.2     v purrr   0.3.4
    ## v tibble  3.0.2     v dplyr   1.0.0
    ## v tidyr   1.0.0     v stringr 1.4.0
    ## v readr   1.3.1     v forcats 0.5.0

    ## -- Conflicts --------------------- tidyverse_conflicts() --
    ## x dplyr::filter() masks stats::filter()
    ## x dplyr::lag()    masks stats::lag()

Llamamos a la base de datos diamonds

``` r
diamonds
```

    ## # A tibble: 53,940 x 10
    ##    carat cut       color clarity depth table price     x     y     z
    ##    <dbl> <ord>     <ord> <ord>   <dbl> <dbl> <int> <dbl> <dbl> <dbl>
    ##  1 0.23  Ideal     E     SI2      61.5    55   326  3.95  3.98  2.43
    ##  2 0.21  Premium   E     SI1      59.8    61   326  3.89  3.84  2.31
    ##  3 0.23  Good      E     VS1      56.9    65   327  4.05  4.07  2.31
    ##  4 0.290 Premium   I     VS2      62.4    58   334  4.2   4.23  2.63
    ##  5 0.31  Good      J     SI2      63.3    58   335  4.34  4.35  2.75
    ##  6 0.24  Very Good J     VVS2     62.8    57   336  3.94  3.96  2.48
    ##  7 0.24  Very Good I     VVS1     62.3    57   336  3.95  3.98  2.47
    ##  8 0.26  Very Good H     SI1      61.9    55   337  4.07  4.11  2.53
    ##  9 0.22  Fair      E     VS2      65.1    61   337  3.87  3.78  2.49
    ## 10 0.23  Very Good H     VS1      59.4    61   338  4     4.05  2.39
    ## # ... with 53,930 more rows

para saber que tiene la base de datos

``` r
?diamonds
```

    ## starting httpd help server ... done

para ver la tabla completa

``` r
view(diamonds)
```

para guardar en el ambiente de r write\_csv(diamonds,
“Data/diamonds\_csv”) gurdar script, gráficos y bases de datos

``` r
ggplot(diamonds, aes(carat, price))+
  geom_hex()
```

![](Introducción-al-ambiente-de-R_files/figure-gfm/unnamed-chunk-6-1.png)<!-- -->

ggsave(“Gráficos/diamonds\_hex.pdf”)

**Importación de datos**

  - read\_csv() lee ficheros separados por coma ‘,’

  - read\_csv2() lee ficheros separados por punto y coma ‘;’’

  - read\_tsv() lee ficheros separaso por tabulador ’

  - read\_delim() lee ficheros separados por lo que nosotros le digamos

  - read\_fwf() ficheros de anchura fija

  - fwf\_widths()

  - fwf\_positions()

  - read\_table()

  - read\_log() ficheros de un server creados por apache

  - install.packages(“webreadr”)

  - Ficheros creados con python u otros tipos de fichero

install.packages(“feather”)\#implementa un formato de lenguaje binario
super rÃ¡pido

library(feather)\#puede ser incluido en otros lenguajes (python, etc)

write\_feather(challenge, “data/challenge.feather”)

read\_feather(“data/challenge.feather”)

write.csv(challenge, “data/challenge.csv”)

read\_csv(challenge, “data/challenge.csv”, guess\_max = 1001)

write\_rds(challenge, “data/challenge.rds”)\#tipo de archivo especial de
R

read\_rds(“data/challenge.rds”)
