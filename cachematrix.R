## Put comments here that give an overall description of what your
## functions do
## setm- set the value of matrix
## getm- get the value of matrix
## setminverse- get the inverse of a matrix (cached) by a function
## getminverse-get the inverse of matrix

## Write a short comment describing this function
## Creating a matrix object a and few other subfunctions in it

makeCacheMatrix <- function(a = matrix()) {
  # nothing is cached at the begining, so cachestore is set to NULL
  cachestore <-NULL
  #storing matrix a in b
  setm <- function(b) {
    a <<- b
    cachestore <<- NULL
}
#returning the stored matrix
getm <- function() {
  a
}
# cache or inverse the argument
setminverse <- function(solve) {
  cachestore <<- solve
}
#to get the cached value
getminverse <- function() {
  cachestore
}

list(set = setm, get = getm,
     setinverse = setminverse,
     getinverse = getminverse)
}
  
## Write a short comment describing this function
## Below code is to calculate the inverse of special matrix created above
cacheSolve <- function(a, ...) {
        ## Return a matrix that is the inverse of 'x'
  cachestore <- a$getinverse()
  if(!is.null(cachestore)) {
    message("getting cached data")
    return(cachestore)
  }
  data <- a$get()
  cachestore <- solve(data, ...)
  a$setinverse(cachestore)
  return(cachestore)
}






 

