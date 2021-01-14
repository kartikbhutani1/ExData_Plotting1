
#Loading complete data
data <- read.csv("../household_power_consumption.txt", header = T, 
                 sep = ";", na = "?")
data$Date <- format(as.Date(data$Date, format="%d/%m/%Y"), "%d/%m/%Y")

#Subset data
data <- subset(data, (Date == "01/02/2007" | Date == "02/02/2007"))

#Date time conversion
data$Datetime <- strptime(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S")

#Plotting Histogram
hist(data$Global_active_power, main = "Global Active Power",  c='red', xlab = "Global Active Power (kilowatts)")

#Saving the plot to png file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()

