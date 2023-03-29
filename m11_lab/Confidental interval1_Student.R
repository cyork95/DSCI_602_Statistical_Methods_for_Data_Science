
# Goal: Estimate the mean salary of all recently graduated students. Find a 90% and a 95%
#   confidence interval for the mean.
# Setting 1: Assume that incomes are normally distributed with unknown mean and SD = $15,000.
# A (1 - alpha)100% CI is
# Xbar +- z(alpha/2) * sigma/sqrt(n)
# We know n = 10, and are given sigma = 15000.

x<-c(44617,7066,17594,2726,1178,18898,5033,37151,4514,4000)
# a) 90% CI.
# This means alpha = .10 We can get z(alpha/2) = z(0.05) from R:
qnorm(.95)
qnorm(.05)
# And the sample average is just:
averU<-mean(x)

# So our margin of error is
me <- qnorm(.95)*(15000/sqrt(10))
me

# The lower and upper bounds are:
mean(x) - me
mean(x) + me
# 6475-22079


# b. For a 95% CI, alpha = .05. All of the steps are the same, except we replace z(.05) with
# z(.025)
me <- qnorm(.975)*(15000/sqrt(10))

mean(x) - me
mean(x) + me

# 4980-23575

####################################

# Setting II: Same problem, only now we do not know the value for the SD. Therefore, we must
# estimate it from the data:
x<-c(44617,7066,17594,2726,1178,18898,5033,37151,4514,4000)
# And the sample average is just:
averU<-mean(x)

stdSigma<-sd(x)
# Now a (1-alpha)100% CI looks like
# Xbar +- t(alpha/2, df) * s/sqrt(n)
# We just calculated s = 15345 and n = 10 still. Xbar is still 14277.
# 1. 90% CI
# Alpha = .10.
# All we need is the t-value:
#   Because the degrees of freedom are n-1 = 10-1 = 9:

qt(.95,9)

me <- qt(.95,9)*sd(x)/sqrt(10)

mean(x) - me

mean(x) + me

#5381-23173


# So the 90% CI is: (8896,23173). Note that this is wider than the last 90% CI.
# 2. 95% CI. Now alpha = .05. alpha/2=0.025
me <- qt(.975,9)*sd(x)/sqrt(10)
mean(x) - me

mean(x) + me

#3299- 25255

# Note that the lower end is getting dangerously close to 0! Note that this is the widest interval
# yet.


# Setting III:
#   Now we no longer assume the data are normal. Note that a look at the histogram and the qqnorm
# plot show that this wasn’t such a great assumption to begin

# So at best, the confidence intervals from above are approximate. The approximation, however,
# might not be very good.
# A bootstrap interval might be helpful. Here are the steps involved.
# 1. From our sample of size 10, draw a new sample, WITH replacement, of size 10.
# 2. Calculate the sample average, called the bootstrap estimate.
# 3. Store it.
# 4. Repeat steps 1-3 many times. (We’ll do 1000).
# 5. For a 90% CI, we will use the 5% sample quantile as the lower bound, and the 95% sample
# quantile as the upper bound. (Because alpha = 10%, so alpha/2 = 5%. So chop off that top and
#                               bottom 5% of the observations.)


#90% confidence interval
bstrap <- c()
for (i in 1:1000){
  # First take the sample
  bsample <- sample(x,10,replace=T)
  #now calculate the bootstrap estimate
  bestimate <- mean(bsample)
  bstrap <- c(bstrap,bestimate)}
#lower bound
quantile(bstrap,.05) #produces sample quantiles corresponding to the given probabilities

#upper bound
quantile(bstrap,.95)

#7720-22035.88 

# We use the same output to get the 95% confidence interval:
#  #lower bound for 95% CI is the 2.5th quantile:
quantile(bstrap,.025)

quantile(bstrap,.975)

#6694.528 -23662.3 