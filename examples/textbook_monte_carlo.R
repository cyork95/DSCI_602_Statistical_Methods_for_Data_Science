# Monte Carlo From Textbook

# Example Rolling Dice

# roll d dice; find P(total = k)

probtotk <- function(d, k, nreps) {
  count <- 0
  # do the experiment nreps times -- like doing npreps notebook lines
  for (rep in 1:nreps) {
    sum <- 0
    # roll d dice and find their sum
    for (j  in 1:d) sum <- sum + roll()
    if (sum == k) count <- count + 1
  }
  return(count/nreps)
}

# simulate the roll of one die;
roll <- function() return(sample(1:6,1))

# example
probtotk(3,8,1000)

###############################################################################

probtotk_improved <- function(d, k, nreps) {
  count <- 0
  # do the experiment nreps times -- like doing npreps notebook lines
  for (rep in 1:nreps) {
    total <- sum(sample(1:6,d,replace = TRUE))
    if (total == k) count <- count + 1
  }
  return(count/nreps)
}

# example
probtotk_improved(3,8,1000)

###############################################################################

roll <- function(nd) return(sample(1:6,nd,replace = TRUE))

probtotk_second_improve <- function(d, k, nreps) {
  sums <- vector(length = nreps)
  # do the experiment nreps times -- like doing npreps notebook lines
  for (rep in 1:nreps) sums[rep] <- sum(roll(d))
  return(mean(sums==k))
}

probtotk_second_improve(3,8,1000)

###############################################################################

roll <- function(nd) return(sample(1:6, nd, replace = TRUE))

probtotk_third_improve <- function(d, k, nreps) {
  # do the experiment nreps times -- like doing npreps notebook lines
  sums <- replicate(nreps, sum(roll(d)))
  return(mean(sums==k))
}

probtotk_third_improve(3,8,1000)

###############################################################################

# Example: Dice Problem

dicesum <- function(nreps) {
  count1 <- 0
  count2 <- 0
  for( i in 1:nreps) {
    d <- sample(1:6, 3, replace = T)
    # among those lines in which A occurs
    if (sum(d) > 8) {
      count1 <- count1 + 1
      if (d[1] < 3) count2 <- count2 + 1
    }
  }
  return(count2 / count1)
}

