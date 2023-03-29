# 1. How to use different distribution functions in R
# d density, p probability, q quarterly, r random
# dnorm(x, mean, sd)
# pnorm(x, mean, sd)
# qnorm(p, mean, sd)
# rnorm(n, mean, sd)

# x is a vector of numbers.

# p is a vector of probabilities.

# n is number of observations(sample size).
#
# mean is the mean value of the sample data. It's default value is zero.
#
# sd is the standard deviation. It's default value is 1


# a. The Normal Distribtion
# Direct Look-Up
# pnorm is the R function that calculates the c. d. f.
# They look up P(X < 27.4) when X is normal with mean 50 and standard deviation 20.
# Example
pnorm(27.4, mean=50, sd=20)
pnorm(27.4, 50, 20)
#
# Question: Suppose widgit weights produced at Acme Widgit Works have weights that are normally distributed
# with mean 17.46 grams and variance 375.67 grams. What is the probability that a randomly chosen widgit weighs
# more then 19 grams?
#
#   Question Rephrased: What is P(X > 19) when X has the N(17.46, 375.67) distribution?
#
#   Caution: R wants the s. d. as the parameter, not the variance. We'll need to take a square root!

pnorm(19, mean=17.46, sd=sqrt(375.67))#P(X<19)
1-pnorm(19, mean=17.46, sd=sqrt(375.67))

x <- seq(-10, 10, by = .2)
x

# Question: Suppose IQ scores are normally distributed with mean 100 and standard deviation 15. What is the 95th percentile of the distribution of IQ scores?
#
#   Question Rephrased: What is F-1(0.95) when X has the N(100, 152) distribution?

# Inverse Look-Up
# qnorm is the R function that calculates the inverse c. d. f. F-1 of the normal distribution The c. d. f. and the inverse c. d. f. are related by
#
# p = F(x)
# x = F-1(p)
# So given a number p between zero and one, qnorm looks up the p-th quantile of the normal distribution. As with pnorm, optional arguments specify the mean and standard deviation of the distribution.
# Example
qnorm(0.95, mean=100, sd=15)



##########Density
dnorm(0,0, 0.1)

# from density to probability , should do the integration
# Random Variates
# We won't be using the "r" functions (such as rnorm) much. So here we will only give an example without full explanation.

x <- rnorm(1000, mean=100, sd=15)
hist(x, probability=TRUE)

xx <- seq(min(x), max(x), length=100)
lines(xx, dnorm(xx, mean=100, sd=15))
# This generates 1000 i. i. d. normal random numbers (first line), plots their histogram (second line), and graphs the p. d. f. of the same normal distribution (third and forth lines).
#
# b. The Binomial Distribution
# Direct Look-Up, Points
# dbinom is the R function that calculates the p. f. of the binomial distribution. Optional arguments described on the on-line documentation specify the parameters of the particular binomial distribution.
# # Both of the R commands in the box below do exactly the same thing.
#look up P(X = 27) when X is has the Bin(100, 0.25) distribution.
dbinom(27, size=100, prob=0.25)
dbinom(27, 100, 0.25)


# Example
# Question: Suppose widgets produced at Acme Widget Works have probability 0.005 of being defective.
# Suppose widgets are shipped in cartons containing 25 widgets.
# What is the probability that a randomly chosen carton contains exactly one defective widgit?
#
#   Question Rephrased: What is P(X = 1) when X has the Bin(25, 0.005) distribution?
#
#   Answer:
dbinom(1, 25, 0.005)

# Example:  Problem
# Suppose there are twelve multiple choice questions in an English class quiz.
# Each question has five possible answers, and only one of them is correct.
# Find the probability of having four or less correct answers if a student attempts to answer every question at random.

# Solution
# Since only one out of five possible answers is correct,
# # the probability of answering a question correctly by random is 1/5=0.2.
# We can find the probability of having exactly 4 correct answers by random attempts as follows.
# P(x=4)

dbinom(4, size=12, prob=0.2) # P(X=4)
# To find the probability of having four or less correct answers by random attempts, we apply the function dbinom with x = 0,…,4.
#P(x<=4)
dbinom(0, size=12, prob=0.2) +
  + dbinom(1, size=12, prob=0.2) +
  + dbinom(2, size=12, prob=0.2) +
  + dbinom(3, size=12, prob=0.2) +
  + dbinom(4, size=12, prob=0.2)

# Alternatively, we can use the cumulative probability function for binomial distribution pbinom.

pbinom(4, size=12, prob=0.2)

