Importación de datos y operacionalización de variables
================
Macarena Valenzuela Beltrán
4 de agosto

**Importación de datos y operacionalización de variables**

El presente md se basa en el texto de AnalizaR Datos Políticos de
Francisco Urdinez y Cruz
(2019).![](https://arcruz0.github.io/libroadp/carga.html)

Urdinez y Cruz (2019) sostiene que la carga de base de datos en R no es
una tarea fácil. Esto es así, porque las bases de datos siempre
presentan distintos formatos de archivo que optimizan los diferentes
parámetros.

Para poder hacer un ejercicio de descarga vamos a utilizar las bases de
datos de los mismos ejemplos ocupados en el libro AnalizaR Datos
Políticos.

Para ello, vamos a crear un nuevo proyecto en RStudio que lo guardaremos
en nuestro computador. Luego, dentro de la carpeta del proyecto
crearemos una carpeta llamada “Datos”. En este caso, las fotos mostradas
para este ejemplo y los ejemplos posteriores, es la carpeta de nuestro
Taller de Investigación 2020 y dentro de ella creamos la carpeta llamada
“Datos”.

``` r
knitr::include_graphics("Imágenes/carga_datos.png")
```

![](Imágenes/carga_datos.png)<!-- -->

Una vez que creamos la carpeta, podemos guardar nuestra base de datos en
esta carpeta “Datos” incorporada en el proyecto de R local. Para
trabajar este ejercicio de importación, descargaremos la base de datos
del libro AnalizaR Datos Políticos llamada “carga-base” del capítulo 5.
Luego, la guardamos en la carpeta “Datos” de nuestro proyecto de R
local. Esto se debería observar de la siguiente manera:

``` r
knitr::include_graphics("Imágenes/carga_datos.png")
```

![](Imágenes/carga_datos.png)<!-- -->

Una vez guardado el zip (o archivos comprimidos) en la carpeta “Datos”
de nuestro proyecto R local, descomprimimos los archivos con el botón
derecho y debiera aparecer una carpeta llamado “datos” (con minúscula y
nombrada por el creador de la base de datos). Dentro de la carpeta
“datos”, se encuentra el proyecto Desiguales del PNUD. En el libro de
Urdinez y Cruz (2019), se utiliza una pequeña subsección de esta base de
datos. En ella, se encuentran 300 encuestados y encuestadas a lo largo
de 20 variables. La carpeta presenta seis formatos distintos con los
cuales vamos a trabajar para ensayar a importar datos.

A continuación, verás imágenes de como se ven los distintos tipos de
ficheros que se encuentran dentro de la carpeta “datos” de nuestro
proyecto de R local.

``` r
knitr::include_graphics("Imágenes/distintos_ficheros.png")
```

![](Imágenes/distintos_ficheros.png)<!-- -->

**Importación de datos**

Para importar los datos ocuparemos el paquete readr que se encuentra
ubicado dentro del super paquete tidyverse. Por lo tanto, el primer paso
es llamar a a la librería tal como lo hemos aprendido en clases.

``` r
library(tidyverse)
```

    ## -- Attaching packages ------------------------------------------------- tidyverse 1.3.0 --

    ## v ggplot2 3.3.2     v purrr   0.3.4
    ## v tibble  3.0.2     v dplyr   1.0.0
    ## v tidyr   1.0.0     v stringr 1.4.0
    ## v readr   1.3.1     v forcats 0.5.0

    ## -- Conflicts ---------------------------------------------------- tidyverse_conflicts() --
    ## x dplyr::filter() masks stats::filter()
    ## x dplyr::lag()    masks stats::lag()

Tal como lo hemos explicado en variadas ocasiones en clases, tidyverse
contiene el paquete readr para importación de datos. Por lo tanto, ya
estamos listos para comenzar a trabajar. Para cargar el fichero de datos
con formato .csv vamos a ocupar el comando “read\_csv()” de readr y
vamos a crear un objeto que denominaremos df\_desiguales\_csv con el
siguiente comando:

``` r
df_desiguales_csv <- read_csv("Datos/desiguales.csv")
```

    ## Parsed with column specification:
    ## cols(
    ##   .default = col_double()
    ## )

    ## See spec(...) for full column specifications.

El nombre del objeto significa dataframe\_desiguales\_en foramto csv.
Para confirmar que el archivo se encuentra en nuestro ambiente de
trabajo R, ejecutamos el siguiente comando:

``` r
ls()
```

    ## [1] "df_desiguales_csv"

Este comando te señala en la consola el objeto creado y en el Global
Enviroment, (pestaña Enviroment, ubicado en el cuadrante superior
derecho) aparecerá el dataframe señalando las 300 observacioens de 20
variables.

``` r
knitr::include_graphics("Imágenes/Environment.png")
```

![](Imágenes/Environment.png)<!-- -->

Una vez confirmada, la importación de los datos necesitamos saber si es
o no un objeto tipo dataframe. Para ello, utilizaremos el siguiente
comando:

``` r
class(df_desiguales_csv)
```

    ## [1] "spec_tbl_df" "tbl_df"      "tbl"         "data.frame"

Este comando, nos arroja en la consola que es un archivo de tipo
dataframe y tibble (Recordemos que tibble es un formato mejorado de
dataframe propio de R).

Ahora bien, para ver una breve panorámica de nuestra base de datos vamos
a ocupar las funciones del paquete dplyr::select() y la función
dplyr::glimpse(), Así como vamos a observar nuestra base de datos con
otras funciones como head(), str(), summmary().

Para ver una descripción de las variables

``` r
glimpse(df_desiguales_csv)
```

    ## Rows: 300
    ## Columns: 20
    ## $ id        <dbl> 34, 36, 70, 75, 99, 121, 122, 128, 160, 163, 166, 172, 17...
    ## $ sexo      <dbl> 1, 1, 1, 2, 2, 2, 2, 2, 1, 1, 2, 2, 2, 1, 2, 2, 1, 2, 2, ...
    ## $ zona      <dbl> 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 1, 2, 2, 2, 2, 2, 2, ...
    ## $ macrozona <dbl> 4, 4, 2, 2, 4, 2, 2, 4, 2, 2, 2, 2, 2, 4, 4, 4, 4, 4, 4, ...
    ## $ region    <dbl> 13, 13, 7, 7, 13, 7, 7, 13, 7, 7, 7, 5, 7, 13, 13, 13, 13...
    ## $ edad      <dbl> 63, 52, 73, 78, 22, 51, 18, 21, 57, 41, 55, 64, 26, 70, 2...
    ## $ p1_anyo   <dbl> 1952, 1963, 1943, 1938, 1993, 1964, 1997, 1995, 1958, 197...
    ## $ p1_mes    <dbl> 8, 7, 2, 2, 12, 11, 10, 1, 12, 4, 10, 12, 12, 10, 10, 11,...
    ## $ p2        <dbl> 1, 1, 4, 7, 8, 1, 5, 5, 3, 3, 7, 4, 5, 1, 5, 1, 1, 5, 1, ...
    ## $ p3        <dbl> 2, 3, 2, 3, 3, 2, 3, 3, 2, 2, 3, 1, 1, 1, 3, 1, 2, 3, 1, ...
    ## $ p4        <dbl> 1, NA, 1, NA, NA, 1, NA, NA, 1, 2, NA, 1, 2, 1, NA, 2, 1,...
    ## $ p5        <dbl> NA, NA, NA, NA, NA, NA, NA, NA, NA, 2, NA, NA, 1, NA, NA,...
    ## $ p6        <dbl> 5, 5, 5, 6, 10, 10, 8, 10, 6, 8, 7, 10, 9, 10, 9, 5, 6, 8...
    ## $ p7        <dbl> 10, 5, 5, 6, 9, 8, 10, 10, 8, 8, 8, 10, 9, 10, 8, 3, 5, 7...
    ## $ p8        <dbl> 10, 10, 9, 7, 9, 8, 4, 8, 7, 7, 7, 5, 5, 10, 4, 10, 10, 8...
    ## $ p9_1      <dbl> 10, 8, 10, 7, 8, 9, 7, 6, 8, 7, 7, 5, 10, 9, 6, 10, 7, 9,...
    ## $ p9_2      <dbl> 7, 10, 9, 7, 9, 10, 10, 7, 8, 7, 6, 5, 9, 8, 5, 10, 10, 9...
    ## $ p9_3      <dbl> 9, 10, 7, 6, 9, 9, 5, 7, 7, 7, 7, 5, 9, 8, 3, 10, 10, 8, ...
    ## $ p9_4      <dbl> 5, 8, 8, 6, 9, 10, 8, 7, 7, 7, 7, 3, 9, 8, 5, 10, 7, 8, 1...
    ## $ p9_5      <dbl> 8, 8, 9, 7, 10, 9, 8, 6, 8, 8, 8, 10, 9, 7, 7, 10, 10, 10...

Para ver las 10 primeras variables

``` r
df_desiguales_csv %>% select(1:10) %>% glimpse()
```

    ## Rows: 300
    ## Columns: 10
    ## $ id        <dbl> 34, 36, 70, 75, 99, 121, 122, 128, 160, 163, 166, 172, 17...
    ## $ sexo      <dbl> 1, 1, 1, 2, 2, 2, 2, 2, 1, 1, 2, 2, 2, 1, 2, 2, 1, 2, 2, ...
    ## $ zona      <dbl> 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 1, 2, 2, 2, 2, 2, 2, ...
    ## $ macrozona <dbl> 4, 4, 2, 2, 4, 2, 2, 4, 2, 2, 2, 2, 2, 4, 4, 4, 4, 4, 4, ...
    ## $ region    <dbl> 13, 13, 7, 7, 13, 7, 7, 13, 7, 7, 7, 5, 7, 13, 13, 13, 13...
    ## $ edad      <dbl> 63, 52, 73, 78, 22, 51, 18, 21, 57, 41, 55, 64, 26, 70, 2...
    ## $ p1_anyo   <dbl> 1952, 1963, 1943, 1938, 1993, 1964, 1997, 1995, 1958, 197...
    ## $ p1_mes    <dbl> 8, 7, 2, 2, 12, 11, 10, 1, 12, 4, 10, 12, 12, 10, 10, 11,...
    ## $ p2        <dbl> 1, 1, 4, 7, 8, 1, 5, 5, 3, 3, 7, 4, 5, 1, 5, 1, 1, 5, 1, ...
    ## $ p3        <dbl> 2, 3, 2, 3, 3, 2, 3, 3, 2, 2, 3, 1, 1, 1, 3, 1, 2, 3, 1, ...

Para ver las 6 primeras filas

``` r
head(df_desiguales_csv)
```

    ## # A tibble: 6 x 20
    ##      id  sexo  zona macrozona region  edad p1_anyo p1_mes    p2    p3    p4
    ##   <dbl> <dbl> <dbl>     <dbl>  <dbl> <dbl>   <dbl>  <dbl> <dbl> <dbl> <dbl>
    ## 1    34     1     2         4     13    63    1952      8     1     2     1
    ## 2    36     1     2         4     13    52    1963      7     1     3    NA
    ## 3    70     1     2         2      7    73    1943      2     4     2     1
    ## 4    75     2     2         2      7    78    1938      2     7     3    NA
    ## 5    99     2     2         4     13    22    1993     12     8     3    NA
    ## 6   121     2     2         2      7    51    1964     11     1     2     1
    ## # ... with 9 more variables: p5 <dbl>, p6 <dbl>, p7 <dbl>, p8 <dbl>,
    ## #   p9_1 <dbl>, p9_2 <dbl>, p9_3 <dbl>, p9_4 <dbl>, p9_5 <dbl>

Para ver las últimas 6 filas

``` r
tail(df_desiguales_csv)
```

    ## # A tibble: 6 x 20
    ##      id  sexo  zona macrozona region  edad p1_anyo p1_mes    p2    p3    p4
    ##   <dbl> <dbl> <dbl>     <dbl>  <dbl> <dbl>   <dbl>  <dbl> <dbl> <dbl> <dbl>
    ## 1  2779     1     2         4     13    48    1967     11     1     3    NA
    ## 2  2790     1     2         4     13    22    1994      2     5     3    NA
    ## 3  2801     1     2         1      4    24    1992      2     5     3    NA
    ## 4  2805     1     2         4     13    72    1944      4     1     1     1
    ## 5  2806     1     2         4     13    38    1977     10     5     3    NA
    ## 6  2809     1     2         4     13    51    1964     11     4     2     1
    ## # ... with 9 more variables: p5 <dbl>, p6 <dbl>, p7 <dbl>, p8 <dbl>,
    ## #   p9_1 <dbl>, p9_2 <dbl>, p9_3 <dbl>, p9_4 <dbl>, p9_5 <dbl>

Para saber la estructura de las variables

``` r
str(df_desiguales_csv)
```

    ## tibble [300 x 20] (S3: spec_tbl_df/tbl_df/tbl/data.frame)
    ##  $ id       : num [1:300] 34 36 70 75 99 121 122 128 160 163 ...
    ##  $ sexo     : num [1:300] 1 1 1 2 2 2 2 2 1 1 ...
    ##  $ zona     : num [1:300] 2 2 2 2 2 2 2 2 2 2 ...
    ##  $ macrozona: num [1:300] 4 4 2 2 4 2 2 4 2 2 ...
    ##  $ region   : num [1:300] 13 13 7 7 13 7 7 13 7 7 ...
    ##  $ edad     : num [1:300] 63 52 73 78 22 51 18 21 57 41 ...
    ##  $ p1_anyo  : num [1:300] 1952 1963 1943 1938 1993 ...
    ##  $ p1_mes   : num [1:300] 8 7 2 2 12 11 10 1 12 4 ...
    ##  $ p2       : num [1:300] 1 1 4 7 8 1 5 5 3 3 ...
    ##  $ p3       : num [1:300] 2 3 2 3 3 2 3 3 2 2 ...
    ##  $ p4       : num [1:300] 1 NA 1 NA NA 1 NA NA 1 2 ...
    ##  $ p5       : num [1:300] NA NA NA NA NA NA NA NA NA 2 ...
    ##  $ p6       : num [1:300] 5 5 5 6 10 10 8 10 6 8 ...
    ##  $ p7       : num [1:300] 10 5 5 6 9 8 10 10 8 8 ...
    ##  $ p8       : num [1:300] 10 10 9 7 9 8 4 8 7 7 ...
    ##  $ p9_1     : num [1:300] 10 8 10 7 8 9 7 6 8 7 ...
    ##  $ p9_2     : num [1:300] 7 10 9 7 9 10 10 7 8 7 ...
    ##  $ p9_3     : num [1:300] 9 10 7 6 9 9 5 7 7 7 ...
    ##  $ p9_4     : num [1:300] 5 8 8 6 9 10 8 7 7 7 ...
    ##  $ p9_5     : num [1:300] 8 8 9 7 10 9 8 6 8 8 ...
    ##  - attr(*, "spec")=
    ##   .. cols(
    ##   ..   id = col_double(),
    ##   ..   sexo = col_double(),
    ##   ..   zona = col_double(),
    ##   ..   macrozona = col_double(),
    ##   ..   region = col_double(),
    ##   ..   edad = col_double(),
    ##   ..   p1_anyo = col_double(),
    ##   ..   p1_mes = col_double(),
    ##   ..   p2 = col_double(),
    ##   ..   p3 = col_double(),
    ##   ..   p4 = col_double(),
    ##   ..   p5 = col_double(),
    ##   ..   p6 = col_double(),
    ##   ..   p7 = col_double(),
    ##   ..   p8 = col_double(),
    ##   ..   p9_1 = col_double(),
    ##   ..   p9_2 = col_double(),
    ##   ..   p9_3 = col_double(),
    ##   ..   p9_4 = col_double(),
    ##   ..   p9_5 = col_double()
    ##   .. )

Para ver un resumen estadístico.

``` r
summary(df_desiguales_csv)
```

    ##        id              sexo           zona         macrozona    
    ##  Min.   :  34.0   Min.   :1.00   Min.   :1.000   Min.   :1.000  
    ##  1st Qu.: 704.2   1st Qu.:1.00   1st Qu.:2.000   1st Qu.:2.000  
    ##  Median :1320.5   Median :2.00   Median :2.000   Median :3.000  
    ##  Mean   :1380.4   Mean   :1.61   Mean   :1.847   Mean   :2.993  
    ##  3rd Qu.:2031.2   3rd Qu.:2.00   3rd Qu.:2.000   3rd Qu.:4.000  
    ##  Max.   :2809.0   Max.   :2.00   Max.   :2.000   Max.   :4.000  
    ##                                                                 
    ##      region            edad          p1_anyo         p1_mes      
    ##  Min.   : 1.000   Min.   :18.00   Min.   :1928   Min.   : 1.000  
    ##  1st Qu.: 6.000   1st Qu.:29.00   1st Qu.:1956   1st Qu.: 4.000  
    ##  Median :10.000   Median :49.00   Median :1967   Median : 7.000  
    ##  Mean   : 9.447   Mean   :46.72   Mean   :1969   Mean   : 6.663  
    ##  3rd Qu.:13.000   3rd Qu.:60.00   3rd Qu.:1986   3rd Qu.:10.000  
    ##  Max.   :15.000   Max.   :87.00   Max.   :1998   Max.   :12.000  
    ##                                                                  
    ##        p2               p3              p4              p5       
    ##  Min.   : 1.000   Min.   :1.000   Min.   :1.000   Min.   :1.000  
    ##  1st Qu.: 1.000   1st Qu.:1.000   1st Qu.:1.000   1st Qu.:1.000  
    ##  Median : 5.000   Median :2.000   Median :1.000   Median :1.000  
    ##  Mean   : 4.417   Mean   :1.883   Mean   :1.603   Mean   :1.718  
    ##  3rd Qu.: 5.000   3rd Qu.:3.000   3rd Qu.:2.000   3rd Qu.:2.000  
    ##  Max.   :99.000   Max.   :9.000   Max.   :3.000   Max.   :8.000  
    ##                                   NA's   :106     NA's   :215    
    ##        p6               p7               p8              p9_1       
    ##  Min.   : 1.000   Min.   : 1.000   Min.   : 1.000   Min.   : 1.000  
    ##  1st Qu.: 6.000   1st Qu.: 7.000   1st Qu.: 7.000   1st Qu.: 7.000  
    ##  Median : 7.000   Median : 8.000   Median : 9.000   Median : 8.000  
    ##  Mean   : 7.303   Mean   : 7.893   Mean   : 9.123   Mean   : 8.277  
    ##  3rd Qu.: 9.000   3rd Qu.:10.000   3rd Qu.:10.000   3rd Qu.:10.000  
    ##  Max.   :10.000   Max.   :10.000   Max.   :99.000   Max.   :88.000  
    ##                                                                     
    ##       p9_2             p9_3             p9_4             p9_5       
    ##  Min.   : 1.000   Min.   : 1.000   Min.   : 1.000   Min.   : 1.000  
    ##  1st Qu.: 8.000   1st Qu.: 7.000   1st Qu.: 7.000   1st Qu.: 7.000  
    ##  Median : 9.000   Median : 9.000   Median : 8.000   Median : 9.000  
    ##  Mean   : 8.537   Mean   : 8.127   Mean   : 8.063   Mean   : 8.157  
    ##  3rd Qu.:10.000   3rd Qu.:10.000   3rd Qu.:10.000   3rd Qu.:10.000  
    ##  Max.   :10.000   Max.   :10.000   Max.   :10.000   Max.   :10.000  
    ## 

Para ver las dimensiones del dataframe

``` r
dim(df_desiguales_csv)
```

    ## [1] 300  20

**Algunos respasos: archivos crados en .RData y .rds** Los archivos
.Rdata ó .Rda permiten almacenar cualquier objeto en R (vector,
dataframe, matriz, lista). Se diferencian porque el primero puede
contener cualquier número de objetos. Mientras que le segundo contiene
un número limitado de objetos (Urdinez y Cruz, 2019).

Para cargar el archivo digitamos el siguiente código:

``` r
load("Datos/desiguales.Rdata")
```

Confirmamos su carga y posteriormente podemos observar los datos con los
comandos anteriores

``` r
ls()
```

    ## [1] "df_desiguales_csv"   "df_desiguales_rdata" "vector_edades"

Para cargar archivos formato .rds

``` r
df_desiguales_rds <- read_rds("Datos/desiguales.rds")
ls()
```

    ## [1] "df_desiguales_csv"   "df_desiguales_rdata" "df_desiguales_rds"  
    ## [4] "vector_edades"

``` r
class(df_desiguales_rds)
```

    ## [1] "spec_tbl_df" "tbl_df"      "tbl"         "data.frame"

\*\* Importación de ficheros Stata o SPSS: Observación de datos con
etiquetas\*\* Una de las cosas interesantes que he visto en este libro
de Urdinez y Cruz (2019) y que no he visto tan claramente y en forma tan
ordenada en otros textos, es la importación de ficheros Stata o SPSS y
como podemos ver en R las etiquetas que este tipo de datos facilita para
poder observar las variables.

Por ejemplo, como hemos observado en la importación de datos anteriores
los archivos tienen unas variables llamadas p2, mp3, p4, etc. A simple
vista, no sabemos que significan esas variables si no tenemos a
disposición el Libro de Código.

Para el caso de los archivos .dta (Stata) y .sav (SPSS), las bases de
datos vienen con las columnas etiquetadas. Urdinez y Cruz (2019),
explican muy bien como hacer uso de estas etiquetas en el ambiente de R.

**Carga de base de datos con etiquetas**

Para cargar bases de datos con etiquetas, tenemos que llamar a las
librerias tidyverse y haven. Como ya hemos cargado tidyverse solo
llamamos a la librería have

``` r
library(haven)
```

Ahora procedemos a importar los ficheros .dta y .sav con los siguiente
comandos.

``` r
df_desiguales_spss <- read_spss("Datos/desiguales.sav")

df_desiguales_stata <- read_stata("Datos/desiguales.dta")

ls()
```

    ## [1] "df_desiguales_csv"   "df_desiguales_rdata" "df_desiguales_rds"  
    ## [4] "df_desiguales_spss"  "df_desiguales_stata" "vector_edades"

``` r
class(df_desiguales_spss)
```

    ## [1] "tbl_df"     "tbl"        "data.frame"

``` r
class(df_desiguales_stata)
```

    ## [1] "tbl_df"     "tbl"        "data.frame"

Al igual que con las bases anteriores podemos observar las variables y
observaciones que contienen nuestros nuevos ficheros.

``` r
df_desiguales_spss %>% select(1:10) %>% glimpse()
```

    ## Rows: 300
    ## Columns: 10
    ## $ id        <dbl> 34, 36, 70, 75, 99, 121, 122, 128, 160, 163, 166, 172, 17...
    ## $ sexo      <dbl+lbl> 1, 1, 1, 2, 2, 2, 2, 2, 1, 1, 2, 2, 2, 1, 2, 2, 1, 2,...
    ## $ zona      <dbl+lbl> 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 1, 2, 2, 2, 2, 2,...
    ## $ macrozona <dbl+lbl> 4, 4, 2, 2, 4, 2, 2, 4, 2, 2, 2, 2, 2, 4, 4, 4, 4, 4,...
    ## $ region    <dbl+lbl> 13, 13,  7,  7, 13,  7,  7, 13,  7,  7,  7,  5,  7, 1...
    ## $ edad      <dbl> 63, 52, 73, 78, 22, 51, 18, 21, 57, 41, 55, 64, 26, 70, 2...
    ## $ p1_anyo   <dbl+lbl> 1952, 1963, 1943, 1938, 1993, 1964, 1997, 1995, 1958,...
    ## $ p1_mes    <dbl+lbl>  8,  7,  2,  2, 12, 11, 10,  1, 12,  4, 10, 12, 12, 1...
    ## $ p2        <dbl+lbl> 1, 1, 4, 7, 8, 1, 5, 5, 3, 3, 7, 4, 5, 1, 5, 1, 1, 5,...
    ## $ p3        <dbl+lbl> 2, 3, 2, 3, 3, 2, 3, 3, 2, 2, 3, 1, 1, 1, 3, 1, 2, 3,...

Ahora observemos las primeras 6 filas y las etiquetas de la columna p2

``` r
head(df_desiguales_stata$p2)
```

    ## <labelled<double>[6]>: P2 - Â¿podria decirme cual es su estado conyugal o civil actual?
    ## [1] 1 1 4 7 8 1
    ## 
    ## Labels:
    ##  value                                                 label
    ##      1                             Casado(a) por primera vez
    ##      2                      Casado(a) por segunda vez o mÃ¡s
    ##      3          Casado(a) legalmente, pero separado de hecho
    ##      4                                            Divorciado
    ##      5                        Soltero(a), nunca se ha casado
    ##      6 Soltero(a), pero con un matrimonio legalmente anulado
    ##      7                                              Viudo(a)
    ##      8                                  Conviviente o pareja
    ##     88                                          NS (no leer)
    ##     99                                          NR (no leer)

**Importación de archivos Excel** La importación de los archivos excel
es uno de los más comunes en las ciencias sociales. Generalmente,
nosotros mismos construimos nuestas pequeñas bases de datos en excel
para realizar nuestras tesinas, memorias o tesis.

Para importar archivos excel tenemos que llamar a la librería readxl

``` r
library(readxl)
```

Para cargar los ficheros de excel usamos los comandos read\_excel() de
readxl() Trabajar con archivos excel en R o en cualquier otro software
de análisis de datos tiene la pequeña dificultad de tratar o limpiar los
**metadatos** que se encuantran antes de las variables y observaciones
en sí mismas. Estos metadatos son inforamción adicional y explicativa
que generalmente ponemos en nuestras bases de datos.

Por ejemplo, si observamos el archivo cead.xls ó .xlsx, como archivo
excel en nustra carpeta local cargado ya en nuestra carpeta “Datos” de
nuestro proyecto R local, observaremos que que existen 17 fila con
metadatos

``` r
df_cead_excel <- read_excel("Datos/cead.xls")
```

    ## New names:
    ## * `` -> ...3
    ## * `` -> ...4
    ## * `` -> ...5
    ## * `` -> ...6
    ## * `` -> ...7

``` r
ls()
```

    ## [1] "df_cead_excel"       "df_desiguales_csv"   "df_desiguales_rdata"
    ## [4] "df_desiguales_rds"   "df_desiguales_spss"  "df_desiguales_stata"
    ## [7] "vector_edades"

``` r
df_cead_excel %>% glimpse()
```

    ## Rows: 79
    ## Columns: 7
    ## $ Medida     <chr> "Tipo de Datos", NA, "Unidad Territorial", "Regiones", "...
    ## $ Frecuencia <chr> "Casos Policiales", NA, NA, "Región Metropolitana", "Pro...
    ## $ ...3       <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, ...
    ## $ ...4       <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, ...
    ## $ ...5       <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, ...
    ## $ ...6       <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, ...
    ## $ ...7       <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, ...

Para solucionar esto, ocupamos la función skip =. De esta manera, le
decimos a R que no considerar las primeras filas y que comience a
analizar desde la siguiente.

``` r
df_cead_excel_v2 <- read_excel("Datos/cead.xls", skip = 18) 
```

    ## New names:
    ## * `` -> ...1

También se puede delimitar el rango de filas para observar el cuadrado
de nuestro interés con la función range() y el siguiente comando:

``` r
df_cead_excel_v3 <- read_excel("datos/cead.xls", range = "A20:G81")
```

    ## New names:
    ## * `` -> ...1

Otro problema de excel es que la información puede estar dividida en
distintas hojas. Para solucionar esto ocuparemos la función sheet () del
paquete readxl. Con la función sheet, seleccionamos la hoja que queremos
cargar, con skip seleccionamos la fila que nos queremos saltar y con na
señalamos a R que denominamos not available a las observaciones en
blanco o los datos no recepcionados (que para efectos de la base es lo
mismo).

``` r
df_sinim_excel <- read_excel("Datos/sinim.xls", 
                             sheet = 2, skip = 2, na = "No Recepcionado")
```

Otro de los problemas comunes de excel es como se escribe el nombre de
las variables. Generalmente, nosotros mismos las escribimos con mucho
detalle. Veamos como están escritas en esta base de datos.

``` r
names(df_sinim_excel)
```

    ## [1] "CODIGO"    "MUNICIPIO" "2017"      "2016"

Para poder dar una visión uniforme a los nombres de las variables y que
luego nos sea mas fácil codificar los comandos sin preocuparnos por
tanto detalle, vamos a ocupar el paquete JANITOR. Lo instalamos
(install.packages(“janitor”)) y llamamos sus librerías

``` r
library(janitor)
```

    ## 
    ## Attaching package: 'janitor'

    ## The following objects are masked from 'package:stats':
    ## 
    ##     chisq.test, fisher.test

Luego, creamos una versión 2 de nuestra base de datos con los nombres de
las variables limpias

``` r
df_sinim_excel_v2 <- df_sinim_excel %>% janitor::clean_names()
```

Si ahora revisamos nuestra base de datos. Todos los nombres de las
variables tendrán el mismo formato y será mucho mas rápido y fácil
codificar.

``` r
names(df_sinim_excel_v2)
```

    ## [1] "codigo"    "municipio" "x2017"     "x2016"

**Limpieza y transformación de datos para operacionalizar nuestras
variables de la hipótesis** Durante el semestre, ya hemos aprendido a
limpiar y transformar los datos que importamos. \#’ Ahora, con una base
de datos real, vamos a limpiar y transformar en función de una
hipótesis. Limpiamos la base de datos: nos damos cuenta que la base de
datos llamada df\_cead\_excel\_v2 existe una columna con el nombre “…1”
y tenemos que asignar un nombre. y Además, nos damos cuenta que en las
columnas todas las variables son años. Por tanto, según el principio de
limpieza de datos vamos a transformarla y distribuir los valores por
filas de año y comuna.

``` r
df_cead_excel_v4 <- df_cead_excel_v2 %>% 
  rename(comunas = "...1") %>% 
  gather(key = años, value = n_crímenes, -comunas)
```

Luego, fijamos nuestra hipótesis: “La felicidad de las personas en Chile
esta determinado por el trato que reciben” La variable dependiente: “La
felicidad de las personas en Chile” La variable independiente: “El trato
que reciben”

Esta hipótesis será operacionalizada con la base de datos de desiguales
de PNUD. La ficha de esta base es…

Operacionalización de las variables:

Variable dependiente: “La felicidad de las personas en Chile” se
operacionaliza con la preguna p6 de nuestra base de datos que señala:
¿Cuán satisfecho está usted con su vida? Esta pregunta está medida con
la siguiente escala

``` r
head(df_desiguales_stata$p6)
```

    ## <labelled<double>[6]>: P6 - Â¿cuan satisfecho o insatisfecho esta ud. con su vida?
    ## [1]  5  5  5  6 10 10
    ## 
    ## Labels:
    ##  value                           label
    ##      1 1 Completamente insatisfecho(a)
    ##      2                               2
    ##      3                               3
    ##      4                               4
    ##      5                               5
    ##      6                               6
    ##      7                               7
    ##      8                               8
    ##      9                               9
    ##     10  10 Completamente satisfecho(a)
    ##     88                    NS (no leer)
    ##     99                    NR (no leer)

Variable independiente: “El trato que reciben” Operacionalización de la
variable: ocuparé la variable p9\_4 de mi base de datos que consiste en
la siguiente pregunta. ¿Cuán desigual cree usted que es Chile? Trato.

Para ver la escala de medición de esta pregunta

``` r
head(df_desiguales_stata$p9_4) 
```

    ## <labelled<double>[6]>: P9D - Â¿cuan desigual cree que es Chile? Trato
    ## [1]  5  8  8  6  9 10
    ## 
    ## Labels:
    ##  value           label
    ##      1     1 Muy igual
    ##      2               2
    ##      3               3
    ##      4               4
    ##      5               5
    ##      6               6
    ##      7               7
    ##      8               8
    ##      9               9
    ##     10 10 Muy desigual
    ##     88    NS (no leer)
    ##     99    NR (no leer)

Estos datos se analizarán con modelos de regresión logit, lineal o
mulivariado.
