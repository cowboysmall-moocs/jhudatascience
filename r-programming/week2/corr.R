corr <- function(directory, threshold = 0) {

    all            <- vector("numeric")
    complete_data  <- complete("specdata")
    threshold_data <- complete_data[complete_data$nobs > threshold,]

    for (i in threshold_data$id) {

        file_name <- sprintf("%s/%03d.csv", directory, i)
        file_data <- read.csv(file_name)
        valid     <- complete.cases(file_data)
        complete  <- file_data[valid, ]
        sulfate   <- complete["sulfate"]
        nitrate   <- complete["nitrate"]
        all       <- c(all, cor(sulfate, nitrate))
    }
    all
}