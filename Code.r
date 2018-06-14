#install.packages("lattice")
require(lattice)
x <- seq(-10, 10, length= 30)
y <- x
f <- function(x, y) { r <- (x**2) + (4*y)**2}
z <- outer(x, y, f)
meow <- data.frame(x1 = x, x2 = y, y = as.vector(z))
wireframe(y ~ x1+x2, data = meow, drape = TRUE, col.regions =heat.colors(150),
          colorkey = TRUE,  screen = list(z = -50, x = -60), aspect = c(61/87, 0.4),
          xlab="x", ylab="y",zlab="f(x,y)")
