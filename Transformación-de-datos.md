md(“Transformación de datos”)
================
Macarena Valenzuela Beltrán
8 de julio

Transformación de datos El paquete dplyr tiene 5 funciones para
transformar los datos \* filter() -\> filtra las observaciones a partir
de valores concretos \* arrange()-\> reordena las filas

  - select() -\> selecciona las vasriables con sus respectivos nombres

  - mutate() -\> crear nuevas variables a partir de las existentes

  - sumarise()-\> colapsa valores seleccionados para dar un resumen de
    los mismos (media, rango, la mediana, la sd)

  - group\_by -\> opera la función a la que acompaña grupo a grupo
    llamamos la librería de tidyverse y vemos sus subpaquetes

<!-- end list -->

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

llamamos la librería de la base de datos que vamos a ocupar

``` r
library(nycflights13)
```

seleccionamos la base de datos flights desde la gran base de datos
nycflights13

``` r
nycflights13::flights
```

    ## # A tibble: 336,776 x 19
    ##     year month   day dep_time sched_dep_time dep_delay arr_time sched_arr_time
    ##    <int> <int> <int>    <int>          <int>     <dbl>    <int>          <int>
    ##  1  2013     1     1      517            515         2      830            819
    ##  2  2013     1     1      533            529         4      850            830
    ##  3  2013     1     1      542            540         2      923            850
    ##  4  2013     1     1      544            545        -1     1004           1022
    ##  5  2013     1     1      554            600        -6      812            837
    ##  6  2013     1     1      554            558        -4      740            728
    ##  7  2013     1     1      555            600        -5      913            854
    ##  8  2013     1     1      557            600        -3      709            723
    ##  9  2013     1     1      557            600        -3      838            846
    ## 10  2013     1     1      558            600        -2      753            745
    ## # ... with 336,766 more rows, and 11 more variables: arr_delay <dbl>,
    ## #   carrier <chr>, flight <int>, tailnum <chr>, origin <chr>, dest <chr>,
    ## #   air_time <dbl>, distance <dbl>, hour <dbl>, minute <dbl>, time_hour <dttm>

para saber que es lo que contiene la base de datos flights

``` r
?flights
```

    ## starting httpd help server ... done

para ver la base de datos completa

``` r
view(flights)
```

Comencemos a hacer transformación de datos \*\* Función filter()\*\*
Veamos todos los vuelos que salieton el 1° de enero

``` r
filter(flights, month==1, day==1)
```

    ## # A tibble: 842 x 19
    ##     year month   day dep_time sched_dep_time dep_delay arr_time sched_arr_time
    ##    <int> <int> <int>    <int>          <int>     <dbl>    <int>          <int>
    ##  1  2013     1     1      517            515         2      830            819
    ##  2  2013     1     1      533            529         4      850            830
    ##  3  2013     1     1      542            540         2      923            850
    ##  4  2013     1     1      544            545        -1     1004           1022
    ##  5  2013     1     1      554            600        -6      812            837
    ##  6  2013     1     1      554            558        -4      740            728
    ##  7  2013     1     1      555            600        -5      913            854
    ##  8  2013     1     1      557            600        -3      709            723
    ##  9  2013     1     1      557            600        -3      838            846
    ## 10  2013     1     1      558            600        -2      753            745
    ## # ... with 832 more rows, and 11 more variables: arr_delay <dbl>,
    ## #   carrier <chr>, flight <int>, tailnum <chr>, origin <chr>, dest <chr>,
    ## #   air_time <dbl>, distance <dbl>, hour <dbl>, minute <dbl>, time_hour <dttm>

``` r
vuelosenero <- filter(flights, month==1, day==1)

vuelosenero
```

    ## # A tibble: 842 x 19
    ##     year month   day dep_time sched_dep_time dep_delay arr_time sched_arr_time
    ##    <int> <int> <int>    <int>          <int>     <dbl>    <int>          <int>
    ##  1  2013     1     1      517            515         2      830            819
    ##  2  2013     1     1      533            529         4      850            830
    ##  3  2013     1     1      542            540         2      923            850
    ##  4  2013     1     1      544            545        -1     1004           1022
    ##  5  2013     1     1      554            600        -6      812            837
    ##  6  2013     1     1      554            558        -4      740            728
    ##  7  2013     1     1      555            600        -5      913            854
    ##  8  2013     1     1      557            600        -3      709            723
    ##  9  2013     1     1      557            600        -3      838            846
    ## 10  2013     1     1      558            600        -2      753            745
    ## # ... with 832 more rows, and 11 more variables: arr_delay <dbl>,
    ## #   carrier <chr>, flight <int>, tailnum <chr>, origin <chr>, dest <chr>,
    ## #   air_time <dbl>, distance <dbl>, hour <dbl>, minute <dbl>, time_hour <dttm>

