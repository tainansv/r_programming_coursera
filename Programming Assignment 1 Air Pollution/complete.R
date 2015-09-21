complete <- function(directory, id = 1:332){
    files <- list.files(directory, full.names = TRUE)
    data <- data.frame()
    for(i in id){
        f <- read.csv(files[i])
        good <- complete.cases(f)
        nc <- nrow(f[good,])
        df <- data.frame(i, nc)
        data <- rbind(data, df)
    }
    colnames(data) <- c("id", "nobs")
    data
}