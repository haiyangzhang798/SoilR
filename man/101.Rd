\name{Yasso07Model}
\alias{Yasso07Model}
\title{Implementation of the Yasso07 model}
\description{This function creates a model for five pools as described in Tuomi et al. (2008)}
\usage{Yasso07Model(t, ks = c(kA = 0.66, kW = 4.3, kE = 0.35, kN = 0.22, 
    kH = 0.0033), p = c(p1 = 0.32, p2 = 0.01, p3 = 0.93, p4 = 0.34, 
    p5 = 0, p6 = 0, p7 = 0, p8 = 0, p9 = 0.01, p10 = 0, p11 = 0, 
    p12 = 0.92, pH = 0.04), C0, In, xi = 1, solver = deSolve.lsoda.wrapper, 
    pass = FALSE)}\arguments{
  \item{t}{A vector containing the points in time where the solution is sought.}
  \item{ks}{A vector of lenght 5 containing the values of the decomposition rates for each pool.}
  \item{p}{A vector of length 13 containing transfer coefficients among different pools.}
  \item{C0}{A vector containing the initial amount of carbon for the 5 pools. The length of this vector must be 5.}
  \item{In}{A single scalar or data.frame object specifying the amount of litter inputs by time}
  \item{xi}{A scalar or data.frame object specifying the external (environmental and/or edaphic) effects on decomposition rates.}
  \item{solver}{A function that solves the system of ODEs. This can be \code{\link{euler}} or \code{\link{ode}} or any other user provided function with the same interface.}
  \item{pass}{if TRUE forces the constructor to create the model even if it is invalid}
}

\value{A Model Object that can be further queried }
\references{Tuomi, M., Thum, T., Jarvinen, H., Fronzek, S., Berg, B., Harmon, M., Trofymow, J., Sevanto, S., and Liski, J. (2009).
Leaf litter decomposition-estimates of global variability based on Yasso07 model. Ecological Modelling, 220:3362 - 3371.}
\author{Carlos A. Sierra <csierra@bgc-jena.mpg.de>, Markus Mueller
<mamueller@bgc-jena.mpg.de>}



\seealso{\code{\link{ICBMModel}}, \code{\link{RothCModel}}}
\examples{
years=seq(0,50,0.1) 
C0=rep(100,5)
In=0

Ex1=Yasso07Model(t=years,C0=C0,In=In)
Ct=getC(Ex1)
Rt=getReleaseFlux(Ex1)

plotCPool(years,Ct,col=1:5,xlab="years",ylab="C pool",
          ylim=c(0,max(Ct)))
legend("topright",c("xA","xW","xE","xN","xH"),lty=1,col=1:5,bty="n")

plotCPool(years,Rt,col=1:5,xlab="years",ylab="Respiration",ylim=c(0,50))
legend("topright",c("xA","xW","xE","xN","xH"),lty=1,col=1:5,bty="n")

}
