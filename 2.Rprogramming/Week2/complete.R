complete <- function(directory, id = 1:332) {
  final <- data.frame()
  vec_threshold <- c()
  x <- 0
  files <- list.files(directory, full.names = TRUE)

  for (i in id) {
    x <- x+1
    data <- read.csv(files[i])
    final[x,1] <- data[1,"ID"]
    final[x,2] <- sum(complete.cases(data))
    
  }
  colnames(final) <- c("id", "nobs")
  final
}
