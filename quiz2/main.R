x <- 1:10
y <- if(x > 5) {
  x <- 0
}

x <- 7
if(x > 5) {
  x <- 0
}

x <- 6:10
y <- if(x > 5) {
  x <- 0
}

for(i in seq_along(x)) {
  if(x[i] > 5) {
    x[i] <- 0
  }
}

x[x > 5] <- 0

------------------------------------------
  
  h <- function(x, y = NULL, d = 3L) {
    z <- cbind(x, d)
    if(!is.null(y))
      z <- z + y
    else
      z <- z + f
    g <- x + y / z
    if(d == 3L)
      return(g)
    g <- g + 10
    g
  }

h(3, y = 3)
    
