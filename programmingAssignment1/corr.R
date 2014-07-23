corr <- function(directory, threshold = 0) {
  
  files <- list.files(directory, full.name=TRUE)  
  result <- c()
  
  for (i in 1:length(files)) {    
    data <- read.csv(files[i])    
    data <- data[complete.cases(data), ]
    
    if (nrow(data) > threshold) {      
      result <- c(result, cor(data$sulfate, data$nitrate))     
    }   
  }  
  return(result) 
}

# corr("specdata", 150)