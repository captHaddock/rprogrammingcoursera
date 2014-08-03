###  Calculate the correlation between sulfate and nitrat ###

corr <- function(directory, threshold = 0) {
  
  files <- list.files(directory, full.name=TRUE)
  ## Create empty vector to put in resluts from for loop
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

## Test
# corr("specdata", 150)