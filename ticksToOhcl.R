ticksToOhcl<-function(tickData,timeFrameSize=60, timeFormat='%Y%m%d %H:%M:%OS'){
  
  # convert factors to date object
  tickData$Date = strptime(tickData$Date, timeFormat)
  
  # round date to timeFrameSize
  # all date from the same ohlc frame has to have 
  # same date for later aggregation
  #
  # now hardcoded 30s size of frame
  # tickData$Date$sec = floor(tickData$Date$sec/30)*30
  tickData$Date$sec = rep(0,nrow(tickData))
  tickData$Date$min = floor(tickData$Date$min/2)*2
  
  # http://stackoverflow.com/questions/12064202/using-aggregate-for-multiple-aggregations
  #
  # Since there is a bug? (2013-08-08) in aggregate 
  # you can not save the output of aggregate(data.frame) in a object of data.frame class. 
  #To get a proper result you have to:
  # object <- as.data.frame(as.list(aggregate(data.frame)))
  #
  res = as.data.frame(as.list(aggregate(tickData$Buy,
                  by=list(as.character(tickData$Date)),
                  FUN=function(x) c(Open=head(x,1), High=max(x), Low=min(x), Close=tail(x,1)))))
  
  colnames(res)<-c("Date", "Open", "High", "Low", "Close")
  res
}
