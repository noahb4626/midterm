# Set up packages (1)
rm(list=ls()) # clear environment
library(devtools)
library(roxygen2)
setwd("~/Documents/Github/midterm") # set working directory
devtools::create("easyRasch") # implement devtools

# Build skeleton (4)
setwd("/Users/noahbardash/Documents/Github/midterm")
package.skeleton()

# Load code (5)
current.code <- as.package("easyRasch") # set easyRasch package as current code
load_all(current.code) # load easyRasch package
document(current.code) # create documentation
check(current.code) # build R package

# Basic probability function (2)

# Example (3)

test_student <- new("Rasch", name = "test", a <- 1:10, y <- rep(0:1, 5))
theta_test <- 0.5
raschObj.a_test <- 1:10
raschObj.y_test <- rep(0:1, 5)
probability(raschObj.a_test, raschObj.y_test, theta_test)

