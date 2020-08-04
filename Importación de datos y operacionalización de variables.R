#'---
#'author: Macarena Valenzuela Beltrán
#'title: "Importación de datos y operacionalización de variables"
#'date: "4 de agosto"
#'output: github_document
#'---

#'**Importación de datos y operacionalización de variables**
#' 
#'El presente md se basa en el texto de AnalizaR Datos Políticos de 
#'Francisco Urdinez y Cruz (2019).![](https://arcruz0.github.io/libroadp/carga.html)
#'
#'Urdinez y Cruz (2019) sostiene que la carga de base de datos en R no es una tarea fácil.
#'Esto es así, porque las bases de datos siempre presentan distintos formatos
#'de archivo que optimizan los diferentes parámetros. 
#'
#'Para poder hacer un ejercicio de descarga vamos a utilizar las bases de datos
#'de los mismos ejemplos ocupados en el libro AnalizaR Datos Políticos. 
#'
#'Para ello, vamos a crear un nuevo proyecto en RStudio que
#'lo guardaremos en nuestro computador. Luego, dentro de la carpeta del proyecto
#'crearemos una carpeta llamada "Datos". En este caso, las fotos mostradas para 
#'este  ejemplo y los ejemplos posteriores, es la carpeta de nuestro Taller de Investigación 2020 y dentro de ella
#'creamos la carpeta llamada "Datos". 
#'
 
knitr::include_graphics("Imágenes/carga_datos.png")

#' Una vez que creamos la carpeta, podemos guardar nuestra base de datos en esta carpeta "Datos"
#' incorporada en el proyecto de R local.
#' Para trabajar este ejercicio de importación, descargaremos la base de datos del libro
#' AnalizaR Datos Políticos llamada "carga-base" del capítulo 5. 
#' Luego, la guardamos en la carpeta "Datos" de nuestro proyecto de R local. 
#' Esto se debería observar de la siguiente manera: 

knitr::include_graphics("Imágenes/carga_datos.png")

#' Una vez guardado el zip (o archivos comprimidos) en la carpeta "Datos" de nuestro 
#' proyecto R local, descomprimimos los archivos con el botón derecho y debiera aparecer una carpeta llamado "datos"
#' (con minúscula y nombrada por el creador de la base de datos).
#' Dentro de la carpeta "datos", se encuentra el proyecto Desiguales del PNUD. 
#' En el libro de Urdinez y Cruz (2019), se utiliza una pequeña subsección  de esta 
#' base de datos. En ella, se encuentran 300 encuestados y encuestadas a lo largo
#' de 20 variables. La carpeta presenta seis formatos distintos con los cuales 
#' vamos a trabajar para ensayar a importar datos. 
#' 
#' A continuación, verás imágenes de como se ven los distintos tipos de ficheros 
#' que se encuentran dentro de la carpeta "datos" de nuestro proyecto de R local. 

knitr::include_graphics("Imágenes/distintos_ficheros.png")

#' **Importación de datos**
#' 
#' Para importar los datos ocuparemos el paquete readr que se encuentra ubicado
#' dentro del super paquete tidyverse. Por lo tanto, el primer paso es llamar a
#' a la librería tal como lo hemos aprendido en clases.

library(tidyverse)

#' Tal como lo hemos explicado en variadas ocasiones en clases, tidyverse contiene 
#' el paquete readr para importación de datos. Por lo tanto, ya estamos listos para 
#' comenzar a trabajar.

#' Para cargar el fichero de datos con formato .csv vamos a ocupar el comando "read_csv()"
#' de readr y vamos a crear un objeto que denominaremos df_desiguales_csv con el siguiente 
#' comando:

df_desiguales_csv <- read_csv("Datos/desiguales.csv")

#' El nombre del objeto significa dataframe_desiguales_en foramto csv.
#' Para confirmar que el archivo se encuentra en nuestro ambiente de trabajo R,
#' ejecutamos el siguiente comando:

ls()

#' Este comando te señala en la consola el objeto creado y en el Global Enviroment,
#' (pestaña Enviroment, ubicado en el cuadrante superior derecho) aparecerá el 
#' dataframe señalando las 300 observacioens de 20 variables.

knitr::include_graphics("Imágenes/Environment.png")

#' Una vez confirmada, la importación de los datos necesitamos saber si es o no 
#' un objeto tipo dataframe. Para ello, utilizaremos el siguiente comando:

