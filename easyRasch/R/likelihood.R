#' likelihood function
#'
#' @param raschObj An object of class Rasch
#' @param theta A proposed value of theta_j
#'
#' @return The following
#'  \item{likelihood}{The calculated likelihood from Equation 2 on assignment sheet}
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
  P_ij_and_PQ <- probability(raschObj, theta) # use probability to function to obtain required values
  PQ_result <- tail(P_ij_and_PQ,length(P_ij_and_PQ)/2) # we only care about the PQ vector from probability function, not the first half of the vector
  return(prod(PQ_result))
}
)
