Limpieza de datos
================
Macarena Valenzuela Beltrán
8 de julio

**Shortcuts útiles:**

%\>% : este operadore significa entonces: ctrl + shift + m

creación de objetos: \<- : alt + -

**función gaher()** llamado de librerias

``` r
library(tidyverse)
```

    ## Warning: package 'tidyverse' was built under R version 4.0.2

    ## -- Attaching packages ------------------------------------------------------------------------------------------------ tidyverse 1.3.0 --

    ## v ggplot2 3.3.0     v purrr   0.3.4
    ## v tibble  3.0.1     v dplyr   1.0.0
    ## v tidyr   1.0.3     v stringr 1.4.0
    ## v readr   1.3.1     v forcats 0.5.0

    ## -- Conflicts --------------------------------------------------------------------------------------------------- tidyverse_conflicts() --
    ## x dplyr::filter() masks stats::filter()
    ## x dplyr::lag()    masks stats::lag()

veamos la tabla 4a

``` r
table4a
```

    ## # A tibble: 3 x 3
    ##   country     `1999` `2000`
    ## * <chr>        <int>  <int>
    ## 1 Afghanistan    745   2666
    ## 2 Brazil       37737  80488
    ## 3 China       212258 213766

transformemos la tabla en una tabbla que contenga en forma limpia los
casos

``` r
tablacasos <- table4a %>% 
  gather(`1999`, `2000`, key = "a?o", value = "cases")
```

imprimamos la tabla recien creada

``` r
tablacasos
```

    ## # A tibble: 6 x 3
    ##   country     `a?o`  cases
    ##   <chr>       <chr>  <int>
    ## 1 Afghanistan 1999     745
    ## 2 Brazil      1999   37737
    ## 3 China       1999  212258
    ## 4 Afghanistan 2000    2666
    ## 5 Brazil      2000   80488
    ## 6 China       2000  213766

veamos la tabla 4a

``` r
table4b
```

    ## # A tibble: 3 x 3
    ##   country         `1999`     `2000`
    ## * <chr>            <int>      <int>
    ## 1 Afghanistan   19987071   20595360
    ## 2 Brazil       172006362  174504898
    ## 3 China       1272915272 1280428583

transformemos la tablaa en una tabla que contenga en forma limpia los
valores de la población

``` r
tablapoblacion <- table4b %>% 
  gather(`1999`, `2000`, key = "a?o", value = "population")
```

imprimimos la tabla recién creada

``` r
tablapoblacion
```

    ## # A tibble: 6 x 3
    ##   country     `a?o` population
    ##   <chr>       <chr>      <int>
    ## 1 Afghanistan 1999    19987071
    ## 2 Brazil      1999   172006362
    ## 3 China       1999  1272915272
    ## 4 Afghanistan 2000    20595360
    ## 5 Brazil      2000   174504898
    ## 6 China       2000  1280428583

unamoslas dos tablas recién credas

``` r
nuevatabla <- left_join(tablacasos,tablapoblacion)
```

    ## Joining, by = c("country", "a?o")

obtención de una tabla de datos limpios

``` r
nuevatabla
```

    ## # A tibble: 6 x 4
    ##   country     `a?o`  cases population
    ##   <chr>       <chr>  <int>      <int>
    ## 1 Afghanistan 1999     745   19987071
    ## 2 Brazil      1999   37737  172006362
    ## 3 China       1999  212258 1272915272
    ## 4 Afghanistan 2000    2666   20595360
    ## 5 Brazil      2000   80488  174504898
    ## 6 China       2000  213766 1280428583

**función spread()** veamos la tabla 2

``` r
table2
```

    ## # A tibble: 12 x 4
    ##    country      year type            count
    ##    <chr>       <int> <chr>           <int>
    ##  1 Afghanistan  1999 cases             745
    ##  2 Afghanistan  1999 population   19987071
    ##  3 Afghanistan  2000 cases            2666
    ##  4 Afghanistan  2000 population   20595360
    ##  5 Brazil       1999 cases           37737
    ##  6 Brazil       1999 population  172006362
    ##  7 Brazil       2000 cases           80488
    ##  8 Brazil       2000 population  174504898
    ##  9 China        1999 cases          212258
    ## 10 China        1999 population 1272915272
    ## 11 China        2000 cases          213766
    ## 12 China        2000 population 1280428583

