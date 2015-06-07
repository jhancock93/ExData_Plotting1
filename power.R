#downloads and unzips the HAR dataset to the "UCI HAR Dataset" directory if the directory does not exist
get_power_data<- function()
{
    if (!file.exists("household_power_consumption.txt"))
    {
        download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "household_power_consumption.zip")
        unzip("household_power_consumption.zip")
    }
}

clean_power<-function()
{
    get_power_data()
    power = read.table("household_power_consumption.txt",
                       header=TRUE,
                       sep = ";", #';' is used as separator character
                       na.strings=c("?"), #'?' is used as NA value
                       colClasses = c(rep("character", 2), rep("numeric", 7))) #interpret first 2 columns as character, rest as numeric
    power$DateTime <- paste(as.character(power$Date), as.character(power$Time), sep=" ")
    #power$Date <- as.Date(as.character(power$Date), format = "%d/%m/%Y")
    power$DateTime <- strptime(power$DateTime, "%d/%m/%Y %H:%M:%S")
    powerSlice = subset(power, DateTime < strptime("2007-02-03", format="%Y-%m-%d") & DateTime >= strptime("2007-02-01", format="%Y-%m-%d"))
    powerSlice
}
