myCum <- function(n=1){
  cum <- 0
  for(i in 1:n){
    cum <- cum + i
  }
  return(cum)
}

myCumProd <- function(n=1){
  cum <- 1
  for(i in 1:n){
    cum <- cum * i
  }
  return(cum)
}

