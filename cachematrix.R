## Put comments here that give an overall description of what your
## functions do

## makeCacheMatrix returns list of a functions that cache the matrix inverse operations
## 

makeCacheMatrix <- function(x = matrix()) {
     slv <- NULL
     set <- function(value) {
         x   <<- value
         slv <<- NULL
     }
     get <- function() {x}
     setSolve <- function(value) {
         slv <<- value
     }
     getSolve <- function() {slv}
     list(set=set, get=get, setSolve=setSolve, getSolve=getSolve)
}


## cacheSolve function works with data provided by makeCacheMatrix
##    Example of usage:
##       a <- matrix(c(1:4), 2)
##       a_c <- makeCacheMatrix( a )
##       cacheSolve( a_c )
##       cacheSolve( a_c )
##
cacheSolve <- function(x, ...) {
     ## Return a matrix that is the inverse of 'x'
     slv <- x$getSolve()
     if (!is.null(slv)) {
         message("getting the cached value")
         return(slv)
     }
     data <- x$get()
     slv  <- solve(data)
     x$setSolve(slv)
     slv
}

