## This program creates two functions to allocate the inverse
## matrix.  

## This function is where the original and the inverse matrix
## will be setted.
makeCacheMatrix <- function(x = matrix()) {
  m <- NULL ## Set the m var to null at the beggining
  set <- function(y) { ## Set the x var for the new matrix and m to null
    x <<- y
    m <<- NULL
  }
  get <- function() x ## return the current matrix
  setinverse <- function(inverse) m <<- inverse ## Set the inverse matrix
  getinverse <- function() m ## Return the inverse matrix
  list(set = set, get = get, ## list of the factor of this function
       setinverse = setinverse,
       getinverse = getinverse)
}


## This function will call the solve function
## if the inversse
cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  m <- x$getinverse() ## Ececute the getInverse 
  if(!is.null(m)) { ## If the m var in nos null return the m 
    message("getting cached data")
    return(m)
  }
  data <- x$get() ## Obtain the original matrix
  m <- solve(data, ...) ## calculate the inverse matrix
  x$setinverse(m) ## Save the inverse matrix
  m 
}
