## The makeCacheMatrix function creates a special "matrix",
## which is really a list containing a function to
## 1. set the value of the matrix
## 2. get the value of the matrix
## 3. set the value of the inverse of the matrix
## 4. get the value of the inverse of the matrix

## The function below returns a list of functions.

makeCacheMatrix <- function(x = matrix()) {
  cache <- NULL
  setMatrix <- function(y){
    x <<- y
    cache <<- NULL
  }
  
  getMatrix <- function() {
    x
  }
  
  setInverse <- function(inverse) {
    cache <<- inverse
  }
  
  getInverse <- function() {
    cache
  }
  list(setMatrix = setMatrix, getMatrix = getMatrix, setInverse = setInverse, getInverse = getInverse)
}



##The bottom function calculates the inverse of the special matrix created with the above function

cacheSolve <- function(x, ...) {
  inverse <- x$getInverse()
  if(!is.null(inverse)) {
    message("getting cached data")
    return(inverse)
  }
  
  data <- x$getMatrix() 
  inverse <- solve(data)
  x$setInverse(inverse)
  
  inverse
}
