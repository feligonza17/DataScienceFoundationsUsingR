
# Quiz Week 4 -------------------------------------------------------------


# Question 1 --------------------------------------------------------------



outcome <- read.csv("2.Rprogramming/Week4/outcome-of-care-measures.csv", colClasses = "character")
head(outcome)
#Histogram
outcome[, 11] <- as.numeric(outcome[, 11])
hist(outcome[, 11])


# Question 2 --------------------------------------------------------------

#Read data
base <-
  read.csv("2.Rprogramming/Week4/outcome-of-care-measures.csv",
           colClasses = "character")


best <- function(state, outcome) {

  #Change names of outcome variables
  names(base)[names(base) == "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack"] <-
    "heart attack"
  names(base)[names(base) == "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure"] <-
    "heart failure"
  names(base)[names(base) == "Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia"] <-
    "pneumonia"
  
  if(!any(names(base[c(11,17,23)]) %in% outcome)){
    print("invalid outcome")
    stop()
  } #Checks if the outcome is one of the three options
  if(!any(unique(base[,"State"]) %in% state)){
    print("invalid state")
    stop()
  } #Checks if the State is valid
  
  resultado <- base[!base[,outcome]=="Not Available",] #Eliminate invalid cases from outcome
  estado <- resultado[resultado[, "State"] == state,] #Filter the state of input
  min_num <- min(as.numeric(estado[,outcome])) #Find minimum of condition
  final <- estado[as.numeric(estado[,outcome])==min_num,] #Select row that meet that condition
  sort(final[,"Hospital.Name"])
  

}




