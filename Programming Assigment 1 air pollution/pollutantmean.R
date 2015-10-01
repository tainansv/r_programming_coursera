pollutantmean <- function(directory, pollutant, id = 1:332){
    files <- list.files(directory, full.names = TRUE)
    data <- data.frame()
    for(i in id){
        data <- rbind(data, read.csv(files[i]))
    }
    x <- mean(data[[pollutant]], na.rm = TRUE)
}