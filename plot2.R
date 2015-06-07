library(graphics)
source("power.R") #power.R contains the code for reading and cleaning the data.

plot2_draw <- function(data)
{
    plot(power$DateTime, power$Global_active_power, type="l", ylab = "Global Active Power (kilowatts)", xlab="")
}

plot2 <- function(data)
{
    dev <- png("plot2.png", width=480, height=480)
    plot2_draw
    dev.off()
}

#uncomment to automatically grab the data and generate the plot.
#However, it makes more sense to first set data = clean_power() and then call plot1(data), plot2(data), plot3(data), etc.
#data = clean_power()
#plot2(data)
