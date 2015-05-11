corr <- function(directory, threshold = 0) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  
  ## Return a numeric vector of correlations
  ## NOTE: Do not round the result!
  files <- list.files(directory,  full.names=TRUE)
  comp <- complete(directory)
  data <- c()
  for(i in files){
    info <- read.csv(i)
    if(comp[info[1,4],2] > threshold){
      ##print(info[1,4])
      infoComp <- complete.cases(info)
      infoComp <- info[infoComp,]
      corTemp <- cor(infoComp[,2], infoComp[,3])
      data <- c(data, corTemp)
      ##print(corTemp)
    }
        
  }
  data
}