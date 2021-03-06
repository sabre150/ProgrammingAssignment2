## The makeCacheMatrix function takes an invertible marix and returns a list
## of functions.
##
## The cacheSolve function takes the list returned by makeCacheMatrix and
## returns the inverse of the matrix supplied to the makeCacheMatrix function.
## The inverse is cached and is only re-calculated if the cached matrix has
## changed.
##
## Example:
## x <- makeCacheMatrix(matrix(1:4, nrow=2))
## cacheSolve(x)


## The makeCacheMatrix function takes and invertible matrix as a parameter.
## The matrix is stored along with a matrix inverse value that is initialized as
## NULL.  The function returns a list of 4 functions that get and set the matrix
## and matrix inverse values.  The values are stored in a different invronment
## and are therefore only accessable via the functions returned in the list.

makeCacheMatrix <- function(x = matrix()) {
    
    # Create an empty variable to hold  the matrix inverse in this environment.
    # This is neccessary in order to keep xInv from being created in the  global
    # environment.  The '<<-' operator will search parent environments until 
    # the object (in this case xInv) is found.  If the object is not found then 
    # it will be created in the global environment, which we do not want.
    xInv <- NULL
    
    # This function stores a matrix in x and sets xInv back to NULL
    setMatrix <- function(y) {
        x <<- y
        xInv <<- NULL
    }

    # This function retrives the matrix stored in x. 
    getMatrix <- function() {
        x
    }
    
    # This function sets xInv
    setInverse <- function(inv) {
        xInv <<- inv
    }
    
    # This function retrieves xInv
    getInverse <- function() {
        xInv
    }
    
    list(setMatrix = setMatrix, getMatrix = getMatrix, setInverse = setInverse,
         getInverse = getInverse)
}


## The cacheSolve function takes a list of functions generated by the
## makeCacheMatrix function, and returns the inverse of the matrix saved
## by the makeCacheMatrix function.

cacheSolve <- function(x, ...) {
    ## Return a matrix that is the inverse of 'x'
    
    inv <- x$getInverse()
    
    # The setMatrix fuction sets the inverse value to NULL, so anytime a matrix  
    # is cached (i.e. changed) via setMatrix, the inverse value will be NULL.
    if (!is.null(inv)) {
        message("\nRetrieving cached inverse matrix.\n")
        return(inv)
    }
    
    m <- x$getMatrix()
    message("\nSolving for inverse matrix.\n")
    inv <- solve(m)
    x$setInverse(inv)
    inv
}
