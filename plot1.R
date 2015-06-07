library(graphics)
source("power.R")

plot1 <- function(data)
{
    dev <- png("plot1.png", width=480, height=480)
    hist(as.numeric(data$Global_active_power), xlab = "Global Active Power (kilowatts)", col = "red", main = "Global Active Power")
    dev.off()
}

#uncomment to automatically grab the data and generate the plot.
#However, it makes more sense to first set data = clean_power() and then call plot1(data), plot2(data), plot3(data), etc.
#data = clean_power()
#plot1(data)
