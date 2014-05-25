## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL # setting the object that is to store model that find inverse of matrix      
  set <- function(y) { # using this function we can change x-matrix values
    x <<- y
    m <<- NULL
  }
  get <- function() x # returning matrix
  setMatrix <- function(solve) m <<- solve # storing model into object 
  getMatrix <- function() m # returning the model
  list(set = set, get = get,
       setMatrix = setMatrix,
       getMatrix = getMatrix) # returning the list from this function, so that we can access previous functions using $ operator
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  m <- x$getMatrix() # getting model that finds inverse of matrix with given matrix
  if(!is.null(m)) { # checking if that inverse of matrix is already calculated
    message("getting cached data")
    return(m) # if so it returns cached calculation so that no need to calculate inverse again
  }
  data <- x$get() # the inverse is not calculated for the matrix, hence getting the matrix 
  m <- solve(data) # calculating the inverse of matrix
  x$setMatrix(m) # setting the result into x object
  m # returning inverse of matrix
}
