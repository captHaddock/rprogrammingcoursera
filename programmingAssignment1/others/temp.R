data1 <- read.csv("specdata/001.csv") 
data2 <- read.csv("specdata/002.csv")
data <- rbind(data1, data2)

test <- aggregate(complete.cases(data) ~ ID, data, sum)
colnames(test)[2] <- "nobs"


complete("specdata", 1)
complete("specdata", c(2, 4, 8, 10, 12))
complete("specdata", 30:25)
complete("specdata", 3)


id = 30:25
id[1]
max(id)

data <- data[order(- data$sulfate),]

head(data)