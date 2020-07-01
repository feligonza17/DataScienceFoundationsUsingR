corr <- function(directory, threshold=0) {
  final <- complete(directory)
  corr_values <- final[,"id"][final[,"nobs"] > threshold]
  files <- list.files(directory, full.names = TRUE)
  vect_final <- c()
  x <- 0
  for (i in corr_values) {
    x <- x+1
    data_corr <- read.csv(files[i])
    data_corr <- data_corr[complete.cases(data_corr),]
    vect_final[x] <- cor(data_corr[,"sulfate"],data_corr[,"nitrate"])
    vect_final[x] 
  }
  
  vect_final
}

