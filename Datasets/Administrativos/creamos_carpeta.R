#prueba para subir el archivo a git 

library(readr)
#lectura de los 8 archivos csv desde el anio 2014 hasta 2021
data2014 <- read.csv("./Datasets/Administrativos/admin2014.csv", sep = ";", skip = 7)

data2015 <- read.csv("./Datasets/Administrativos/admin2015.csv", sep = ";", skip = 7)

data2016 <- read.csv("./Datasets/Administrativos/admin2016.csv", sep = ";", skip = 6)

data2017 <- read.csv("./Datasets/Administrativos/admin2017.csv", sep = ";", skip = 6)

data2018 <- read.csv("./Datasets/Administrativos/admin2018.csv", sep = ";", skip = 6)

data2019 <- read.csv("./Datasets/Administrativos/admin2019.csv", sep = ";", skip = 6)

data2020 <- read.csv("./Datasets/Administrativos/admin2020.csv", sep = ";", skip = 6)

data2021 <- read.csv("./Datasets/Administrativos/admin2021.csv", sep = ";", skip = 6)

# Vemosm los nombres de la columna: vemos que en la data de 2027 hay una columa de mas
colnames(data2017)

#eliminamos la coumna x de data2027
data2017$X <- NULL 


# pasamos el contenido y el nombre de columnas a minusculas

#------------------------------------------------------------
# Lista de nombres de los 8 dataframes
nombres_dataframes <- c("data2014", "data2015", "data2016", "data2017", "data2018", "data2019", "data2020", "data2021")

# Bucle for para aplicar la transformación a cada dataframe
for (nombre_df in nombres_dataframes) {
  # Obtener el dataframe
  df <- get(nombre_df)
  
  # Convertir contenido de columnas a minúsculas
  df <- data.frame(lapply(df, tolower))
  
  # Cambiar nombres de columnas a minúsculas
  colnames(df) <- tolower(colnames(df))
  
  # Asignar el dataframe transformado al nombre original
  assign(nombre_df, df)
}
#------------------------------------------------------------------------
# Función para eliminar acentos de una cadena
eliminar_acentos <- function(cadena) {
  iconv(cadena, to = "ASCII//TRANSLIT")
}

# Aplicar la función a todas las columnas del dataframe
data2014 <- data.frame(lapply(data2014, eliminar_acentos), stringsAsFactors = FALSE)
data2015 <- data.frame(lapply(data2015, eliminar_acentos), stringsAsFactors = FALSE)
data2016 <- data.frame(lapply(data2016, eliminar_acentos), stringsAsFactors = FALSE)
data2017 <- data.frame(lapply(data2017, eliminar_acentos), stringsAsFactors = FALSE)
data2018 <- data.frame(lapply(data2018, eliminar_acentos), stringsAsFactors = FALSE)
data2019 <- data.frame(lapply(data2019, eliminar_acentos), stringsAsFactors = FALSE)
data2020 <- data.frame(lapply(data2020, eliminar_acentos), stringsAsFactors = FALSE)
data2021 <- data.frame(lapply(data2021, eliminar_acentos), stringsAsFactors = FALSE)

#------------------------------------------------------------------------
#Cambiamos de nombre las columnas que generan conflicto al momento de concatenar
colnames(data2014)[colnames(data2014) == "servicios"] <- "servicios.técnicos"
colnames(data2015)[colnames(data2015) == "servicios"] <- "servicios.técnicos"
colnames(data2016)[colnames(data2016) == "servicios"] <- "servicios.técnicos"
colnames(data2017)[colnames(data2017) == "técnico"] <- "servicios.técnicos"
colnames(data2018)[colnames(data2018) == "tecnico"] <- "servicios.técnicos"
colnames(data2019)[colnames(data2019) == "técnico"] <- "servicios.técnicos"
colnames(data2020)[colnames(data2020) == "técnico"] <- "servicios.técnicos"
colnames(data2021)[colnames(data2021) == "técnico"] <- "servicios.técnicos"

colnames(data2018)[colnames(data2018) == "principal..o..seccional"] <- "principal..o.seccional"
colnames(data2019)[colnames(data2019) == "principal..o..seccional"] <- "principal..o.seccional"
colnames(data2020)[colnames(data2020) == "principal.o.seccional"] <- "principal..o.seccional"
colnames(data2021)[colnames(data2021) == "principal.o.seccional"] <- "principal..o.seccional"