``` r
view(vuelosenero)
```

para saber los vuelos en mi cumpleaños

``` r
vuelos28dic <- filter(flights, month == 12, day == 28) 

vuelos28dic
```

    ## # A tibble: 814 x 19
    ##     year month   day dep_time sched_dep_time dep_delay arr_time sched_arr_time
    ##    <int> <int> <int>    <int>          <int>     <dbl>    <int>          <int>
    ##  1  2013    12    28        7           2359         8      433            445
    ##  2  2013    12    28       56           2245       131      345            127
    ##  3  2013    12    28      507            500         7      638            651
    ##  4  2013    12    28      508            515        -7      755            814
    ##  5  2013    12    28      539            540        -1      830            850
    ##  6  2013    12    28      539            545        -6      821            845
    ##  7  2013    12    28      547            600       -13      636            658
    ##  8  2013    12    28      551            550         1     1031           1027
    ##  9  2013    12    28      553            600        -7      737            745
    ## 10  2013    12    28      553            600        -7      809            835
    ## # ... with 804 more rows, and 11 more variables: arr_delay <dbl>,
    ## #   carrier <chr>, flight <int>, tailnum <chr>, origin <chr>, dest <chr>,
    ## #   air_time <dbl>, distance <dbl>, hour <dbl>, minute <dbl>, time_hour <dttm>

``` r
view(vuelos28dic)
```

¿En qué día salen mas vuelos: el 1° de enero o el 25 de diciembre?

``` r
filter(flights, month == 12, day == 25)
```

    ## # A tibble: 719 x 19
    ##     year month   day dep_time sched_dep_time dep_delay arr_time sched_arr_time
    ##    <int> <int> <int>    <int>          <int>     <dbl>    <int>          <int>
    ##  1  2013    12    25      456            500        -4      649            651
    ##  2  2013    12    25      524            515         9      805            814
    ##  3  2013    12    25      542            540         2      832            850
    ##  4  2013    12    25      546            550        -4     1022           1027
    ##  5  2013    12    25      556            600        -4      730            745
    ##  6  2013    12    25      557            600        -3      743            752
    ##  7  2013    12    25      557            600        -3      818            831
    ##  8  2013    12    25      559            600        -1      855            856
    ##  9  2013    12    25      559            600        -1      849            855
    ## 10  2013    12    25      600            600         0      850            846
    ## # ... with 709 more rows, and 11 more variables: arr_delay <dbl>,
    ## #   carrier <chr>, flight <int>, tailnum <chr>, origin <chr>, dest <chr>,
    ## #   air_time <dbl>, distance <dbl>, hour <dbl>, minute <dbl>, time_hour <dttm>

``` r
filter(flights, month==1, day==1)
```

    ## # A tibble: 842 x 19
    ##     year month   day dep_time sched_dep_time dep_delay arr_time sched_arr_time
    ##    <int> <int> <int>    <int>          <int>     <dbl>    <int>          <int>
    ##  1  2013     1     1      517            515         2      830            819
    ##  2  2013     1     1      533            529         4      850            830
    ##  3  2013     1     1      542            540         2      923            850
    ##  4  2013     1     1      544            545        -1     1004           1022
    ##  5  2013     1     1      554            600        -6      812            837
    ##  6  2013     1     1      554            558        -4      740            728
    ##  7  2013     1     1      555            600        -5      913            854
    ##  8  2013     1     1      557            600        -3      709            723
    ##  9  2013     1     1      557            600        -3      838            846
    ## 10  2013     1     1      558            600        -2      753            745
    ## # ... with 832 more rows, and 11 more variables: arr_delay <dbl>,
    ## #   carrier <chr>, flight <int>, tailnum <chr>, origin <chr>, dest <chr>,
    ## #   air_time <dbl>, distance <dbl>, hour <dbl>, minute <dbl>, time_hour <dttm>

Manejo de los datos no disponibles NA (Not Available) Los NA son
contagiosos: cualquier operación que involucre un resultado NA dará como
resultado NA

``` r
10 == NA
```

    ## [1] NA

``` r
NA >0
```

    ## [1] NA

``` r
NA + 5
```

    ## [1] NA

