best <- function(state, outcome) {
    
    ## read csv file
    data <- read.csv("outcome-of-care-measures.csv", colClasses = "character", na.strings = "Not Available")
    
    ##  Check that state and outcome are valid
    validOutcome <- c("heart attack", "heart failure", "pneumonia")
    if (!any(data$State == state)) {
        stop("Invalid state.")
    }
    if ((outcome %in% validOutcome) == FALSE) {
        stop("Invalid Outcome.")
    }
    
    ## Return hospital name in that state with lowest 30-day death rate
    
    outCol <- NULL
    if (outcome == "heart attack") {
        outCol <- 11
    }
    else if (outcome == "heart failure") {
        outCol <- 17
    }
    else if (outcome == "pneumonia") {
        outCol <- 23
    }
    
    ## Remove NA
    data <- subset(data, State == state)
    ok <- complete.cases(data)
    data <- data[ok,]
    
    i <- which.min(data[,outCol])
    as.character(data[i,2])
}