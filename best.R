##this is testing the upload function though the csv to process is not here
best <- function(state, outcome) {
  ## Read outcome data
  ## Check that state and outcome are valid
  ## Return hospital name in that state with lowest 30-day death
  ## rate
    ##if (as.numeric(bestHosp)==0){print("wrong outcome")}
  
  
hospData <- read.csv("outcome-of-care-measures.csv",colClasses = "character")

if(state%in%hospData[,7]==FALSE){stop("invalid state")}

if(outcome%in%c("heart attack", "heart failure", "pneumonia")==FALSE){stop("invalid outcome")}

hospData<-data.frame(hospData[,2],hospData[,7],as.numeric(hospData[,11]),as.numeric(hospData[,17]),as.numeric(hospData[,23]))
hospData<-subset(hospData,hospData[,2]==state)
bestHosp<-numeric(0)

  if(outcome=="heart attack"){bestHosp<-which.min(hospData[,3])}
  
  if(outcome=="heart failure"){bestHosp<-which.min(hospData[,4])}
    
  if(outcome=="pneumonia"){bestHosp<-which.min(hospData[,5])}
##if (is.data.frame(hospData)==0){print("wrong state")}

hospData[as.numeric(bestHosp),1]

}

