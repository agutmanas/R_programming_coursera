# pollutantmean.R
# R Programming Coursera assignment week 2

pollutantmean <- function(directory, pollutant, id=1:332) {
    ## "directory" is the location of the CSV files containing the data
    ## The data is arranged in these columns:
    ## "Date","sulfate","nitrate","ID"
    ## A number of NA values are present in each/most files.
    ## "pollutant" is either sulfate or nitrate
    ## "id" is a list of integers (IDs of pollution sensors)
    

    full_data <- read_all_csvs(directory, id)
    if (!(pollutant %in% c("sulfate", "nitrate"))) { 
        break
    }
    mean(full_data[[pollutant]], na.rm = TRUE)
}