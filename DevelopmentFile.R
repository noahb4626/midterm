# Set up packages
rm(list=ls()) # clear environment
library(devtools)
library(roxygen2)
setwd("~/Documents/Github/midterm") # set working directory
devtools::create("easyRasch") # implement devtools

current.code <- as.package("easyRasch") # set easyRasch package as current code
load_all(current.code) # load easyRasch package
document(current.code) # create documentation
check(current.code) # build R package

# Basic probability function
probability <- function(raschObj.a, raschObj.y, theta) {
  # P_ij vector
  num <- exp(theta - raschObj.a)
  denom <- 1 + exp(theta - raschObj.a)
  P_ij <- num/denom
  # PQ vector
  PQ <- c()
  for(i in length(raschObj.y)) {
    num2 <- exp(theta - raschObj.a[i])
    denom2 <- 1 + exp(theta - raschObj.a[i])
    if(raschObj.y[i] == 1) {
      PQ[i] <- num2/denom2
    }
    else if(raschObj.y[i] == 0) {
      PQ[i] <- 1 - (num2/denom2)
    }
  }
  return(c(P_ij, PQ)) # probability vector of answering questions correctly
}
theta_test <- 0.5
raschObj.a_test <- 1:10
raschObj.y_test <- rep(0:1, 5)
raschObj.y_test1 <- rep(0, 10)
probability(raschObj.a_test, raschObj.y_test, theta_test)
