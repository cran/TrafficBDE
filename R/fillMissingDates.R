#' @title 
#' Fill Missing Dates
#'  
#' @description
#' This function fills the missing dates from the data.
#' 
#' @usage fillMissingDates(Data, datetime)
#' 
#' @param Data The historical data
#' @param datetime The datetime wanted
#'  
#' @details 
#' This function returns a data frame without missing dates.
#' 
#' @author Aikaterini Chatzopoulou, Charalampos Bratsas
#' 
#' @return A data frame with all the historical data between the first date and the date wanted. 
#' 
#' @seealso \code{\link{loadData}}, \code{\link{fillMissingValues}}
#' 
#' @rdname fillMissingDates
#' 
#' @examples 
#' \dontrun{
#' SpecLink <- loadDataSpecLink("163204843","1", X163204843_1)
#' x <- fillMissingValues(SpecLink)
#' datetime <- "2017-01-27 14:00:00" 
#' newData <- fillMissingDates (x, datetime)}
#' 
#' @importFrom  dplyr full_join
#' @import zoo
#' @importFrom lubridate days
#' 
#' @export

fillMissingDates <- function(Data, datetime){
  stopifnot(any(colnames(Data)=="Date"))
  
  datetime <- strptime(datetime,'%Y-%m-%d %H:%M:%S',tz="Europe/Istanbul")
  Data$Date <- as.POSIXct(strptime(Data$Date,'%Y-%m-%d %H:%M:%S',tz="Europe/Istanbul"))
  
  ts <- seq.POSIXt(min(Data$Date), datetime, by="15 min")
  
  ts <- seq.POSIXt(as.POSIXlt(min(Data$Date)), as.POSIXlt(datetime), by="15 min")
  ts <- format.POSIXct(ts,'%Y-%m-%d %H:%M:%S')
  
  df <- data.frame(Date=ts)
  df$Date <- as.POSIXct(strptime(as.character(df$Date),format='%Y-%m-%d %H:%M:%S', 
                                 tz="Europe/Istanbul"))
  df$Date <- as.POSIXct(df$Date)
  Data = Data[Data$Date <= datetime,]
  Data$Date <- as.POSIXct(Data$Date)
  
  data_with_missing_times <- dplyr::full_join(df,Data, by="Date")
  data_with_missing_times <- data_with_missing_times[,-c(2,3)]
  
  #z <- zoo::read.zoo(data_with_missing_times, tz = "Europe/Istanbul", format = '%Y-%m-%d %H:%M:%S')
  #z <- zoo::na.approx(z)
  #z <- as.data.frame(z)
  z <- zoo::na.locf(data_with_missing_times)
  
  #data_with_missing_times <- data.frame(as.character(rownames(z)),z)
  #rownames(data_with_missing_times) <- NULL
  data_with_missing_times <- z
  colnames(data_with_missing_times) <- colnames(z)
  
  days <- lubridate::days(14)
  twoweeks <- datetime - days
  
  data_with_missing_times$Date <- as.POSIXct(strptime(as.character(data_with_missing_times$Date),
                                                      format='%Y-%m-%d %H:%M:%S',tz="Europe/Istanbul"))
  if(min(data_with_missing_times$Date) < twoweeks){
    minDate <- twoweeks
  }else{minDate <- min(data_with_missing_times$Date)}
  
  data_with_missing_times <- subset(data_with_missing_times, data_with_missing_times$Date >= minDate)
  
  return(data_with_missing_times)
}
