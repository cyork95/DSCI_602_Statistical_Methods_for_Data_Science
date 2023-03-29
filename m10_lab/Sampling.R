# About sampling, here we will talk about three sampling examples here.
#########1. One is to get samples from population.#################
# Generate a Population, Take a Sample
# Create a Random Population in R
# We use the matrix object to create a random matrix.
# Set the seed of R's random number generator, which is useful for creating simulations or random objects that can be reproduced.
set.seed(123)
# Create a Random population
nCols = 5
nRows = 3
population <- matrix(runif(nCols * nRows), ncol = nCols )

# Print the Population
print.listof(list(population))
# Print the First Row of the Population
first_row <- population[1,]
print(first_row)

# Print the First Column of the Population
first_col <- population[,1]
print(first_col)

View(population)
# Generate a Random Sample from the Population
set.seed(123)
n <- 5
random_sample = sample(population, n)
random_sample
# Print a Random Sample from the Population
sprintf("Random Sample of %s item is %1.7f", length(n), random_sample)

# This will allow you to reproduce the same random results I do.
set.seed(10)
# 
# The set. seed() function sets the starting number used to generate a sequence of random 
# numbers – it ensures that you get the same result if you start with that same seed each 
# time you run the same process. For example, if I use the sample() function immediately 
# after setting a seed, I will always get the same sample.

# Load CSV Data
df <- read_csv("~/Data Science/R_Scripts/dsci_602/m10_lab/Soil Organic Carbon.csv")

# Get a Random Sample of the Data
num_of_rows = 10
# my_sample = df[sample(nrow(df), num_of_rows), ]
my_sample = df[sample(nrow(df), num_of_rows), 1:2]

print(my_sample)


#########2. One is to do integration to the continous distribution.#################
# Integration
# We'll start with basic integration. Suppose we have an instance of a Normal distribution 
# with a mean of 1 and a standard deviation of 10. Then we want to find the integral 
# from 3 to 6  
# N(x;1,10) as visualized below
# # We can simply write a simulation that samples from this distribution 100,000 times 
# # and see how many values are between 3 and 6.
# usage: rnorm(n, mean = 0, sd = 1),random generation for the normal distribution 
# with mean equal to mean and standard deviation equal to sd.
# n is number of observations, mean and sd are parameters for normal distribution

runs <- 100000
sims <- rnorm(runs,mean=1,sd=10)
mc.integral <- sum(sims >= 3 & sims <= 6)/runs
mc.integral
# The result we get is:
# mc.integral  = 0.1122

pnorm(6,mean=1,sd=10)-pnorm(3,mean=1,sd=10)

#########3. One is to approximate the Binomial Distribution.#################
# central limit theorem
# we use simulation to get the probability.
# Approximating the Binomial Distribution  (Bernoulli trials?)
# We flip a coin 10 times and we want to know the probability of getting more than 3 heads. 
# Now this is a trivial problem for the Binomial distribution, but suppose we have forgotten about 
# this or never learned it in the first place. We can easily solve this problem with a Monte Carlo Simulation. 
# We'll use the common trick of representing tails with 0 and heads with 1, then simulate 10 coin tosses 100,000
# times and see how often that happens. 
runs <- 100000
#one.trail simulates a single round of toss 10 coins
#and returns true if the number of heads is > 3
one.trial <- function(){
  sum(sample(c(0,1),10,replace=T)) > 3
}
#now we repeat that trial 'runs' times.
mc.binom <- sum(replicate(runs,one.trial()))/runs
mc.binom


# For our ad hoc Binomial distribution we get
# mc.binom = 0.8279

# Which we can compare to R's builtin Binomial distribution function
# pbinom(3,10,0.5,lower.tail=FALSE) = 0.8281
pbinom(3,10,0.5,lower.tail=FALSE)
# 
# Sampling With Replacement and Without Replacement
# Suppose we use the lottery method  to select 
# a simple random sample. After we pick a number from the bowl, 
# we can put the number aside or we can put it back into the bowl. 
# If we put the number back in the bowl, it may be selected more than once; 
# if we put it aside, it can selected only one time.
# 
# When a population element can be selected more than one time,
# we are sampling with replacement. When a population element can be selected only one time,
# we are sampling without replacement.
# 
