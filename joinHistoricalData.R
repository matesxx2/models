joinHistoricalData <- function(data, n=1, resultId=NULL ,colsId=NULL){
  
  # prepare indices
  if(is.null(resultId)){resultId=ncol(data)}
  if(is.null(colsId)){
    colsId = 1:ncol(data)
    colsId <- colsId[-resultId]
  }
  
  
  for(i in 1:n){
    if(i==1){
        dataRet = as.data.frame(data[(n+1):nrow(data),resultId])
        colnames(dataRet)<-c("y")
    }
    dataRet=cbind(dataRet, data[i:(i+nrow(dataRet)-1),colsId])
  }
  colnames(dataRet)<-c("y",paste("x",1:(ncol(dataRet)-1),sep=''))
  dataRet
}