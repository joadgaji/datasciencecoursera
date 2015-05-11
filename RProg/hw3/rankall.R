rankall <- function(outcome, num = "best") {
  ## Read outcome data
  dataOrigin <- read.csv("outcome-of-care-measures.csv")
  
  cout <- c("heart attack" = 11,  "heart failure" = 17, "pneumonia"= 23)
  cvalid <- cout[outcome]
  if(is.na(cvalid)){
    stop("invalid outcome")
  }
  
  ## For each state, find the hospital of the given rank
  states <- levels(dataOrigin[,7])
  
  hospital <- sapply(states, rankhospital, outcome, num, data = dataOrigin)
  data.frame(hospital, state = states)
  ## Return a data frame with the hospital names and the
  ## (abbreviated) state name
}

