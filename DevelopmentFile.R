# Set up packages
rm(list=ls()) # clear environment
library(devtools)
library(roxygen2)
setwd("Users/noahbardash/Documents/Github/midterm") # set working directory
devtools::create("easyRasch") # implement devtools

# Build skeleton
package.skeleton()

# Load code
current.code <- as.package("easyRasch") # set easyRasch package as current code
load_all(current.code) # load easyRasch package
document(current.code) # create documentation
check(current.code) # build R package

# Example

# Rasch student creation
joe <- new("Rasch", name = "Joe", a = 1:10, y = rep(0:1, 5))

# Method testing
theta_test <- 0.5
probability(joe, theta_test) # returns two vectors concatenated, P_ij & PQ, probability of answering a given question correctly/incorrectly
likelihood(joe, theta_test) # likelihood of proposed theta given test responses
prior(theta_test) # normal distribution of likelihoods for given a theta
EAP(joe, -6, 6) # expected a posteriori value
print(joe) # prints a student's name and their associated expected a posteriori value for a test
