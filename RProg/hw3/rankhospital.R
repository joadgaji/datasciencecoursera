rankhospital <- function(state, outcome, num = "best", data = NULL) {
  ## Read outcome data
  if(is.null(data)){
    data <- read.csv("outcome-of-care-measures.csv")
  }
  
  ## Check that state and outcome are valid
  lenData = nrow(data[data$State == state,])
  if(lenData <= 0){
    stop("invalid state")
  }
  
  cout <- c("heart attack" = 11,  "heart failure" = 17, "pneumonia"= 23)
  cvalid <- cout[outcome]
  if(is.na(cvalid)){
    stop("invalid outcome")
  }
  
  ## Return hospital name in that state with the given rank
  ## 30-day death rate
  data[,cout[outcome]] <- suppressWarnings(as.numeric(as.character(data[,cout[outcome]])))
  dataSet <- data[data$State == state, c(2, cout[outcome])]
  dataSet <- dataSet[complete.cases(dataSet),] 
  if(num == "best"){
    find_hospital_rank(dataSet,2,1,1)
  }else if(num == "worst"){
    find_last_hospital(dataSet,2,1)
  }else{
    find_hospital_rank(dataSet,2,1,num)
  }
  
}


find_hospital_rank <- function(data,col1,col2,rank){
  orderdata <- data[order(data[,col1], data[,col2]),]
  return(as.character(orderdata[rank,1]))
}

find_last_hospital <- function(data,col1,col2){
  orderdata <- data[order(data[,col1], data[,col2]),]
  return(as.character(orderdata[nrow(orderdata),1]))
}


