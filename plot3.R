library(graphics)
source("power.R") #power.R contains the code for reading and cleaning the data.

plot3_draw <- function(power)
{
    plot(power$DateTime, power$Sub_metering_1, type="l", main="", ylab = "Energy sub metering", xlab="")
    lines(power$DateTime, power$Sub_metering_2, col="red")
    lines(power$DateTime, power$Sub_metering_3, col="blue")
    legend("topright", lty=1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
}

plot3 <- function(power)
{
    dev <- png("plot3.png", width=480, height=480)
    plot3_draw(power)
    dev.off()
}

#uncomment to automatically grab the data and generate the plot.
#However, it makes more sense to first set data = clean_power() and then call plot1(data), plot2(data), plot3(data), etc.
#data = clean_power()
#plot3(data)
