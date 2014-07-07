ticksToOhcl<-function(tickData,timeFrameSize=30){
  #converts tick data to ohcl format(open,high,close,low)
  #
  #tickData has to have columns: 
  #"date" - format "yyyymmdd hh:mm:ss.xxx (where xxx are miliseconds)
  #"buy" and "sell"
  #
  
#   > mydate = strptime(b,"%Y%m%d %H:%M:%S.%OS")
#   > mydate$sec
#   [1] 2
#   > mydate
#   [1] "2014-05-01 00:00:02 CEST"
#   > mydate$sec
#   [1] 2
#   > mydate$min
#   [1] 0
#   > mydate$hour
#   [1] 0
#   > 
  
  lastTick = NULL
  
  for(i in 1:nrow(tickData)){
    tick = tickData[i,]
    
    
  }
  
}