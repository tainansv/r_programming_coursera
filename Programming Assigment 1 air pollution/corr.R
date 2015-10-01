corr <- function(directory, threshold = 0){
    files <- list.files(directory, full.names = TRUE)
    c <- vector()
    for(i in 1:332){
        f <- read.csv(files[i])
        good <- complete.cases(f)
        nc <- nrow(f[good,])
        if (nc > threshold) {
            c <- c(c, cor(f[good,]$nitrate, f[good,]$sulfate))
        }
    }
    c
}