``` r
NA / 5
```

    ## [1] NA

Si tengo una base y quiero sacar el promedio y entre

los datos se encuentra aunque sea un solo NA, el resultado

promedio será NA la tía María tiene edad desconocida

``` r
edad.maría<- NA
```

al tío Pedro no lo veo hace mucho años, por tanto no sé cuantos años
tiene ahora

``` r
edad.pedro<- NA

edad.maría==edad.pedro
```

    ## [1] NA

Para controlar el contagio de los NA usamos la función is.na()

``` r
is.na(edad.maría)
```

    ## [1] TRUE

``` r
df<-tibble(x= c(1,2, NA, 4, 5))

df
```

    ## # A tibble: 5 x 1
    ##       x
    ##   <dbl>
    ## 1     1
    ## 2     2
    ## 3    NA
    ## 4     4
    ## 5     5

filtramos la base de datoa df para saber cuales son los calores mayores
a 2

``` r
filter(df, x>2)
```

    ## # A tibble: 2 x 1
    ##       x
    ##   <dbl>
    ## 1     4
    ## 2     5

los datos NA pueden aparecer en forma explícita y en forma implícita

``` r
roi<-tibble(
  year=c(rep(2016, 4), rep(2017, 4), 2018),
  quarter=c(rep(c(1,2,3,4), 2), 1),
  return=rnorm(9, mean = 0.5, sd= 1)
)

roi$return[7]
```

    ## [1] -0.171631

``` r
roi %>% 
  spread(year, return)
```

    ## # A tibble: 4 x 4
    ##   quarter `2016` `2017` `2018`
    ##     <dbl>  <dbl>  <dbl>  <dbl>
    ## 1       1  0.129  0.638  0.297
    ## 2       2 -0.530  0.398 NA    
    ## 3       3  0.358 -0.172 NA    
    ## 4       4  0.929  1.78  NA

para solucionar ocupamos la función na.rm() **función arrange()** para
ver las primeras variables y las primeras filas

``` r
head(flights)
```

    ## # A tibble: 6 x 19
    ##    year month   day dep_time sched_dep_time dep_delay arr_time sched_arr_time
    ##   <int> <int> <int>    <int>          <int>     <dbl>    <int>          <int>
    ## 1  2013     1     1      517            515         2      830            819
    ## 2  2013     1     1      533            529         4      850            830
    ## 3  2013     1     1      542            540         2      923            850
    ## 4  2013     1     1      544            545        -1     1004           1022
    ## 5  2013     1     1      554            600        -6      812            837
    ## 6  2013     1     1      554            558        -4      740            728
    ## # ... with 11 more variables: arr_delay <dbl>, carrier <chr>, flight <int>,
    ## #   tailnum <chr>, origin <chr>, dest <chr>, air_time <dbl>, distance <dbl>,
    ## #   hour <dbl>, minute <dbl>, time_hour <dttm>

para ver las primeras 15 filas

``` r
head(flights, 15)
```

    ## # A tibble: 15 x 19
    ##     year month   day dep_time sched_dep_time dep_delay arr_time sched_arr_time
    ##    <int> <int> <int>    <int>          <int>     <dbl>    <int>          <int>
    ##  1  2013     1     1      517            515         2      830            819
    ##  2  2013     1     1      533            529         4      850            830
    ##  3  2013     1     1      542            540         2      923            850
    ##  4  2013     1     1      544            545        -1     1004           1022
    ##  5  2013     1     1      554            600        -6      812            837
    ##  6  2013     1     1      554            558        -4      740            728
    ##  7  2013     1     1      555            600        -5      913            854
    ##  8  2013     1     1      557            600        -3      709            723
    ##  9  2013     1     1      557            600        -3      838            846
    ## 10  2013     1     1      558            600        -2      753            745
    ## 11  2013     1     1      558            600        -2      849            851
    ## 12  2013     1     1      558            600        -2      853            856
    ## 13  2013     1     1      558            600        -2      924            917
    ## 14  2013     1     1      558            600        -2      923            937
    ## 15  2013     1     1      559            600        -1      941            910
    ## # ... with 11 more variables: arr_delay <dbl>, carrier <chr>, flight <int>,
    ## #   tailnum <chr>, origin <chr>, dest <chr>, air_time <dbl>, distance <dbl>,
    ## #   hour <dbl>, minute <dbl>, time_hour <dttm>

para ver las últimas filas de la base de datos

