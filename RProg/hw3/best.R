best <- function(state, outcome) {
  ## Read outcome data
  data <- read.csv("outcome-of-care-measures.csv")
  
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
  
  ## Return hospital name in that state with lowest 30-day death
  ## rate
  data[,cout[outcome]] <- suppressWarnings(as.numeric(as.character(data[,cout[outcome]])))
  dataSet <- data[data$State == state, c(2, cout[outcome])]
  ##minVal <- min(dataSet[,2], na.rm = TRUE)
  ##dataSort <- sort(dataSet[which(dataSet[,2] == minVal),1])
  dataSort <- sort_by_columns(dataSet, 2,1)
  c(as.character(dataSort[1,1]))
}

sort_by_columns <- function (data, col1, col2){
  data <- data[complete.cases(data),] 
  orderdata <- data[order(data[,col1],data[,col2]),]
  return(orderdata)
}