pollutantmean <- function(directory, pollutant, id = 1:332) {

    all <- vector('numeric')
    for (i in id) {
        
        file_name <- sprintf("%s/%03d.csv", directory, i)
        file_data <- read.csv(file_name)[pollutant]
        invalid   <- is.na(file_data)
        all       <- c(all, file_data[!invalid])
    }
    mean(all)
}
