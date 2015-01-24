complete <- function(directory, id = 1:332) {

    complete <- vector('integer')
    for (i in id) {
        
        file_name <- sprintf("%s/%03d.csv", directory, i)
        file_data <- read.csv(file_name)
        valid     <- complete.cases(file_data)
        complete  <- c(complete, nrow(file_data[valid, ]))
    }
    data.frame(id = id, nobs = complete)
}
