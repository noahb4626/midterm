\name{probability}
\alias{probability}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
%%  ~~function to do ... ~~
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
probability(raschObj.a, raschObj.y, theta)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{raschObj.a}{
%%     ~~Describe \code{raschObj.a} here~~
}
  \item{raschObj.y}{
%%     ~~Describe \code{raschObj.y} here~~
}
  \item{theta}{
%%     ~~Describe \code{theta} here~~
}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
}
\references{
%% ~put references to the literature/web site here ~
}
\author{
%%  ~~who you are~~
}
\note{
%%  ~~further notes~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{
##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (raschObj.a, raschObj.y, theta) 
{
    num <- exp(theta - raschObj.a)
    denom <- 1 + exp(theta - raschObj.a)
    P_ij <- num/denom
    PQ <- c()
    print(length(raschObj.y))
    for (i in length(raschObj.y)) {
        num2 <- exp(theta - raschObj.a[i])
        denom2 <- 1 + exp(theta - raschObj.a[i])
        if (raschObj.y[i] == 1) {
            val <- num2/denom2
            print(val)
        }
        else {
            val <- 1 - (num2/denom2)
            print(val)
            PQ <- c(PQ, val)
        }
    }
    return(P_ij)
    return(PQ)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }% use one of  RShowDoc("KEYWORDS")
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