colnames(data2020)[colnames(data2020) == "código.de.la.institución"] <- "código.de..la.institución"
colnames(data2020)[colnames(data2020) == "código.del.departamento..ies."] <- "código.del..departamento..ies."
colnames(data2020)[colnames(data2020) == "código.del.municipio..ies."] <- "código.del..municipio..ies."
colnames(data2020)[colnames(data2020) == "departamento.de.domicilio.de.la.ies"] <- "departamento.de..domicilio.de.la.ies"

colnames(data2021)[colnames(data2021) == "código.de.la.institución"] <- "código.de..la.institución"
colnames(data2021)[colnames(data2021) == "código.del.departamento..ies."] <- "código.del..departamento..ies."
colnames(data2021)[colnames(data2021) == "código.del.municipio..ies."] <- "código.del..municipio..ies."
colnames(data2021)[colnames(data2021) == "departamento.de.domicilio.de.la.ies"] <- "departamento.de..domicilio.de.la.ies"
colnames(data2021)[colnames(data2021) == "id.carácter.ies"] <- "id.caracter.ies"
colnames(data2021)[colnames(data2021) == "carácter.ies"] <- "caracter.ies"

#--------------------------------------------------------------------------------------------------

#--------------------------------------------------------------------------------------------------
# Vamos a concatenar todos los archivos en uno solo

library(dplyr)
df_concatenado <- data.frame()

df_concatenado <- rbind(df_concatenado, data2014)
df_concatenado <- rbind(df_concatenado, data2015)
df_concatenado <- rbind(df_concatenado, data2016)
df_concatenado <- rbind(df_concatenado, data2017)
df_concatenado <- rbind(df_concatenado, data2018)
df_concatenado <- rbind(df_concatenado, data2019)
df_concatenado <- rbind(df_concatenado, data2020)
df_concatenado <- rbind(df_concatenado, data2021)
#--------------------------------------------------------------------------------


# Vemos los nulos que tiene: vemos que el dataframe no tien nulos ni faltantes
nulos_por_columna <- colSums(is.na(df_concatenado))
print(nulos_por_columna)

#-------------------------------------------------------------------------------


#---------------------------------------------------------------------------------

# Vemos los valores quetiene cada columna: vemos que tiene un valor no adecuado "#n/d" y lo reeamplazamos por prricipal
valores_unicos <- unique(df_concatenado$principal..o.seccional)
print(valores_unicos)
#---------------------------------------------------------------------------------------


# Reemplazamos "#n/d"  por principal, tomamos ese criterio por que nos basamso e que principal es la sede
df_concatenado$principal..o.seccional <- ifelse(df_concatenado$principal..o.seccional == "#n/d", "principal", df_concatenado$principal..o.seccional)

#---------------------------------------------------------------------------------
# Verificamos que el tipo de dato este correcto en todo el dataframe: debemos corregir los tipos de datos a numeric
tipos_de_datos <- sapply(df_concatenado, class)
print(tipos_de_datos)

# corregir las columnas numericas
df_concatenado$código.de..la.institución <- as.numeric(df_concatenado$código.de..la.institución)
df_concatenado$ies.padre <- as.numeric(df_concatenado$ies.padre)
df_concatenado$id.sector.ies <- as.numeric(df_concatenado$id.sector.ies)
df_concatenado$id.caracter.ies <- as.numeric(df_concatenado$id.caracter.ies)
df_concatenado$código.del..departamento..ies. <- as.numeric(df_concatenado$código.del..departamento..ies.)
df_concatenado$código.del..municipio..ies. <- as.numeric(df_concatenado$código.del..municipio..ies.)
df_concatenado$año <- as.numeric(df_concatenado$año) # anio
df_concatenado$semestre <- as.numeric(df_concatenado$semestre)
df_concatenado$auxiliar <- as.numeric(df_concatenado$auxiliar)
df_concatenado$servicios.técnicos <- as.numeric(df_concatenado$servicios.técnicos)
df_concatenado$profesional <- as.numeric(df_concatenado$profesional)
df_concatenado$directivo <- as.numeric(df_concatenado$directivo)
df_concatenado$total <- as.numeric(df_concatenado$total)

#--------------------------------------------------------------------------------
#le sacamos las tildes a los nombres de la columna

colnames(df_concatenado) <- iconv(colnames(df_concatenado), "UTF-8", "ASCII//TRANSLIT")
colnames(df_concatenado)
#--------------------------------------------------------------------------------
#Guardamos el dataframe en csv para despues hacer limpieza
ruta <- "Datasets/Administrativos/"

nombre_archivo <- "administrativos2014-2021.csv"

write.csv(df_concatenado, file = paste0(ruta, nombre_archivo), row.names = FALSE)
#---------------------------------------------------------------------------------

