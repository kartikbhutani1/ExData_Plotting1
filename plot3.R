#Loading complete data
data <- read.csv("../household_power_consumption.txt", header = T, 
                 sep = ";", na = "?")
data$Date <- format(as.Date(data$Date, format="%d/%m/%Y"), "%d/%m/%Y")

#Subset data
data <- subset(data, (Date == "01/02/2007" | Date == "02/02/2007"))

#Date time conversion
data$Datetime <- strptime(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S")

#Plot 3
plot(data$Sub_metering_1, data$DateTime, type="l", 
     xlab = "", ylab = "Energy sub metering", xaxt="n")
lines(data$Sub_metering_2, data$DateTime, col="red")
lines(data$Sub_metering_3, data$DateTime, col="blue")
legend("topright", c("Sub_metering_1","Sub_metering_2",
                    "Sub_metering_3"), col = c("black","red","blue"),
       lty=1, lwd=2, y.intersp=0.5,x.intersp=0.5, text.width = 800)
rows = nrow(data)
axis(side=1,at=c(1,rows/2,rows),
     labels=c("Thu", "Fri", "Sat"))

#Saving the plot to png file
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()

