complete <- function(directory, id = 1:332) {
  files <- list.files(directory, full.name=TRUE)
  data <- data.frame()
  for (i in id) {
    data <- rbind(data, read.csv(files[i]))
  }
  data <- aggregate(complete.cases(data) ~ ID, data, sum)
  colnames(data)[2] <- "nobs"
  
  if (id[1] == max(id)) {
    data <- data[order(- data$ID), ]
    return(data)
  }
  else {
    return(data)
  }
}