class(df_desiguales_csv)

#' Este comando, nos arroja en la consola que es un archivo de tipo dataframe y tibble
#' (Recordemos que tibble es un formato mejorado de dataframe propio de R).
#' 
#' Ahora bien, para ver una breve panorámica de nuestra base de datos vamos a ocupar las funciones
#' del paquete dplyr::select() y la función dplyr::glimpse(), Así como vamos a 
#' observar nuestra base de datos con otras funciones como head(), str(), summmary().
#' 
#' Para ver una descripción de las variables 

glimpse(df_desiguales_csv)

#' Para ver las 10 primeras variables 

df_desiguales_csv %>% select(1:10) %>% glimpse()

#' Para ver las 6 primeras filas

head(df_desiguales_csv)

#' Para ver las últimas 6 filas 

tail(df_desiguales_csv)

#' Para saber la estructura de las variables

str(df_desiguales_csv)

#' Para ver un  resumen estadístico.
#'  

summary(df_desiguales_csv)

#' Para ver las dimensiones del dataframe

dim(df_desiguales_csv)

#'**Algunos respasos: archivos crados en .RData y .rds**

#' Los archivos .Rdata ó .Rda permiten almacenar cualquier objeto en R (vector, dataframe, matriz, lista).
#' Se diferencian porque el primero puede contener cualquier número de objetos. Mientras 
#' que le segundo contiene un número limitado de objetos (Urdinez y Cruz, 2019).
#' 
#' Para cargar el archivo digitamos el siguiente código:

load("Datos/desiguales.Rdata")

#' Confirmamos su carga y posteriormente podemos observar los datos con los comandos anteriores

ls()

#' Para cargar archivos formato .rds

df_desiguales_rds <- read_rds("Datos/desiguales.rds")
ls()
class(df_desiguales_rds)

#' ** Importación de ficheros Stata o SPSS: Observación de datos con etiquetas**

#' Una de las cosas interesantes que he visto en este libro de Urdinez y Cruz (2019) y que no he visto
#' tan claramente y en forma tan ordenada en otros textos, es la importación de 
#' ficheros Stata o SPSS y como podemos ver en R las etiquetas que este tipo de datos facilita
#' para poder observar las variables.
#' 
#' Por ejemplo, como hemos observado en la importación de datos anteriores los archivos 
#' tienen unas variables llamadas p2, mp3, p4, etc. A simple vista, no sabemos que significan 
#' esas variables si no tenemos a disposición el Libro de Código.
#' 
#' Para el caso de los archivos .dta (Stata) y .sav (SPSS), las bases de datos vienen con 
#' las columnas etiquetadas. Urdinez y Cruz (2019), explican muy bien como 
#' hacer uso de estas etiquetas en el ambiente de R.
#' 
#' **Carga de base de datos con etiquetas**
#' 
#' Para cargar bases de datos con etiquetas, tenemos que llamar a las 
#' librerias tidyverse y haven. Como ya hemos cargado tidyverse solo llamamos a la librería have

library(haven)

#' Ahora procedemos a importar los ficheros .dta y .sav con los siguiente comandos.

df_desiguales_spss <- read_spss("Datos/desiguales.sav")

df_desiguales_stata <- read_stata("Datos/desiguales.dta")

ls()

class(df_desiguales_spss)

class(df_desiguales_stata)

#' Al igual que con las bases anteriores podemos observar las variables y observaciones
#' que contienen nuestros nuevos ficheros.

df_desiguales_spss %>% select(1:10) %>% glimpse()

#' Ahora observemos las primeras 6 filas y las etiquetas de la columna p2

head(df_desiguales_stata$p2)

#' **Importación de archivos Excel**

#' La importación de los archivos excel es uno de los más comunes en las ciencias
#' sociales. Generalmente, nosotros mismos construimos nuestas pequeñas bases de datos
#' en excel para realizar nuestras tesinas, memorias o tesis.
#' 
#' Para importar archivos excel tenemos que llamar a la librería readxl

library(readxl)

#' Para cargar los ficheros de excel usamos los comandos read_excel() de readxl()

#' Trabajar con archivos excel en R o en cualquier otro software de análisis de datos
#' tiene la pequeña dificultad de tratar o limpiar los **metadatos** que se encuantran 
#' antes de las variables y observaciones en sí mismas. Estos metadatos son inforamción 
#' adicional y explicativa que generalmente ponemos en nuestras bases de datos.
#' 
#'Por ejemplo, si observamos el archivo cead.xls ó .xlsx, como archivo excel en nustra carpeta local cargado ya en nuestra carpeta "Datos"
#'de nuestro proyecto R local, observaremos que que existen 17 fila con metadatos

