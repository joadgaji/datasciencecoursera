pollutantmean <- function(directory, pollutant, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'pollutant' is a character vector of length 1 indicating
  ## the name of the pollutant for which we will calculate the
  ## mean; either "sulfate" or "nitrate".
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return the mean of the pollutant across all monitors list
  ## in the 'id' vector (ignoring NA values)
  ## NOTE: Do not round the result!
  files <- list.files(directory, full.names=TRUE)
  data <- c()
  for(i in files){
    info <- read.csv(i)
    ##info <- info[!is.na(info[,pollutant, ]),]
    for(j in id){
      cur <- info[which(info[,"ID"] == j),]
      data <- c(data, cur[,pollutant])
    }
  }
  mean(data, na.rm = TRUE)
  
}

pollutantmean <- function(directory, pollutant, id = 1:332) {
   
           ## Get a list of filenames
      	filenames <- list.files(path=directory, pattern="*.csv")
          
            ## Initialize a vector to hold values
            vals <- vector()
  
            ## Loop over the passed id's
    		for(i in id) {
                  ## Pad the i to create a filename
                  filename = sprintf("%03d.csv", i)
                filepath <- paste(directory, filename, sep="/")
                ## Load the data
      			data <- read.csv(filepath)
                  ## Select our column
                  d <- data[,pollutant]
                ## Ignore NAs
        			d <- d[!is.na(d)]
                 ## append to our vector
                  vals = c(vals, d)
      	}
  
          ## Return the value rounded to 3 dec places
  		round(mean(vals, na.rm=TRUE), 3)
  } 

pollutantmean <- function(directory, pollutant, id = 1:332) {
  filenames <- sprintf("%03d.csv", id)
  filenames <- paste(directory, filenames, sep="/")
  ldf <- lapply(filenames, read.csv)
  df=ldply(ldf)
  # df is your list of data.frames
  mean(df[, pollutant], na.rm = TRUE)
}
