# Monte Carlo Simulation 
## Functions in R

my_function <- function() {
  print("Hello World!")
}

## Loop in R

fruits <- list("apple", "bananna", "cherry")

for (x in fruits) {
  print(x)
}

## sample() in R and replicate() in R

roll <- function(nd) {
  return(sample(1:6, nd, replace = TRUE))
}

### replicate is used to repeat work 1000 times in below case
replicate(1000, sum(roll(3)))

# Example: Rolling Dice
# If we roll three dice, what is the probability that their total is 8?
# We could count all the possibilities

nreps <- 1000
d <- 3
k <- 8

count <- 0

for (rep in 1:nreps) {
  # sum is the total sum of the numbers  of the top faces for all rollings
  # first assign 0 to "sum" object
  sum <- 0
  # roll d dice and find their sum, roll is the sum of the numbers of the 
  # top faces
  for (j in 1:d) {
    sum <- sum + roll
  }
  if (sum == k)
    count <- count + 1
}

# Get the probability
print(count/nreps)

# Roll is not known, if assign "roll"=1~6, if roll=8?
# Roll is arbitrary value, so use samples value with function sample()

nreps <- 1000
d <- 3
k <- 8

## count: how any time the rolling meets the requirement
count <- 0

for (rep in 1:nreps) {
  sum <- 0
  # roll d dice and find their sum, roll is sum of the numbers of the top faces
  for (j in 1:d) {
    roll <- sample(1:6, d, replace=TRUE)
    sum <- sum(roll)
    if (sum == k)
      count <- count + 1
  }
}

# Get the probability: in [nreps] time rollings, [count] out of [nreps]
print(count/nreps)

## Again using functions

roll <- function(nd)
  return(sample(1:6, nd, replace=TRUE))

probtotk <- function(d, k, nreps) {
  # do the experiment nreps times
  sums <- replicate(nreps, sum(roll(d)))
  return(mean(sums==k))
}

probtotk(3, 8, 1000)