## This function reduce the computing time to calculete inversse matrix in a loop function


## This function creates a list of functions uses to generate de matrix an calculete de inverse, and save it into de cache

makeCacheMatrix <- function(x = matrix()) {
  inverse <- NULL
  set <- function(y){
    x <<- y 
    inverse <<- NULL
  }
  get <- function() x
  setinverse <- function(solve) inverse <<- solve 
  getinverse <- function() inverse
  list(set = set, get=get,
       setinverse=setinverse,
       getinverse=getinverse)
}



## This function use de previus list of functions to calculete de inverse of the matrix and save it into the cache. 
## The next ejecution of this function returns the inverese value save in cache in previous execution.
cacheSolve <- function(x, ...) {
  inverse <- x$getinverse()
  if(!is.null(inverse)) {
    message("getting cached data")
    return(inverse)
  }
  data <- x$get()
  inverse <- solve(data, ...)
  x$setinverse(inverse)
  inverse

  ## Return a matrix that is the inverse of 'x'
}
