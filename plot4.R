library(graphics)
source("power.R")
source("plot1.R")
source("plot2.R")
source("plot3.R")

#given the properly formatted data.frame, produces plot4 to match the image from the assignment
plot4 <- function(power)
{
    dev <- png("plot4.png", width=480, height=480)
    layout(matrix(c(1,2,3,4), 2, 2, byrow=TRUE))
    plot(power$DateTime, power$Global_active_power, type="l", ylab = "Global Active Power", xlab="")
    plot(power$DateTime, power$Voltage, type="l", ylab = "Voltage", xlab="datetime")
    plot(power$DateTime, power$Sub_metering_1, type="l", main="", ylab = "Energy sub metering", xlab="")
    lines(power$DateTime, power$Sub_metering_2, col="red")
    lines(power$DateTime, power$Sub_metering_3, col="blue")
    legend("topright", bty="n", lty=1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    plot(power$DateTime, power$Global_reactive_power, type="l", ylab = "Global_reactive_power", xlab="datetime")
    dev.off()
}

#uncomment to automatically grab the data and generate the plot.
#However, it makes more sense to first set data = clean_power() and then call plot1(data), plot2(data), plot3(data), etc.
#data = clean_power()
#plot4(data)
