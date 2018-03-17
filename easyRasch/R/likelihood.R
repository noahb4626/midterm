#' likelihood function
#'
#' @param raschObj An object of class Rasch
#' @param theta A proposed value of theta_j
#'
#' @return The following vectors
#'  \item{lik}{The calculated likelhood from Equation 2 on assignment sheet}
#' @author Noah Bardash: \email{noah.bardash@@wustl.edu}
#' @note Likelihood function
#' 
#' @rdname likelihood
#' @aliases likelihood, ANY-method

# create generic likelihood method
#' @export
setGeneric(name = "likelihood", def = function(raschObj = "Rasch", theta = "numeric") {
  standardGeneric("likelihood")
})

#' @export
setMethod(f = "likelihood", definition = function(raschObj, theta){
  PQ_result <- probability(raschObj, theta) # use probability to function to obtain required values
  PQ_result <- tail(PQ_result,length(PQ_result)/2) # we only care about the PQ vector from probability function, not the first half
  return(prod(PQ_result))
}
)
