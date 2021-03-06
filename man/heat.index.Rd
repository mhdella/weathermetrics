% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/heat_index.R
\name{heat.index}
\alias{heat.index}
\title{Calculate heat index.}
\usage{
heat.index(t = NA, dp = c(), rh = c(),
  temperature.metric = "fahrenheit", output.metric = NULL, round = 0)
}
\arguments{
\item{t}{Numeric vector of air temperatures.}

\item{dp}{Numeric vector of dew point temperatures.}

\item{rh}{Numeric vector of relative humidity (in \%).}

\item{temperature.metric}{Character string indicating the temperature
metric of air temperature and dew point temperature. Possible values
are 'fahrenheit' or 'celsius'.}

\item{output.metric}{Character string indicating the metric into which
heat index should be calculated. Possible values are 'fahrenheit' or
'celsius'.}

\item{round}{Integer indicating the number of decimal places to
round converted value.}
}
\value{
A numeric vector of heat index values in the metric specified
   by \code{output.metric}. (If \code{output.metric} is not specified,
   heat index will be returned in the same metric in which air
   temperature was input, specified by \code{temperature.metric}.)
}
\description{
\code{heat.index} creates a numeric vector of heat index values from
   numeric vectors of air temperature and either relative humidity or
   dew point temperature.
}
\details{
Include air temperature (\code{t}) and either dew point
   temperature (\code{dp}) or relative humdity (\code{rh}). You cannot
   specify both dew point temperature and relative humidity-- this will
   return an error. Heat index is calculated as \code{NA} when impossible
   values of dew point temperature or humidity are input (e.g., humidity
   above 100\% or below 0\%, dew point temperature above air temperature).
}
\note{
Equations are from the source code for the US National Weather
    Service's
    \href{http://www.wpc.ncep.noaa.gov/html/heatindex.shtml}{online heat index calculator}.
}
\examples{
# Calculate heat index from temperature (in Fahrenheit)
# and relative humidity.

data(suffolk)
suffolk$heat.index <- heat.index(t = suffolk$TemperatureF,
                                 rh = suffolk$Relative.Humidity)
suffolk

# Calculate heat index (in Celsius) from temperature (in
# Celsius) and dew point temperature (in Celsius).

data(lyon)
lyon$heat.index <- heat.index(t = lyon$TemperatureC,
                              dp = lyon$DewpointC,
                              temperature.metric = 'celsius',
                              output.metric = 'celsius')
lyon

}
\author{
Brooke Anderson \email{brooke.anderson@colostate.edu},
Roger Peng \email{rdpeng@gmail.com}
}
\references{
Anderson GB, Bell ML, Peng RD. 2013. Methods to calculate the heat index
   as an exposure metric in environmental health research.
   Environmental Health Perspectives 121(10):1111-1119.

National Weather Service Hydrometeorological Prediction
   Center Web Team. Heat Index Calculator. 30 Jan 2015.
   \url{http://www.wpc.ncep.noaa.gov/html/heatindex.shtml}.
   Accessed 18 Dec 2015.

Rothfusz L. 1990. The heat index (or, more than you ever wanted to know
   about heat index) (Technical Attachment SR 90-23). Fort Worth:
   Scientific Services Division, National Weather Service.

R. Steadman, 1979. The assessment of sultriness. Part I: A
   temperature-humidity index based on human physiology and clothing
   science. Journal of Applied Meteorology, 18(7):861--873.
}