``` r
tail(flights, 10)
```

    ## # A tibble: 10 x 19
    ##     year month   day dep_time sched_dep_time dep_delay arr_time sched_arr_time
    ##    <int> <int> <int>    <int>          <int>     <dbl>    <int>          <int>
    ##  1  2013     9    30     2240           2250       -10     2347              7
    ##  2  2013     9    30     2241           2246        -5     2345              1
    ##  3  2013     9    30     2307           2255        12     2359           2358
    ##  4  2013     9    30     2349           2359       -10      325            350
    ##  5  2013     9    30       NA           1842        NA       NA           2019
    ##  6  2013     9    30       NA           1455        NA       NA           1634
    ##  7  2013     9    30       NA           2200        NA       NA           2312
    ##  8  2013     9    30       NA           1210        NA       NA           1330
    ##  9  2013     9    30       NA           1159        NA       NA           1344
    ## 10  2013     9    30       NA            840        NA       NA           1020
    ## # ... with 11 more variables: arr_delay <dbl>, carrier <chr>, flight <int>,
    ## #   tailnum <chr>, origin <chr>, dest <chr>, air_time <dbl>, distance <dbl>,
    ## #   hour <dbl>, minute <dbl>, time_hour <dttm>

para ordenar la base de datos por año

``` r
arrange(flights, year)
```

    ## # A tibble: 336,776 x 19
    ##     year month   day dep_time sched_dep_time dep_delay arr_time sched_arr_time
    ##    <int> <int> <int>    <int>          <int>     <dbl>    <int>          <int>
    ##  1  2013     1     1      517            515         2      830            819
    ##  2  2013     1     1      533            529         4      850            830
    ##  3  2013     1     1      542            540         2      923            850
    ##  4  2013     1     1      544            545        -1     1004           1022
    ##  5  2013     1     1      554            600        -6      812            837
    ##  6  2013     1     1      554            558        -4      740            728
    ##  7  2013     1     1      555            600        -5      913            854
    ##  8  2013     1     1      557            600        -3      709            723
    ##  9  2013     1     1      557            600        -3      838            846
    ## 10  2013     1     1      558            600        -2      753            745
    ## # ... with 336,766 more rows, and 11 more variables: arr_delay <dbl>,
    ## #   carrier <chr>, flight <int>, tailnum <chr>, origin <chr>, dest <chr>,
    ## #   air_time <dbl>, distance <dbl>, hour <dbl>, minute <dbl>, time_hour <dttm>

para ordenar por año, mes y por día

``` r
arrange(flights, year, month, day)
```

    ## # A tibble: 336,776 x 19
    ##     year month   day dep_time sched_dep_time dep_delay arr_time sched_arr_time
    ##    <int> <int> <int>    <int>          <int>     <dbl>    <int>          <int>
    ##  1  2013     1     1      517            515         2      830            819
    ##  2  2013     1     1      533            529         4      850            830
    ##  3  2013     1     1      542            540         2      923            850
    ##  4  2013     1     1      544            545        -1     1004           1022
    ##  5  2013     1     1      554            600        -6      812            837
    ##  6  2013     1     1      554            558        -4      740            728
    ##  7  2013     1     1      555            600        -5      913            854
    ##  8  2013     1     1      557            600        -3      709            723
    ##  9  2013     1     1      557            600        -3      838            846
    ## 10  2013     1     1      558            600        -2      753            745
    ## # ... with 336,766 more rows, and 11 more variables: arr_delay <dbl>,
    ## #   carrier <chr>, flight <int>, tailnum <chr>, origin <chr>, dest <chr>,
    ## #   air_time <dbl>, distance <dbl>, hour <dbl>, minute <dbl>, time_hour <dttm>

``` r
salida_dato<-arrange(flights, year, month, day)

salida_dato
```

    ## # A tibble: 336,776 x 19
    ##     year month   day dep_time sched_dep_time dep_delay arr_time sched_arr_time
    ##    <int> <int> <int>    <int>          <int>     <dbl>    <int>          <int>
    ##  1  2013     1     1      517            515         2      830            819
    ##  2  2013     1     1      533            529         4      850            830
    ##  3  2013     1     1      542            540         2      923            850
    ##  4  2013     1     1      544            545        -1     1004           1022
    ##  5  2013     1     1      554            600        -6      812            837
    ##  6  2013     1     1      554            558        -4      740            728
    ##  7  2013     1     1      555            600        -5      913            854
    ##  8  2013     1     1      557            600        -3      709            723
    ##  9  2013     1     1      557            600        -3      838            846
    ## 10  2013     1     1      558            600        -2      753            745
    ## # ... with 336,766 more rows, and 11 more variables: arr_delay <dbl>,
    ## #   carrier <chr>, flight <int>, tailnum <chr>, origin <chr>, dest <chr>,
    ## #   air_time <dbl>, distance <dbl>, hour <dbl>, minute <dbl>, time_hour <dttm>

