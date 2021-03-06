% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/Conwy-data.R
\docType{data}
\name{ConwyData}
\alias{ConwyData}
\alias{ConwySlope}
\alias{LandUseChange}
\alias{ConwyStatus}
\alias{evidence}
\alias{ConwyLU}
\alias{LUclasses}
\title{Land use change data}
\format{A dataset in native \code{RData} format.}
\usage{
data(ConwyData)
}
\description{
Data derived from the Conwy catchment in North Wales (UK), widely modified
for demonstration purposes. Once loaded, the data consist of several objects:
\itemize{
  \item LandUseChange An object of class \href{https://cran.r-project.org/package=gRain}{\code{grain}}. 
  The Bayesian network, built for demonstration purposes.
  \item ConwyLU An object of class \href{https://cran.r-project.org/package=raster}{\code{RasterLayer}}. 
  A simplified version of the current land use map from the Conwy catchment (Wales, UK). It includes three classes: arable (raster value 3), forest (2), other (1).
  \item ConwySlope An object of class RasterLayer. A raster of slope derived from a digital elevation model at 50 meters resolution, units are degrees.
  \item ConwyStatus An object of class RasterLayer. The land ownership type (dummy data), divided into three possible classes: public (raster value 4), private (3), protected (1).
  \item evidence A matrix. The collection of available spatial data (see above) as extracted from each location (i.e. cell) 
  in the catchment, where the latter is represented by the raster object \code{ConwyLU}. Each value from the spatial data was 
  discretized through \code{\link{dataDiscretize}} or \code{\link{bulkDiscretize}} functions, then assigned to the corresponding 
  state from the Bayesian network (LandUseChange).
  \item LUclasses A list with the classification of input spatial data (its corresponding states and values). The list is formatted accordingly to 
  bnspatial functions requirement and as returned by functions \code{\link{importClasses}} and \code{\link{setClasses}}.
}
}
\examples{
library(bnspatial)
data(ConwyData)
list2env(ConwyData, environment())
ls()

## The network nodes and states
LandUseChange$universe$levels

## Lookup list relating raster values and network nodes
LUclasses

## Table of evidence extracted from input spatial data
head(evidence, 12)

## The input spatial data (raster format)
par(mfrow=c(2,2))
raster::plot(ConwyLU)
raster::plot(ConwySlope)
raster::plot(ConwyStatus)

## The input spatial data (vector format)
Conwy <- sf::st_read(system.file("extdata", "Conwy.shp", package = "bnspatial"), quiet = TRUE)
# plot(Conwy) # May be slow to show up
}
