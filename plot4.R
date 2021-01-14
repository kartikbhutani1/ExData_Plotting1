#Plot 4

#Allowing multiple plots 
par(mfrow=c(2,2))

#Common function to name x-axis intervals.
show_xaxis_names <- function(data) {
  rows = nrow(data)
  axis(side=1,at=c(1,rows/2,rows),
       labels=c("Thu", "Fri", "Sat"))
}

#Loading complete data
data <- read.csv("../household_power_consumption.txt", header = T, 
                 sep = ";", na = "?")
data$Date <- format(as.Date(data$Date, format="%d/%m/%Y"), "%d/%m/%Y")

#Subset data
data <- subset(data, (Date == "01/02/2007" | Date == "02/02/2007"))

#Date time conversion
data$Datetime <- strptime(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S")

#Plot 4.a
plot(data$Global_active_power, data$DateTime, type="l", 
     xlab = "", ylab = "Global Active Power", xaxt="n")
show_xaxis_names(data)

#Plot 4.b
plot(data$Voltage, data$DateTime, type="l", 
     xlab = "datetime", ylab = "Voltage", xaxt="n")
show_xaxis_names(data)

#Plot 4.c
plot(data$Sub_metering_1, data$DateTime, type="l", 
     xlab = "", ylab = "Energy sub metering", xaxt="n")
lines(data$Sub_metering_2, data$DateTime, col="red")
lines(data$Sub_metering_3, data$DateTime, col="blue")

legend("topright", inset=c(0,-0.15), c("Sub_metering_1","Sub_metering_2",
                "Sub_metering_3"), col = c("black","red","blue"),
       lty=1, y.intersp=0.17,x.intersp=0.17, 
       text.width = 900, bty='n', cex = 0.7, seg.len = 1)

show_xaxis_names(data)

#Plot 4.d
plot(data$Global_reactive_power, data$DateTime, type="l", 
     ylab="Global_reactive_power", xlab = "datetime", xaxt="n")
show_xaxis_names(data)

#Saving the plot to png file
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()