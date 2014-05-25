## This fuction prevents the repeated calculation of a inverse of a matrix by cacheing the inverse
## of a matrix that has already been calculated. This program displays the cached solution if the 
## input variables remains same

## This function creates a matrix and stores it in a variable "getmatrix". It allows you to create
## a new matrix after a matrix has aready been created with the "setmatrix" variable. It also 
## interacts with "cacheSolve" function with the "setmatrix" variable.

makeCacheMatrix <- function(x = matrix()) {
  
  m <- matrix()
  set <- function(y) {
    x <<- y
    m <<- matrix()
  }
  get <- function() x
  setmatrix <- function(matrix) m <<- matrix
  getmatrix <- function() m
  list(set = set, get = get,
       setmatrix = setmatrix,
       getmatrix = getmatrix)
}


## The "cacheSolve" function checks if the inverse of a matrix has already been created. If not,
## it inverses the matrix and stores it in "setmatrix" variable for the "makeCacheMatrix" function

cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  m <- x$getmatrix()
  if(!is.na(m[1,1])) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- solve(data, ...)
  x$setmatrix(m)
  m
}
