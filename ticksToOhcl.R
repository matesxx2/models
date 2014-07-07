ticksToOhcl<-function(tickData,timeFrameSize=60, timeFormat='%Y%m%d %H:%M:%OS'){
  
  # convert factors to date object
  tickData$Date = strptime(tickData$Date, timeFormat)
  
  # round date to timeFrameSize
  # all date from the same ohlc frame has to have 
  # same date for later aggregation
  #
  # now hardcoded 30s size of frame
  # tickData$Date$sec = floor(tickData$Date$sec/30)*30
  tickData$Date$sec = floor(tickData$Date$sec/60)
  
  # open
  tmp = aggregate(x=tickData$Buy,by=list(as.character(tickData$Date)),FUN="head",n=1)
  Open = tmp[,2]
  
  # high
  tmp = aggregate(x=tickData$Buy,by=list(as.character(tickData$Date)),FUN="max")
  High = tmp[,2]
  
  # low
  tmp = aggregate(x=tickData$Buy,by=list(as.character(tickData$Date)),FUN="min")
  Low = tmp[,2]
  
  # Close
  tmp = aggregate(x=tickData$Buy,by=list(as.character(tickData$Date)),FUN="tail",n=1)
  Close = tmp[,2]
  Date = tmp[,1]
  
  data.frame(Date,Open,High,Low,Close)
}