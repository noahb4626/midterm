probability <-
function(raschObj.a, raschObj.y, theta) {
  # P_ij vector
  num <- exp(theta - raschObj.a)
  denom <- 1 + exp(theta - raschObj.a)
  P_ij <- num/denom
  # PQ vector
  PQ <- c()
  print(length(raschObj.y))
  for(i in length(raschObj.y)) {
    num2 <- exp(theta - raschObj.a[i])
    denom2 <- 1 + exp(theta - raschObj.a[i])
    if(raschObj.y[i] == 1) {
      val <- num2/denom2
      print(val)
    }
    else {
      val <- 1 - (num2/denom2)
      print(val)
      PQ <- c(PQ, val)
    }
  }
  return(P_ij) # probability vector of answering questions correctly
  return(PQ)
}
