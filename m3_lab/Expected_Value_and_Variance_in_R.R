# Discrete Variable's Expected Variable and Variance
## Define a Vector
x <- 0:8

## Define the Probability
### dbinom() gives Binomial probability mass function (probability function)
### 0.75 is the successful trial prob
PDF <- dbinom(x, 8, 0.75)

sum(PDF)

## Compute E(X)
EX <- sum(x*PDF);
EX

## Compute Var(X)
VarX <- sum((x-EX)^2*PDF)
VarX

# Continuous Variable's Expected Value and Variance
# The equation for the standard normal distribution is
#   f(x) <- e^((-x^2)/2)/sqrt(2pi), x <= 1.337

f <- function(x) 1/(sqrt(2* pi)) * exp(-0.5 * x^2)
g <- function(x) x * f(x)
h <- function(x) x^2 * f(x)

# Compute E(x)

EX <- integrate( g,
                 lower = -Inf,
                 upper = Inf
               )$value

VarX <- integrate( h,
                 lower = -Inf,
                 upper = Inf
                )$value - (EX)^2