``` r
tail(salida_dato)
```

    ## # A tibble: 6 x 19
    ##    year month   day dep_time sched_dep_time dep_delay arr_time sched_arr_time
    ##   <int> <int> <int>    <int>          <int>     <dbl>    <int>          <int>
    ## 1  2013    12    31       NA            855        NA       NA           1142
    ## 2  2013    12    31       NA            705        NA       NA            931
    ## 3  2013    12    31       NA            825        NA       NA           1029
    ## 4  2013    12    31       NA           1615        NA       NA           1800
    ## 5  2013    12    31       NA            600        NA       NA            735
    ## 6  2013    12    31       NA            830        NA       NA           1154
    ## # ... with 11 more variables: arr_delay <dbl>, carrier <chr>, flight <int>,
    ## #   tailnum <chr>, origin <chr>, dest <chr>, air_time <dbl>, distance <dbl>,
    ## #   hour <dbl>, minute <dbl>, time_hour <dttm>

ordenar de mayor a menor utilizamos la función desc()

``` r
arrange(flights, desc(arr_delay))
```

    ## # A tibble: 336,776 x 19
    ##     year month   day dep_time sched_dep_time dep_delay arr_time sched_arr_time
    ##    <int> <int> <int>    <int>          <int>     <dbl>    <int>          <int>
    ##  1  2013     1     9      641            900      1301     1242           1530
    ##  2  2013     6    15     1432           1935      1137     1607           2120
    ##  3  2013     1    10     1121           1635      1126     1239           1810
    ##  4  2013     9    20     1139           1845      1014     1457           2210
    ##  5  2013     7    22      845           1600      1005     1044           1815
    ##  6  2013     4    10     1100           1900       960     1342           2211
    ##  7  2013     3    17     2321            810       911      135           1020
    ##  8  2013     7    22     2257            759       898      121           1026
    ##  9  2013    12     5      756           1700       896     1058           2020
    ## 10  2013     5     3     1133           2055       878     1250           2215
    ## # ... with 336,766 more rows, and 11 more variables: arr_delay <dbl>,
    ## #   carrier <chr>, flight <int>, tailnum <chr>, origin <chr>, dest <chr>,
    ## #   air_time <dbl>, distance <dbl>, hour <dbl>, minute <dbl>, time_hour <dttm>

ordenar los primeros datos en forma descendente

``` r
head(arrange(flights, desc(arr_delay)))
```

    ## # A tibble: 6 x 19
    ##    year month   day dep_time sched_dep_time dep_delay arr_time sched_arr_time
    ##   <int> <int> <int>    <int>          <int>     <dbl>    <int>          <int>
    ## 1  2013     1     9      641            900      1301     1242           1530
    ## 2  2013     6    15     1432           1935      1137     1607           2120
    ## 3  2013     1    10     1121           1635      1126     1239           1810
    ## 4  2013     9    20     1139           1845      1014     1457           2210
    ## 5  2013     7    22      845           1600      1005     1044           1815
    ## 6  2013     4    10     1100           1900       960     1342           2211
    ## # ... with 11 more variables: arr_delay <dbl>, carrier <chr>, flight <int>,
    ## #   tailnum <chr>, origin <chr>, dest <chr>, air_time <dbl>, distance <dbl>,
    ## #   hour <dbl>, minute <dbl>, time_hour <dttm>

para hacer un view de los carrier

``` r
view(arrange(flights, carrier))
```

cuáles son los vuelos que recorrieron menos

``` r
view(arrange(flights, distance))
```

para observar las distancia de los vuelos recorridos en orden

``` r
view(arrange(flights, desc(distance)))
```

**función select()** programación básica seleccionar solo fila 1

``` r
view(salida_dato[1,])
```

seleccionemos de la base de datos desde las filas 1 a la 3 y todas las
columnas

``` r
view(salida_dato[1:3, ])

view(salida_dato [1024:1068, ])
```

de las filas anteriores solo seleccionamos las variable dep\_delay y
arr\_delay

``` r
view(select(salida_dato [1024:1068,], dep_delay, arr_time))
```

