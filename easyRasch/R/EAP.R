#' EAP function
#'
#' @param raschObj An object of class Rasch
#' @param lower Lower limit of integration
#' @param upper Upper limit of integration
#'
#' @return The following value
#'  \item{theta_hat_j}{The calculated expected a posteriori from Equation 3 on assignment sheet}
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

#' @export
setMethod(f = "EAP", definition = function(raschObj, lower = -6, upper = 6){
  num_integrand <- function(theta) {
    return((theta)*(likelihood(raschObj, theta))*(prior(theta))) }
  theta_val <- 0.7
  num <- integrate(num_integrand(theta_val), lower, upper)
  denom_integrand <- function(theta) {
    return(likelihood(raschObj, theta))*(prior(theta)) }
  denom <- integrate(denom_integrand(theta_val), lower, upper)
  return(num)
}
)
