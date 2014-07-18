# Quiz 1 ------------------------------------------------------------------

#' Question 4
#' If I execute the expression x <- 4L in R, what is the class of the object `x' 
#' as determined by the `class()' function?

x <- 4L
class(x)

#' integer (The 'L' suffix creates an integer vector as opposed to a numeric vector.)


#' Question 5
#' What is the class of the object defined by the expression x <- c(4, "a", TRUE)?

x <- c(4, "a", TRUE)
class(x)

#' character (The character class is the "lowest common denominator" 
#'            here and so all elements will be coerced into that class.)


#' Question 6
#' If I have two vectors x <- c(1,3, 5) and y <- c(3, 2, 10), what is produced
#' by the expression rbind(x, y)?

x <- c(1, 3, 5)
y <- c(3, 2, 10)
z <- rbind(x, y)
class(z)
z

#'a 2 by 3 matrix (The 'rbind' function treats vectors as if they 
#'                 were rows of a matrix. It then takes those vectors and binds 
#'                 them together row-wise to create a matrix.)


#' Question 8
#' Suppose I have a list defined as x <- list(2, "a", "b", TRUE). 
#' What does x[[1]] give me?
x <- list(2, "a", "b", TRUE)
a <- x[[1]]
class(a) # numeric vector
a <- x[1]
class(a) # list


#' Question 9
#' Suppose I have a vector x <- 1:4 and a vector y <- 2. 
#' What is produced by the expression x + y?
x <- 1:4
y <- 2
z <- x + y
z
class(z)

#' a numeric vector with elements 3, 4, 5, 6.


#' Question 10
#' Suppose I have a vector x <- c(17, 14, 4, 5, 13, 12, 10) and I want to set all
#' elements of this vector that are greater than 10 to be equal to 4. 
#' What R code achieves this?

x <- c(17, 14, 4, 5, 13, 12, 10)
x[x > 10] <- 4
x

#' x[x > 10] <- 4 (You can create a logical vector with the expression
#'                 x > 10 and then use the [ operator to subset the original 
#'                 vector x.)


# read data ---------------------------------------------------------------

setwd("C:/utveckling/gitRepos/courseraRProgramming")
data = read.csv("quiz1/data/hw1_data.csv", header = TRUE)


#' Question 11
#' In the dataset provided for this Quiz, what are the column names of the dataset?

names(data)

#' Ozone, Solar.R, Wind, Temp, Month, Day


#' Question 12
#' Extract the first 2 rows of the data frame and print them to the console.
#' What does the output look like?

print(data[1:2 ,])

#' Ozone Solar.R Wind Temp Month Day
#' 1    41     190  7.4   67     5   1
#' 2    36     118  8.0   72     5   2


#' Question 13
#' How many observations (i.e. rows) are in this data frame?

nrow(data)

#' 153


#' Question 14
#' Extract the last 2 rows of the data frame and print them to the console. 
#' What does the output look like?

print(data[152:153 ,])

#' Ozone Solar.R Wind Temp Month Day
#' 152    18     131  8.0   76     9  29
#' 153    20     223 11.5   68     9  30


#' Question 15
#' What is the value of Ozone in the 47th row?

data[47 , ]

#' Ozone Solar.R Wind Temp Month Day
#' 47    21     191 14.9   77     6  16


#' Question 16
#' How many missing values are in the Ozone column of this data frame?

sum(is.na(data$Ozone))

#' 37


#' Question 17
#' What is the mean of the Ozone column in this dataset? 
#' Exclude missing values (coded as NA) from this calculation.
     
mean(data$Ozone, na.rm = T)

#' 42.1


#' Question 18
#' Extract the subset of rows of the data frame where Ozone values are above 31 
#' and Temp values are above 90. What is the mean of Solar.R in this subset?

mean(with(data, subset(Solar.R, Temp > 90 & Ozone > 31, na.rm = T)))

#' 212.8


#' Question 19
#' What is the mean of "Temp" when "Month" is equal to 6?

mean(with(data, subset(Temp, Month == 6)))

#' 79.1


#' Question 20
#' What was the maximum ozone value in the month of May (i.e. Month = 5)?

max(with(data, subset(Ozone, Month == 5)), na.rm = T)

#' 115  

