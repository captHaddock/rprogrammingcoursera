###  Ranking hospitals by outcome in a state ###

rankhospital <- function(state, outcome, num) {
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
  colnames(data2)[3] <- "Rate"
  data2[, 3] <- suppressWarnings(as.numeric(data2[, 3]))
  
  ## Subset data depending on state and remove na
  data2 <- data2[data2$State == state & complete.cases(data2), ]
  
  ## Order the data from lowest outcome and if equal the hospital name
  data2 <- data2[order(data2[, 3], data2[, 1]), ]
  
  ## Create new variable "Rank"
  data2["Rank"] <- rank(data2$Rate, ties.method = "first")
  
  ## Return hospital name in that state with the given rank
  ## 30-day death rate
  
  if (num == "worst") {
    return(data2[max(data2$Rank), 1, ])
  } else if (num == "best") {
    return(data2[min(data2$Rank), 1, ])
  } else if (num <= nrow(data2)) {
    return(data2[data2$Rank == num, 1, ])
  } else if (num > nrow(data2)) {
    return(c(NA))
  }
  
}

## test

# rankhospital("TX", "heart failure", 4)
# rankhospital("MD", "heart attack", "worst")
# rankhospital("MN", "heart attack", 5000)
