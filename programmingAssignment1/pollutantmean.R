###  Calculate the mean of a pollutant ###

## Read the csv files to a dataframe, use realtive paths
pollutantmean <- function(directory, pollutant, id = 1:332) {
  files <- list.files(directory, full.name=TRUE)
  data <- data.frame()
  for (i in id) {
  data <- rbind(data, read.csv(files[i]))
}
## Subset data depending on pollutant
  dat_pollutant <- data[, pollutant]
## Calculate the mean of a pollutant, round the answer and print it
  round(mean(dat_pollutant, na.rm = TRUE), digits = 3)
}

## test
# pollutantmean("specdata", "sulfate", 1:10)
