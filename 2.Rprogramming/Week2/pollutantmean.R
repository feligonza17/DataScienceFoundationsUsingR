pollutantmean <- function(directory, pollutant, id = 1:332) {
  data <- data.frame()
  under10 <- as.character(1:10)
  id[id>=10 & id<100] <- paste("0", id[id>=10 & id<100], sep="")
  id[id%in%under10] <- paste("00", id[id%in%under10], sep="")

    for (i in id) {
      data <- rbind(data,read.csv(paste(directory,"/", i, ".csv", sep = "")))
    }

  mean(data[,pollutant], na.rm = T)
  
    }

