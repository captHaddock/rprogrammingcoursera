pollutantmean <- function(directory, pollutant, id = 1:332) {
  files <- list.files(directory, full.name=TRUE)
  data <- data.frame()
  for (i in id) {
  data <- rbind(data, read.csv(files[i]))
}
  dat_pollutant <- data[, pollutant]
  round(mean(dat_pollutant, na.rm = TRUE), digits = 3)
}

# pollutantmean("specdata", "sulfate", 1:10)
