corr <- function(directory, threshold=0){
    
    complete_cases <- complete(directory)
    
    above_threshold <- complete_cases$nobs > threshold
    ids_to_check <- complete_cases[["id"]][above_threshold]
    
    #headprint(ids_to_check)
    
    correlations <- c()
    
    for (sensor_id in ids_to_check) {
        sensor_data <- read_one_csv(directory, sensor_id)
        c_i <- cor(x=sensor_data$sulfate,y=sensor_data$nitrate,use="complete.obs")
        correlations <- c(correlations, c_i)
        sensor_data <- NULL
    }
    
    correlations

}