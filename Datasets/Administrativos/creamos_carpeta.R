#prueba para subir el archivo a git 

library(readr)
#lectura de los 8 archivos csv desde el anio 2014 hasta 2021
data1 <- read.csv("./Datasets/Administrativos/admin2014.csv", sep = ";", skip = 6)

data2 <- read.csv("./Datasets/Administrativos/admin2015.csv", sep = ";", skip = 6)

data3 <- read.csv("./Datasets/Administrativos/admin2016.csv", sep = ";", skip = 6)

data4 <- read.csv("./Datasets/Administrativos/admin2017.csv", sep = ";", skip = 6)

data5 <- read.csv("./Datasets/Administrativos/admin2018.csv", sep = ";", skip = 6)

data6 <- read.csv("./Datasets/Administrativos/admin2019.csv", sep = ";", skip = 6)

data7 <- read.csv("./Datasets/Administrativos/admin2020.csv", sep = ";", skip = 6)

data8 <- read.csv("./Datasets/Administrativos/admin2021.csv", sep = ";", skip = 6)
