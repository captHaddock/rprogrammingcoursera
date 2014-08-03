### Finding the best hospital in a state  ###

best <- function(state, outcome) {
  ## Read outcome data
  data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  
  ## Check that state and outcome are valid
  # if (nrow(subset(data, State == state)) < 1) {
  if (!state %in% data$State) {
    stop("invalid state")
  }
  
  outcometest <- c("heart attack", "heart failure", "pneumonia")
  
  if (length(outcometest[outcometest == outcome]) < 1) {
    stop("invalid outcome")
  }    
  
  ## Subset data depending on outcome 
  if (outcome == "heart attack") {
    data2 <- data[, c(2, 7, 11)]
  } else if (outcome == "heart failure") {
    data2 <- data[, c(2, 7, 17)]
  } else if (outcome == "pneumonia") {
    data2 <- data[, c(2, 7, 23)]
  }
  
  ## Change the long column name and make it a numeric variable
  colnames(data2)[3] <- outcome
  data2[, 3] <- suppressWarnings(as.numeric(data2[, 3]))
  
  ## Subset data depending on state 
  data2 <- data2[data2$State == state, ]
  
  ## Order the data from lowest outcome and if equal the hospital name
  data2 <- data2[order(data2[, 3], data2[, 1]), ]
  
  ## Return hospital name in that state with lowest 30-day death
  ## rate
  data2[1, 1]
}

## testing

# best("TXrrr", "heart attack")
# best("TX", "heart attackrrr")
# best("TX", "heart attack")
# best("TX", "heart failure")
# best("MD", "heart attack")
# best("MD", "pneumonia")