df_cead_excel <- read_excel("Datos/cead.xls")

ls()

df_cead_excel %>% glimpse()


#' Para solucionar esto, ocupamos la función skip =. De esta manera, le decimos a R que 
#' no considerar las primeras filas y que comience a analizar desde la siguiente.

df_cead_excel_v2 <- read_excel("Datos/cead.xls", skip = 18) 

#' También se puede delimitar el rango de filas para observar el cuadrado de nuestro 
#' interés con la función range() y el siguiente comando:

df_cead_excel_v3 <- read_excel("datos/cead.xls", range = "A20:G81")

#' Otro problema de excel es que  la información puede estar dividida en distintas hojas.
#' Para solucionar esto ocuparemos la función sheet () del paquete readxl. Con la función sheet,
#' seleccionamos la hoja que queremos cargar, con skip seleccionamos la fila que nos queremos saltar
#' y con na señalamos a R que denominamos not available a las observaciones en blanco o 
#' los datos no recepcionados (que para efectos de la base es lo mismo).

df_sinim_excel <- read_excel("Datos/sinim.xls", 
                             sheet = 2, skip = 2, na = "No Recepcionado")

#' Otro de los problemas comunes de excel es como se escribe el nombre de las variables.
#' Generalmente, nosotros mismos las escribimos con mucho detalle. 
#' Veamos como están escritas en esta base de datos.

names(df_sinim_excel)

#' Para poder dar una visión uniforme a los nombres de las variables y que luego nos sea mas 
#' fácil codificar los comandos sin preocuparnos por tanto detalle, vamos a ocupar 
#' el paquete JANITOR. Lo instalamos (install.packages("janitor")) y llamamos sus librerías

library(janitor)

#' Luego, creamos una versión 2 de nuestra base de datos con los nombres de las 
#' variables limpias

df_sinim_excel_v2 <- df_sinim_excel %>% janitor::clean_names()

#' Si ahora revisamos nuestra base de datos. Todos los nombres de las variables 
#' tendrán el mismo formato y será mucho mas rápido y fácil codificar.

names(df_sinim_excel_v2)

#' **Limpieza y transformación de datos para operacionalizar nuestras variables de la hipótesis**

#' Durante el semestre, ya hemos aprendido a limpiar y transformar los datos que importamos.
#' #' Ahora, con una base de datos real, vamos a limpiar y transformar en función de una hipótesis.

#' Limpiamos la base de datos: nos damos cuenta que la base de datos llamada df_cead_excel_v2 existe
#' una columna con el nombre "...1" y tenemos que asignar un nombre. y Además, nos damos cuenta que 
#' en las columnas todas las variables son años. Por tanto, según el principio de limpieza de datos
#' vamos a transformarla y distribuir los valores por filas de año y comuna.

df_cead_excel_v4 <- df_cead_excel_v2 %>% 
  rename(comunas = "...1") %>% 
  gather(key = años, value = n_crímenes, -comunas)

#' Luego, fijamos nuestra hipótesis: "La felicidad de las personas en Chile esta determinado por el trato que reciben"
#' La variable dependiente: "La felicidad de las personas en Chile"
#' La variable independiente: "El trato que reciben"
#' 
#' Esta hipótesis será operacionalizada con la base de datos de desiguales de PNUD. La ficha de esta base es...
#' 
#' Operacionalización de las variables:
#' 
#' Variable dependiente: "La felicidad de las personas en Chile" se operacionaliza con la preguna p6 de nuestra base de datos
#' que señala: ¿Cuán satisfecho está usted con su vida?
#' Esta pregunta está medida con la siguiente escala

head(df_desiguales_stata$p6)

#' Variable independiente: "El trato que reciben"
#' Operacionalización de la variable: ocuparé la variable p9_4 de mi base de datos que consiste en la siguiente pregunta.
#' ¿Cuán desigual cree usted que es Chile? Trato.
#' 
#'  Para ver la escala de medición de esta pregunta

head(df_desiguales_stata$p9_4) 

#' Estos datos se analizarán con modelos de regresión logit, lineal o mulivariado.
#' 



























