separamos la dos variables de la columna type

``` r
table2 %>% 
  spread(key = type, value = count) -> tablanueva2
```

imprimimos la tabla recién creada

``` r
tablanueva2
```

    ## # A tibble: 6 x 4
    ##   country      year  cases population
    ##   <chr>       <int>  <int>      <int>
    ## 1 Afghanistan  1999    745   19987071
    ## 2 Afghanistan  2000   2666   20595360
    ## 3 Brazil       1999  37737  172006362
    ## 4 Brazil       2000  80488  174504898
    ## 5 China        1999 212258 1272915272
    ## 6 China        2000 213766 1280428583

**función separate()** veamos la tabla 3

``` r
table3
```

    ## # A tibble: 6 x 3
    ##   country      year rate             
    ## * <chr>       <int> <chr>            
    ## 1 Afghanistan  1999 745/19987071     
    ## 2 Afghanistan  2000 2666/20595360    
    ## 3 Brazil       1999 37737/172006362  
    ## 4 Brazil       2000 80488/174504898  
    ## 5 China        1999 212258/1272915272
    ## 6 China        2000 213766/1280428583

separamos los valores de la columna rate

``` r
table3 %>% 
  separate(rate, into = c("cases", "population"))
```

    ## # A tibble: 6 x 4
    ##   country      year cases  population
    ##   <chr>       <int> <chr>  <chr>     
    ## 1 Afghanistan  1999 745    19987071  
    ## 2 Afghanistan  2000 2666   20595360  
    ## 3 Brazil       1999 37737  172006362 
    ## 4 Brazil       2000 80488  174504898 
    ## 5 China        1999 212258 1272915272
    ## 6 China        2000 213766 1280428583

creamos una nueva tabla con la nueva transformación de datos

``` r
tabla3nueva <- table3 %>% 
  separate(rate, into = c("cases", "population"))
```

imprimimos la nueva tabla creada

``` r
tabla3nueva
```

    ## # A tibble: 6 x 4
    ##   country      year cases  population
    ##   <chr>       <int> <chr>  <chr>     
    ## 1 Afghanistan  1999 745    19987071  
    ## 2 Afghanistan  2000 2666   20595360  
    ## 3 Brazil       1999 37737  172006362 
    ## 4 Brazil       2000 80488  174504898 
    ## 5 China        1999 212258 1272915272
    ## 6 China        2000 213766 1280428583

**función unite()** veamos la tabla 5

``` r
table5
```

    ## # A tibble: 6 x 4
    ##   country     century year  rate             
    ## * <chr>       <chr>   <chr> <chr>            
    ## 1 Afghanistan 19      99    745/19987071     
    ## 2 Afghanistan 20      00    2666/20595360    
    ## 3 Brazil      19      99    37737/172006362  
    ## 4 Brazil      20      00    80488/174504898  
    ## 5 China       19      99    212258/1272915272
    ## 6 China       20      00    213766/1280428583

juntamos las columnas century y year en una nueva columna llamada
new\_year y omitimos el símbolo (\_) creados entre los valres

``` r
table5 %>% 
  unite(new_year, century, year, sep = "") %>% 
  separate(rate, into = c("cases", "population"))
```

    ## # A tibble: 6 x 4
    ##   country     new_year cases  population
    ##   <chr>       <chr>    <chr>  <chr>     
    ## 1 Afghanistan 1999     745    19987071  
    ## 2 Afghanistan 2000     2666   20595360  
    ## 3 Brazil      1999     37737  172006362 
    ## 4 Brazil      2000     80488  174504898 
    ## 5 China       1999     212258 1272915272
    ## 6 China       2000     213766 1280428583

creamos una nueva tabla

``` r
tabla5nueva <- table5 %>% 
  unite(new_year, century, year, sep = "") %>% 
  separate(rate, into = c("cases", "population"))
```

imprimimos la nueva tabla creada

``` r
tabla5nueva
```

    ## # A tibble: 6 x 4
    ##   country     new_year cases  population
    ##   <chr>       <chr>    <chr>  <chr>     
    ## 1 Afghanistan 1999     745    19987071  
    ## 2 Afghanistan 2000     2666   20595360  
    ## 3 Brazil      1999     37737  172006362 
    ## 4 Brazil      2000     80488  174504898 
    ## 5 China       1999     212258 1272915272
    ## 6 China       2000     213766 1280428583
