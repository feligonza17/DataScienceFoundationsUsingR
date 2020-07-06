
# The first function, `makeCacheMatrix` creates a list containing a function to
# 
# 1.  set the value of the matrix
# 2.  get the value of the matrix
# 3.  set the value of the inverse of the matrix
# 4.  get the value of the inverse of the matrix




makeCacheMatrix <- function(x = matrix()) {

    mat_inv <- NULL
    set <- function(y) { #Set the value of the matrix
      x <<- y
      mat_inv <<- NULL
    }
    get <- function() x #Get the value of the matrix
    setmat <- function(temp) mat_inv <<- temp # sets the value of the inverse of the matrix
    getmat <- function() mat_inv #gets the value of the inverse of the matrix
    list(set = set, get = get,
         setmat = setmat,
         getmat = getmat) #Prepares the list to pass to the cacheSolve()
  
  
}


# The following function calculates the inverse of the matrix of the list
# created with the above function. However, it first checks to see if the
# inverse has already been calculated. If so, it `get`s the inverse from the
# cache and skips the computation. Otherwise, it calculates the inverse of
# the data and sets the value of the inverse in the cache via the `getmat`
# function. 

cacheSolve <- function(x, ...) {
  
    mat_inv <- x$getmat() # gets the value that was calculated
    if(!is.null(mat_inv)) {
      message("getting cached matrix")
      return(mat_inv) #If there is a value stored it prints it
    }
    data <- x$get()
    mat_inv <- solve(data, ...)
    x$setmat(mat_inv)
    mat_inv #If there is no value stored then it calculates the inverse of the matrix and prints it
    
}


#Finsih of assignment