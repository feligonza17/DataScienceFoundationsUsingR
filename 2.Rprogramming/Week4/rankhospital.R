
#Read data
base <-
  read.csv("2.Rprogramming/Week4/outcome-of-care-measures.csv",
           colClasses = "character")


rankhospital <- function(state, outcome, num="best") {
  
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
  if(!any(unique(base[,"State"]) %in% state)){
    stop("invalid state")
  } #Checks if the State is valid
  
  resultado <- base[!base[,outcome]=="Not Available",] #Eliminate invalid cases from outcome
  estado <- resultado[resultado[, "State"] == state,] #Filter the state of input
  estado[,"Rank"] <- NA #Create Rank Variable
  order.scores<-order(as.numeric(estado[,outcome]),estado[,"Hospital.Name"]) #Create variable that orders
  estado[,"Rank"][order.scores] <- 1:nrow(estado) #Insert rank in data
  
  num <-
    ifelse(num == "best", 1, 
           ifelse(num == "worst", nrow(estado), 
                  ifelse(num>nrow(estado), NA, num)))
  
  if(is.na(num)){
    print(NA)
    stop()
  } #Checks if the outcome is one of the three options
  
  estado[estado[,"Rank"]==num,"Hospital.Name"] #Extract hospital with the rank
  
}
