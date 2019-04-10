complete <- function(directory, id=1:332){
    full_data <- read_all_csvs(directory, id)
    
    complete_rows <- !is.na(full_data$nitrate) & !is.na(full_data$sulfate)
    
    clean_data <- full_data[complete_rows,]
    
    sensor_counts <- c()
    for (index in 1:length(id)) {
        sensor_id <- id[index]
        sensor_counts[index] <- sum(clean_data$ID == sensor_id)
    }
    
    data.frame(id=id, nobs=sensor_counts)
    
}