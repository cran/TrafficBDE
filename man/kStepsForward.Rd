% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/kStepsForward.R
\name{kStepsForward}
\alias{kStepsForward}
\title{k Steps Forward}
\usage{
kStepsForward (Data, Link_id, direction, datetime, predict, steps)
}
\arguments{
\item{Data}{A data frame with the historical data}

\item{Link_id}{A character with the id of the road needed}

\item{direction}{The direction of the road}

\item{datetime}{The datetime wanted}

\item{predict}{The value to be predicted}

\item{steps}{The number of steps}
}
\value{
The predicted value
}
\description{
This function predictes the wanted value after k steps.
}
\details{
This function returns the predicted value after k steps.
}
\examples{
\dontrun{
kStepsForward (X163204843_1, "163204843", "1", "2017-01-27 14:00:00", "Mean_speed", 1)}

}
\seealso{
\code{\link{loadData}}
}
\author{
Aikaterini Chatzopoulou, Kleanthis Koupidis, Charalampos Bratsas
}