# The probability of four or less questions answered correctly by random in a twelve question multiple choice quiz is 92.7%.
# Direct Look-Up, Intervals
# pbinom is the R function that calculates the c. d. f. of the binomial distribution. Optional arguments described on the on-line documentation specify the parameters of the particular binomial distribution.
#
# Both of the R commands in the box below do exactly the same thing.

pbinom(27, size=100, prob=0.25)
# pbinom(27, 100, 0.25)

options("scipen"=100, "digits"=4) # define the scientific style
# options("scipen"=-100, "digits"=4)

# They look up P(X <= 27) when X is has the Bin(100, 0.25) distribution. (Note the less than or equal to sign. It's important when working with a discrete distribution!)
#

# Example
# Question: Suppose widgets produced at Acme Widget Works have probability 0.005 of being defective. Suppose widgets are shipped in cartons containing 25 widgets. What is the probability that a randomly chosen carton contains no more than one defective widget?
#
# Question Rephrased: What is P(X <= 1) when X has the Bin(25, 0.005) distribution?
#
# Answer:

pbinom(1, 25, 0.005)
dbinom(0,25,0.005)+dbinom(1,25,0.005)

# The quantile is defined as the smallest value x such that F(x) >= p, where F is the distribution function.
# When the p-th quantile is non unique, there is a whole interval of values each of which is a p-th quantile. The documentation says that qbinom (and other "q" functions, for that matter) returns the smallest of these values. That is one sensible definition of an "inverse c. d. f." In the terminology of Section  of the course notes, the function defined by qbinom is a right inverse of the function defined by pbinom, that is,
# q == pbinom(qbinom(q, n, p)),       0 < q < 1,   0 < p < 1,   n a positive integer
# is always true, but the analogous formula with pnorm and qnorm reversed does not necessarily hold.



# Example
# Question: What are the 10th, 20th, and so forth quartiles of the Bin(10, 1/3) distribution?
#
#   Answer:
qbinom(0.1, 10, 1/3)
qbinom(0.9, 10, 1/3)
# and so forth, or all at once with
qbinom(seq(0.1, 0.9, 0.1), 10, 1/3)

# 2. How to plot distribution in R
# install.packages("tidyverse")
# install.packages("dslabs")
library(tidyverse)
library(dslabs)
library(ggplot2)
data(heights)
names(heights)
view(heights)
#############Histogram
library(ggplot2)
heights %>%
  filter(sex == "Female") %>%
  ggplot(aes(height)) +
  geom_histogram()

heights %>%
  filter(sex == "Female") %>%
  ggplot(aes(height)) +
  geom_histogram(binwidth = 2)

heights %>%
  filter(sex == "Male") %>%
  ggplot(aes(height)) +
  geom_histogram(binwidth = 1, fill = "blue", col = "black") +
  xlab("Male heights in inches")

  #############Density
heights %>%
  filter(sex == "Female") %>%
  ggplot(aes(height)) +
  geom_density()

heights %>%
  filter(sex == "Female") %>%
  ggplot(aes(height)) +
  geom_density(fill="blue")


###density distribution function

x<-seq(from=-3,to=+3,length.out=1000)

# It is noted that all the R built-in probability distributions include a density
# function. For a particular density, the function name is “d” prepended to the
# density name. For example, the density function for the normal distribution
# is dnorm, the density for the gamma distribution is dgamma, and so forth.
# If the first argument of the density function is a vector, then the function
# calculates the density at each point and returns the vector of densities.

x<-seq(from=0,to=6,length.out=100) # Define the density domain
ylim<-c(0,0.6)
# op <- par(mfrow = c(2, 2), mgp = c(3, 0.8, 0), mar =  .1+c(3,3,2,1))
par(mfrow=c(2,2)) # Create a 2x2 plotting area

plot(x,dunif(x,min=2,max=4),main="Uniform",type="l",ylim=ylim) #Plot a uniform density
plot(x,dnorm(x,mean=3,sd=1),main="Normal",type="l",ylim=ylim) #Plot a Normal density
plot(x,dexp(x,rate=1/2),main="Exponential",type="l",ylim=ylim) #Plot an Exponential density
plot(x,dgamma(x,shape=2,rate=1),main="Gamma",type="l",ylim=ylim) #Plot a Gamma density



#####plot cdf
FemaleH<-heights %>%
  filter(sex == "Female")

View(FemaleH)


Fecdf <- ecdf(FemaleH[,2])
summary(Fecdf)

