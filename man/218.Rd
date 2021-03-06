\name{turnoverFit}
\alias{turnoverFit}
\title{Estimation of the turnover time from a soil radiocarbon sample.}
\description{This function finds the best possible value of turnover time from a soil radiocarbon
sample assuming a one pool model and annual litter inputs. }
\usage{turnoverFit(obsC14, obsyr, In, C0 = 0, yr0 = 1900, Zone = "NHZone2", 
    plot = TRUE)}\arguments{
  \item{obsC14}{a scalar with the observed radiocarbon value in Delta14C of the soil sample.}
  \item{obsyr}{a scalar with the year in which the soil sample was taken.}
  \item{In}{a scalar or data.frame with the annual amount of litter inputs to the soil.}
  \item{C0}{a scalar with the initial amount of carbon stored at the begning of the simulation.}
  \item{yr0}{The year at which simulations will start.}
  \item{Zone}{the hemispheric zone of atmospheric radiocarbon. Possible values are NHZone1: northern hemisphere zone 1, NHZone2: northern hemisphere zone 2, NHZone3: northern hemisphere zone 3, SHZone12: southern hemisphere zones 1 and 2, SHZone3: southern hemisphere zone 3. See \code{\link{Hua2013}} for additional information.}
  \item{plot}{logical. Should the function produce a plot?}
}
\details{This algorithm takes the observed values and a given amount of litter inputs, runs \code{\link{OnepModel14}}, calculates the squared difference between predictions and observations, and uses \code{\link{optimize}} to find the minimum difference.
If the turnover time is relatively short (< 50 yrs), it is safe to assume C0=0 because the soil will reach steady state within the simulation time. However, for longer turnover times it is recommended to use a value of C0 close to the steady state value.  }
\value{A scalar with the value of the turnover time that minimizes the difference between the prediction of a one pool model and the observed radiocarbon value.}

\author{Carlos A. Sierra <csierra@bgc-jena.mpg.de>, Markus Mueller
<mamueller@bgc-jena.mpg.de>}



\examples{
\dontrun{
# Calculate the turnover time for a sample from a temperate forest soil
turnoverFit(obsC14=115.22, obsyr=2004.5, C0=2800, yr0=1900,
                          In=473, Zone="NHZone2")

}}
