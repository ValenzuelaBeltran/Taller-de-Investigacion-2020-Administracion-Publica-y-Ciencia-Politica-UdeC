Visualización de datos
================
Macarena Valenzuela Beltrán
8 de julio

Llamamos a la librería

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

Llamamos a la base de datos mpg

``` r
ggplot2::mpg
```

    ## # A tibble: 234 x 11
    ##    manufacturer model    displ  year   cyl trans   drv     cty   hwy fl    class
    ##    <chr>        <chr>    <dbl> <int> <int> <chr>   <chr> <int> <int> <chr> <chr>
    ##  1 audi         a4         1.8  1999     4 auto(l~ f        18    29 p     comp~
    ##  2 audi         a4         1.8  1999     4 manual~ f        21    29 p     comp~
    ##  3 audi         a4         2    2008     4 manual~ f        20    31 p     comp~
    ##  4 audi         a4         2    2008     4 auto(a~ f        21    30 p     comp~
    ##  5 audi         a4         2.8  1999     6 auto(l~ f        16    26 p     comp~
    ##  6 audi         a4         2.8  1999     6 manual~ f        18    26 p     comp~
    ##  7 audi         a4         3.1  2008     6 auto(a~ f        18    27 p     comp~
    ##  8 audi         a4 quat~   1.8  1999     4 manual~ 4        18    26 p     comp~
    ##  9 audi         a4 quat~   1.8  1999     4 auto(l~ 4        16    25 p     comp~
    ## 10 audi         a4 quat~   2    2008     4 manual~ 4        20    28 p     comp~
    ## # ... with 224 more rows

preguntamos de que trata la base de datos mpg

``` r
?mpg
```

    ## starting httpd help server ... done

Hacemos un view de mpg

``` r
view(mpg)
```

el primer gráfico

``` r
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy))
```

![](Visualización-de-datos_files/figure-gfm/unnamed-chunk-5-1.png)<!-- -->

veamos el desplazamiento en carretera por clase de auto

``` r
ggplot(data= mpg) +
  geom_point(mapping = aes(x = displ, y = hwy, colour = class))+
  facet_wrap(~class, nrow = 2)
```

![](Visualización-de-datos_files/figure-gfm/unnamed-chunk-6-1.png)<!-- -->
