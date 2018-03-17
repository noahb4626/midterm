#' A student who has taken a test
#' 
#' Objects of class \code{Rasch} are created by the \code{poisson.lik} function
#'
#' 
#' An object of the class 'Rasch' has the following slots:
#' \itemize{
#' \item \code{name} The name of the test taker
#' \item \code{a} A vector of question-item difficulty paramaters
#' \item \code{y} A vector of answers for the respondent
#' }
#'
#' @author Noah Bardash: \email{noah.bardash@@wustl.edu}
#' @aliases Rasch-class initialize,Rasch-method 
#' @rdname Rasch
#' @export
setClass(Class="Rasch", 
         representation = representation(
           name = "String",
           a = "numeric",
           y = "numeric"
         ),
         prototype = prototype(
           name = c(),
           a = c(),
           y = c()
         )
)
#' @export
setMethod("initialize", "Rasch", 
          function(.Object, ...){
            value=callNextMethod()
            return(value)
          }
) 

#' @rdname Rasch