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
setGeneric(name = "EAP", def = function(raschObj = "Rasch", lower = -6, upper = 6) {
  standardGeneric("EAP")
})

# create generic num_integrand method
#' @export
setGeneric(name = "num_integrand", def = function(theta = "numeric") {
  standardGeneric("num_integrand")
})

# create generic denom_integrand method
#' @export
setGeneric(name = "denom_integrand", def = function(theta = "numeric") {
  standardGeneric("denom_integrand")
})

#' @export
setMethod(f = "EAP", definition = function(raschObj, lower, upper){
  # numerator calculations
  setMethod(f = "num_integrand", definition = function(theta) {
    return((theta)*(likelihood(raschObj, theta))*(prior(theta))) })
  num <- integrate(num_integrand(0.5), lower, upper)
  # denominator calculations
  setMethod(f = "denom_integrand", definition = function(theta) {
    return((likelihood(raschObj, theta))*(prior(theta))) })
  denom <- integrate(denom_integrand(0.5), lower, upper)
  return(num)
}
)
