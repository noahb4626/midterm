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
  # P_ij vector - from equation 1 on assignment sheet
  num <- exp(theta - raschObj@a)
  denom <- 1 + exp(theta - raschObj@a)
  P_ij <- num/denom
  # PQ vector - same length as PQ, P_ij if a question answered correctly, Q_ij if a question answered incorrectly
  PQ <- c()
  for(i in 1:length(raschObj@y)) {
    num2 <- exp(theta - raschObj@a[i])
    denom2 <- 1 + exp(theta - raschObj@a[i])
    # if question answered correctly, same value as that in P_ij (same equation as above)
    if(raschObj@y[i] == 1) {
      PQ[i] <- num2/denom2
    }
    # if question answered incorrectly, value in PQ_ij is 1 - P_ij
    else {
      PQ[i] <- 1 - (num2/denom2)
    }
  }
  return(list(P_ij, PQ)) # probability vector of answering questions correctly: first half is P_ij, then
}
)