op <- par(mfrow = c(3, 1), mgp = c(3, 0.8, 0), mar =  .1+c(3,3,2,1))
plot(Fecdf)
plot(Fecdf,verticals = TRUE, do.points = FALSE)
abline(v = knots(Fecdf), lty = 2, col = "gray70") #cex, size lty line type;pch, point type and  col color,the x-value(s) for vertical line(s).
## luxury plot
plot(Fecdf, verticals = TRUE, col.points = "blue",
     col.hor = "red", col.vert = "bisque",main="luxury",cex=0.5)
par(op) #cancel par defined before

plot(Fecdf)
plot.ecdf(FemaleH[,2],main="simple")



### get data and calculate key summary statistics
# extract "Ozone" data vector for New York
ozone = airquality$Ozone
# calculate the number of non-missing values in "ozone"
n = sum(!is.na(ozone))
# Now, let’s use the ecdf() function to obtain the empirical CDF values.  You can see what the output looks like below.

# obtain empirical CDF values
ozone.ecdf = ecdf(ozone)
plot(ozone.ecdf, xlab = 'Sample Quantiles of Ozone', ylab = '', main = 'Empirical Cumluative Distribution\nOzone Pollution in New York')

# add label for y-axis
# the "line" option is used to set the position of the label
# the "side" option specifies the left side
mtext(text = expression(hat(F)[n](x)), side = 2, line = 2.5)

summary(fivenum(ozone))

### empirical cumulative distribution function using sort() and plot()

# ordering the ozone data
ozone.ordered = sort(ozone)


# plot the possible values of probability (0 to 1) against the ordered ozone data (sample quantiles of ozone)
# notice the option type = 's' for plotting the step functions
plot(ozone.ordered, (1:n)/n, type = 's', ylim = c(0, 1), xlab = 'Sample Quantiles of Ozone', ylab = '', main = 'Empirical Cumluative Distribution\nOzone Pollution in New York')

# mark the 3rd quartile
abline(v = 62.5, h = 0.75)

# add a legend
legend(65, 0.7, '3rd Quartile = 63.5', box.lwd = 0)

# add the label on the y-axis
mtext(text = expression(hat(F)[n](x)), side = 2, line = 2.5)




#
# ###############
# # ecdf
#
# x <- rnorm(12)
# Fn <- ecdf(x)
# Fn     # a *function*
# Fn(x)  # returns the percentiles for x
# tt <- seq(-2, 2, by = 0.1)
# 12 * Fn(tt) # Fn is a 'simple' function {with values k/12}
# summary(Fn)
# ##--> see below for graphics
# knots(Fn)  # the unique data values {12 of them if there were no ties}
#
# y <- round(rnorm(12), 1); y[3] <- y[1]
# Fn12 <- ecdf(y)
# Fn12
# knots(Fn12) # unique values (always less than 12!)
# summary(Fn12)
# summary.stepfun(Fn12)
#
# ## Advanced: What's inside the function closure?
# ls(environment(Fn12))
# ## "f"     "method" "na.rm"  "nobs"   "x"     "y"    "yleft"  "yright"
# utils::ls.str(environment(Fn12))
# stopifnot(all.equal(quantile(Fn12), quantile(y)))
#
#
#
# require(graphics)
#
# op <- par(mfrow = c(3, 1), mgp = c(1.5, 0.8, 0), mar =  .1+c(3,3,2,1))
#
# F10 <- ecdf(rnorm(10))
# summary(F10)
#
# plot(F10)
# plot(F10, verticals = TRUE, do.points = FALSE)
#
# plot(Fn12 , lwd = 2) ; mtext("lwd = 2", adj = 1)
# xx <- unique(sort(c(seq(-3, 2, length = 201), knots(Fn12))))
# lines(xx, Fn12(xx), col = "blue")
# abline(v = knots(Fn12), lty = 2, col = "gray70")
#
# plot(xx, Fn12(xx), type = "o", cex = .1)  #- plot.default {ugly}
# plot(Fn12, col.hor = "red", add =  TRUE)  #- plot method
# abline(v = knots(Fn12), lty = 2, col = "gray70") # lty line type; and  col color,the x-value(s) for vertical line(s).
# ## luxury plot
# plot(Fn12, verticals = TRUE, col.points = "blue",
#      col.hor = "red", col.vert = "bisque")
#
# ##-- this works too (automatic call to  ecdf(.)):
# plot.ecdf(rnorm(24))
# title("via  simple  plot.ecdf(x)", adj = 1)
#
# par(op) #cancel par defined before
#