seleccionando los nombres de las variables

``` r
view(select(flights, year, month, day))
```

desde y hasta

``` r
view(select(flights, dep_time:arr_delay))
```

solo queremos seleccionar todas las variables menos 2 en específico

``` r
view(select(flights, -(year:day)))
```

seleccionamos todas las variables que comiencen con la dep

``` r
view(select(flights, starts_with("dep")))
```

seleccionar todas las variables que terminen con delay

``` r
view(select(flights, ends_with("delay")))
```

seleccionar todas las variables que contengan una s

``` r
view(select(flights, contains("s")))
```

**Función mutate**

La función mutate nos permite transformar las variables para obtener una
varable distinta que sea de nuestro interés Llamamos a la base de dato

``` r
library(nycflights13)
```

seleccionamos solo la base de datos flights

``` r
nycflights13::flights
```

    ## # A tibble: 336,776 x 19
    ##     year month   day dep_time sched_dep_time dep_delay arr_time sched_arr_time
    ##    <int> <int> <int>    <int>          <int>     <dbl>    <int>          <int>
    ##  1  2013     1     1      517            515         2      830            819
    ##  2  2013     1     1      533            529         4      850            830
    ##  3  2013     1     1      542            540         2      923            850
    ##  4  2013     1     1      544            545        -1     1004           1022
    ##  5  2013     1     1      554            600        -6      812            837
    ##  6  2013     1     1      554            558        -4      740            728
    ##  7  2013     1     1      555            600        -5      913            854
    ##  8  2013     1     1      557            600        -3      709            723
    ##  9  2013     1     1      557            600        -3      838            846
    ## 10  2013     1     1      558            600        -2      753            745
    ## # ... with 336,766 more rows, and 11 more variables: arr_delay <dbl>,
    ## #   carrier <chr>, flight <int>, tailnum <chr>, origin <chr>, dest <chr>,
    ## #   air_time <dbl>, distance <dbl>, hour <dbl>, minute <dbl>, time_hour <dttm>

para ver la base de datos completa

``` r
view(flights)
```

Para ver la ganancia de tiempo

``` r
flights_nueva <- select(flights, year:day, ends_with("delay"), distance, air_time)

view(flights_nueva)

fights_nueva <- mutate(flights_nueva, tiempo_gan = arr_delay - dep_delay,
       air_time_hour = air_time/60,
       flight_speed = distance/air_time_hour,
       tiempo_gan_por_hora = tiempo_gan/air_time_hour)

view(flights_nueva)
```

**función () summarise y group\_by**

``` r
summarise(flights, delay = mean(dep_delay, na.rm = TRUE))
```

    ## # A tibble: 1 x 1
    ##   delay
    ##   <dbl>
    ## 1  12.6

``` r
by_month_group <- group_by(flights, year, month)

summarise(by_month_group, delay = mean(dep_delay, na.rm = T))
```

    ## `summarise()` regrouping output by 'year' (override with `.groups` argument)

    ## # A tibble: 12 x 3
    ## # Groups:   year [1]
    ##     year month delay
    ##    <int> <int> <dbl>
    ##  1  2013     1 10.0 
    ##  2  2013     2 10.8 
    ##  3  2013     3 13.2 
    ##  4  2013     4 13.9 
    ##  5  2013     5 13.0 
    ##  6  2013     6 20.8 
    ##  7  2013     7 21.7 
    ##  8  2013     8 12.6 
    ##  9  2013     9  6.72
    ## 10  2013    10  6.24
    ## 11  2013    11  5.44
    ## 12  2013    12 16.6

veamos esta misma funcióno pero con un grupo por día

``` r
by_day_group <- group_by(flights, year, month, day) 

summarise(by_day_group, delay = mean(dep_delay, na.rm = T))
```

    ## `summarise()` regrouping output by 'year', 'month' (override with `.groups` argument)

    ## # A tibble: 365 x 4
    ## # Groups:   year, month [12]
    ##     year month   day delay
    ##    <int> <int> <int> <dbl>
    ##  1  2013     1     1 11.5 
    ##  2  2013     1     2 13.9 
    ##  3  2013     1     3 11.0 
    ##  4  2013     1     4  8.95
    ##  5  2013     1     5  5.73
    ##  6  2013     1     6  7.15
    ##  7  2013     1     7  5.42
    ##  8  2013     1     8  2.55
    ##  9  2013     1     9  2.28
    ## 10  2013     1    10  2.84
    ## # ... with 355 more rows
