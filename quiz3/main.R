library(datasets)
data(iris)
?iris
head(iris)

# mean(iris$Sepal.Length)

# virginica <- subset(iris, Species == "virginica")
# apply(virginica[, 1:4], 2, mean)

# lvl <- levels(iris$Species)
tapply(iris$Sepal.Length, iris$Species, mean)

apply(iris, 1, mean)
rowMeans(iris[, 1:4])
colMeans(iris[, 1:4])
apply(iris[, 1:4], 2, mean)

library(datasets)
mtcars <- mtcars
data(mtcars)
mtcars <- data(mtcars)
?mtcars

split(mtcars, mtcars$cyl)
tapply(mtcars$cyl, mtcars$mpg, mean)
with(mtcars, tapply(mpg, cyl, mean))
mean(mtcars$mpg, mtcars$cyl)

head(mtcars)

s <- split(mtcars, mtcars$cyl)
sapply(s, colMeans)
sapply(s, colMeans)["hp", ]
sapply(s, colMeans)["hp", "8"] - sapply(s, colMeans)["hp", "4"]






