#' EAP function
#'
#' @param raschObj An object of class Rasch
#' @param lower Lower limit of integration
#' @param upper Upper limit of integration
#'
#' @return The following value
#'  \item{theta_hat_j}{The calculated EAP from Equation 3 on assignment sheet}
#' @author Noah Bardash: \email{noah.bardash@@wustl.edu}
#' @note EAP function
#' 
#' @rdname EAP
#' @aliases EAP, ANY-method

# create generic EAP method
#' @export
setGeneric(name = "EAP", def = function(raschObj = "Rasch", lower = "numeric", upper = "numeric") {
  standardGeneric("EAP")
})
?integrate
#' @export
setMethod(f = "EAP", definition = function(raschObj, lower, upper){
  num_integrand <- raschObj@theta*likelihood(raschObj, raschObj@theta)*prior(raschObj@theta)
  num <- integrate(num_integrand, lower, upper)
  denom_integrand <- likelihood(raschObj, raschObj@theta)*prior(raschObj@theta)
  denom <- integrate(denom_integrand, lower, upper)
  return(num/denom)
}
)
