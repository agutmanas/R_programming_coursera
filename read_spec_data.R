read_one_csv <- function(directory, sensor_id=1) {
    file_name <- sprintf("%03d.csv", sensor_id)
    file_path <- file.path(directory,file_name)
    sensor_data <- NULL
    if (file.exists(file_path)){
        sensor_data <- read.csv(file_path)
    } else {
        print(paste("No such file", file_path))
    }
    sensor_data
}

read_all_csvs <- function(directory, id_vect=id) {
    full_data <- NULL
    for (sensor_id in id_vect) {
        full_data <- rbind(full_data, read_one_csv(directory, sensor_id))
    }
    full_data
}
