## The makecachematrix function creates a special object that is a matrix
## makecachematrix() creates a set of functions and returns the functions
## within a list to the parent environment
## The set of functions are termed get(),set(),getinverse(),setinverse()
## 1st it initializes objects x and i
## 2nd it defines behaviours for objects of type makecachematrix
## 3rd it creates a new object by returning a list
## the function cacheSolve retrieves the inverse from an object of type makecachematrix()

## This function craetes a special object that is a matrix

makecachematrix<-function(x=matrix()){
  i<-NULL
  set<-function(y){
    x<<-y
    i<<-NULL
  }
  get<-function()x
  setinverse<-function(solve) i<<-solve
  getinverse<-function()i
  list(set = set,get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}


## makecachematrix is incomplete without the cacheSolve
## which is required to retrieve the inverse from an object type makecachematrix()

cacheSolve<-function(x, ...){
  i<-x$getinverse()
  if(!is.null(i)){
    message("getting cached data")
    return(i)
  }
  data<-x$get()
  i<-solve(data,...)
  x$setinverse(i)
  i
  ## return matrix that is the inverse of x
}
