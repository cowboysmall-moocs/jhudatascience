## This file contains two functions intended to be used to cache the 
## relatively expensive operation of finding the inverse of a square 
## invertible matrix (O(n^2))
## 
## makeCacheMatrix: creates a special matrix object that can cache its
## inverse.
## 
## cacheSolve: computes the inverse of the special matrix returned by
## makeCacheMatrix above. If the inverse has already been calculated 
## (and the matrix has not changed), then cacheSolve should retrieve 
## the inverse from the cache.


## makeCacheMatrix creates a special matrix, which is actually a list,
## that manages a matrix and it's cached inverse

makeCacheMatrix <- function(x = matrix()) {

    cached <- NULL

    set <- function(y) {

        x      <<- y
        cached <<- NULL
    }
    get <- function() x

    setInverse <- function(inverse) cached <<- inverse
    getInverse <- function() cached

    list(set = set, get = get, setInverse = setInverse, getInverse = getInverse)
}


## cacheSolve returns the cached inverse if it exists
## or creates it, and caches it, if it doesn't exist

cacheSolve <- function(x, ...) {

    ## Return a matrix that is the inverse of 'x'
    cached <- x$getInverse()
    if(!is.null(cached)) {

        message("getting cached inverse matrix")
        return(cached)
    }

    matrix  <- x$get()
    inverse <- solve(matrix, ...)

    x$setInverse(inverse)
    inverse
}
