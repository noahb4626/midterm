#' probability function
#'
#' @param raschObj An object of class Rasch
#' @param theta A proposed value of theta_j
#'
#' @return The following vectors
#'  \item{P_ij}{a vector of length n representing P_ij for each question}
#'  \item{PQ}{a vector of length n representing P_ij if question was answered correctly, otherwise Q_ij} 
#' @author Noah Bardash: \email{noah.bardash@@wustl.edu}
#' @note Probability function
#' 
#' @rdname probability
#' @aliases probability, ANY-method

# create generic probability method
#' @export
setGeneric(name = "probability", def = function(raschObj = "Rasch", theta = "numeric") {
  standardGeneric("probability")
})

#' @export
setMethod(f = "probability", definition = function(raschObj, theta){
  # P_ij vector
  num <- exp(theta - raschObj@a)
  denom <- 1 + exp(theta - raschObj@a)
  P_ij <- num/denom
  # PQ vector
  PQ <- c()
  for(i in 1:length(raschObj@y)) {
    num2 <- exp(theta - raschObj@a[i])
    denom2 <- 1 + exp(theta - raschObj@a[i])
    if(raschObj@y[i] == 1) {
      PQ[i] <- num2/denom2
    }
    else {
      PQ[i] <- 1 - (num2/denom2)
    }
  }
  return(c(P_ij, PQ)) # probability vector of answering questions correctly
}
)
