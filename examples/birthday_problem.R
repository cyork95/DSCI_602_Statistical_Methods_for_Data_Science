# n <- the amount of people in the room
# assumes non leap year
# returns PDF of n

birthday <- function(n) {
  1 - choose(365, 365-n) * factorial(n) / 365^n
}

birthday(36)


