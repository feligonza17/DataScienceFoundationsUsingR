
#Read data
base <-
  read.csv("2.Rprogramming/Week4/outcome-of-care-measures.csv",
           colClasses = "character")


rankall <- function(outcome, num = "best") {
  
  #Change names of outcome variables
  names(base)[names(base) == "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack"] <-
    "heart attack"
  names(base)[names(base) == "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure"] <-
    "heart failure"
  names(base)[names(base) == "Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia"] <-
    "pneumonia"
  
  if(!any(names(base[c(11,17,23)]) %in% outcome)){
    stop("invalid outcome")
  } #Checks if the outcome is one of the three options
  
  resultado <- base[!base[,outcome]=="Not Available",] #Eliminate invalid cases from outcome
  num <-
    ifelse(num == "best", 1, 
           ifelse(num == "worst", nrow(resultado), 
                  ifelse(num>nrow(resultado), NA, num)))
  if(is.na(num)){
    print(NA)
    stop()
  } #Checks if the outcome is one of the three options
  
  resultado[, outcome] <- as.numeric(resultado[, outcome])
 
  d1 <- resultado[do.call(order, resultado[c("State", outcome, "Hospital.Name")]),]  
  row.names(d1) <- NULL
  d1$rank <- with(d1, ave(seq_along(State), State, FUN = seq_along))
  
  d1[d1[,"rank"]==num, c("Hospital.Name", "State")]


}
