best <- function(state, outcome) {

    ## Read outcome data
    outcome_data <- read.csv('data/outcome-of-care-measures.csv', colClasses = 'character')
    outcome_data[,11] <- suppressWarnings(as.numeric(outcome_data[,11]))
    outcome_data[,17] <- suppressWarnings(as.numeric(outcome_data[,17]))
    outcome_data[,23] <- suppressWarnings(as.numeric(outcome_data[,23]))

    ## Check that state and outcome are valid
    states   <- unique(outcome_data$State)
    if (!state %in% states) stop("invalid state")

    outcomes <- c('heart attack', 'heart failure', 'pneumonia')
    if (!outcome %in% outcomes) stop("invalid outcome")

    ## Return hospital name in that state with lowest 30-day death
    ## rate
    state_stats <- subset(outcome_data, State==state)

    if (outcome == 'heart attack')  column <- 11
    if (outcome == 'heart failure') column <- 17
    if (outcome == 'pneumonia')     column <- 23

    state_stats <- state_stats[order(state_stats[, column], state_stats[, 2]),]
    state_stats[1, 2]
}
