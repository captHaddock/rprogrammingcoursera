### Ranking hospitals in all states ###

rankall <- function(outcome, num = "best") {
  ## Read outcome data
  data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  
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
  
  ## remove na
  data2 <- data2[complete.cases(data2), ]
  
  ## Order the data from lowest outcome, if equal use the hospital name
  data2 <- data2[order(data2[, 3], data2[, 1]), ]
  
  ## Create vector for unique states
  state <- unique(data2$State)
  
  ## Create empty vector for put in results from for loop.
  hospital <- as.character(c(1:length(state)))
  
  ## For each state, create a rank variable. Depending on the input from the
  ## num variable take out corresponding hospital and put it in the hospital
  ## vector
  for (i in 1:length(state)) {
    data3 <- data2[data2$State == state[i], ]
    data3["Rank"] <- rank(data3$Rate, ties.method = "first")
    
    if (num == "worst") {
      rank <-  data3[max(data3$Rank), 1, ]
    } else if  (num == "best") {
      rank <-  data3[min(data3$Rank), 1, ]
    } else if  (num <= nrow(data3)) {
      rank <- data3[data3$Rank == num, 1, ]
    } else if  (num > nrow(data3)) {
      rank <- NA
    }
    
    hospital[i] <- rank
  }
  
  ## Make a data frame with the hospital names and the (abbreviated) state name
  result <- data.frame(hospital = hospital, state = state)
  
  ## Order the results and return them
  return(result[order(result[, 2]), ])
  
}

## test

# head(rankall("heart attack", 20), 10)
# tail(rankall("pneumonia", "worst"), 3)
# tail(rankall("heart failure"), 10)

