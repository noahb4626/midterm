# Set up packages
rm(list=ls()) # clear environment
library(devtools)
library(roxygen2)
setwd("~/Documents/Github/midterm") # set working directory
devtools::create("easyRasch") # implement devtools

# Build skeleton
setwd("/Users/noahbardash/Documents/Github/midterm")
package.skeleton() # do not do this again!

# Load code
current.code <- as.package("easyRasch") # set easyRasch package as current code
load_all(current.code) # load easyRasch package
document(current.code) # create documentation
check(current.code) # build R package

# Basic probability function (2)

# Example (3)

test_student <- new("Rasch")
test_student@name <- "Test"
test_student@a <- 1:10
test_student@y <- rep(0:1, 5)
theta_test <- 0.5
probability(test_student, theta_test)
likelihood(test_student, theta_test)
prior(theta_test)

