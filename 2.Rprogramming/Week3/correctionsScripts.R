makecachematrix<-function(x=matrix()){
  inv<-NULL
  set<-function(y){
    x<<-y
    inv<<-NULL
  }
  get<-function() {x}
  setinverse<-function(inverse) {inv<<-inverse}
  getinverse<-function() {inv}
  list(set=set,setinverse=setinverse,getinverse=getinverse)
  
}
cachesolve<-function(x,...){
  inv<-x$getinvese()
  message("getting cached data")
  return(inv)
}
mat<-x$get()
inv<-solve(mat,...)
x$setinverse(inv)
inv