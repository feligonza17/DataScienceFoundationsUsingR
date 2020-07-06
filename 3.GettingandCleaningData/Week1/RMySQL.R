library(RMySQL)

hg19 <- dbConnect(MySQL(), user="genome", db="hg19",  host="genome-mysql.cse.ucsc.edu")
allTables <- dbListTables(hg19)
result <- dbGetQuery(ucscDb, "show databases;")


allTables[1:5]

dbListFields(hg19, "affyU133Plus2") #This gives the columns names 
dbGetQuery(hg19, "select count(*) from affyU133Plus2") #This gives the number of elements
affyData <- dbReadTable(hg19, "affyU133Plus2")


query <- dbSendQuery(hg19, "select * from affyU133Plus2 where misMatches between 1 and 3") #Seleccionar obsevacoines que cumplen alguna condicion 
affyMis <- fetch(query)
quantile(affyMis$misMatches)
dbClearResult(query) #Para dehar de tener el query que se hizo arriba 
dbDisconnect(hg19) #importante borrar la conexion 
?table
