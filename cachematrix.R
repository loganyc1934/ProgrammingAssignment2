## Usage: call makeCacheMatrix(your_matrix), assign it to an object, 
## and pass it into cacheSolve(obj) to obtain the inverse. 

## makeCacheMatrix() takes in a matrix, returns a list of functions that
## set, get the matrix and its inverse

makeCacheMatrix <- function(x = matrix()) {
        inverse <- NULL
        set <- function(y) {
                x <<- y
                inverse <<- NULL
        }
        get <- function() x
        setinv <- function(inv) inverse <<- inv
        getinv <- function() inverse
        list(set = set, get = get,
             setinv = setinv,
             getinv = getinv)

}


## pass the object obtained from makeCacheMatrix() into the one below to get the inverse,
## if inverse is already cached, get the cached data; if not, compute it

cacheSolve <- function(x, ...) {
        inverse <- x$getinv()
        if(!is.null(inverse)) {
                message("getting cached data")
                return(inverse)
        }
        data <- x$get()
        inverse <- solve(data, ...)
        x$setinv(inverse)
        inverse
        ## Return a matrix that is the inverse of 'x'
}
