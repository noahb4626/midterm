#' prior function
#'
#' @param theta A proposed value of theta_j
#'
#' @return The following value
#'  \item{height}{The height of the specified normal curve - mean = 0, standard dev = 3, evaluated at theta_j}
#' @author Noah Bardash: \email{noah.bardash@@wustl.edu}
#' @note Prior function
#' 
#' @rdname prior
#' @aliases prior, ANY-method

# create generic prior method
#' @export
setGeneric(name = "prior", def = function(theta = "numeric") {
  standardGeneric("prior")
})

#' @export
setMethod(f = "prior", definition = function(theta){
  height <- dnorm(x = theta, mean = 0, sd = 3, log = FALSE)
  return(height)
}
)
