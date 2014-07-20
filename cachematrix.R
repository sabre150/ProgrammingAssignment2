## Put comments here that give an overall description of what your
## functions do


## This function returns a list of 4 functions that store and retrive a matrix
## and its' inverse.  Ths values are stored in a different invornment and are
## are therefore only accessable via the functions returned in the list.

makeCacheMatrix <- function(x = matrix()) {
    
    # Create an empty variable to hold  the matrix inverse in this environment.
    # This is neccessary in order to keep xInv from being created in the  global
    # environment.  The '<<-' operator will search parent environments untill 
    # the object (in this case xInv) is found.  If the object is not found then 
    # it will be created in the global environment, which we do not want.
    xInv <- NULL
    
    # This function stores a matrix in x and sets xInv back to NULL
    setMatrix <- function(y) {
        x <<- y
        xInv <<- NULL
    }

    # This function retrives the matrix stored in x. 
    getMatrix < function() {
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
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
}
