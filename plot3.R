## Read data file into R and subset to only two dates of information

full_data <- read.table("household_power_consumption.txt", sep = ";", 
                        header = TRUE, na.strings = "?")
full_data$DT <- paste(full_data$Date, full_data$Time)
full_data$DT <- strptime(full_data$DT, format = "%d/%m/%Y %H:%M:%S")

full_data$Date <- as.Date(full_data$Date,format = "%d/%m/%Y")

data <- subset(full_data, Date == "2007-02-01" | Date == "2007-02-02")

## Create plot 3 line graph in png format

png(filename = "plot3.png", width = 480, height = 480)

with(data, plot(DT, Sub_metering_1, xlab = "", ylab = "Energy sub metering",
                type = "n"))
with(data, points(DT, Sub_metering_1, col = "black", type = "l"))
with(data, points(DT, Sub_metering_2, col = "red", type = "l"))
with(data, points(DT, Sub_metering_3, col = "blue", type = "l"))
legend("topright", col = c("black", "red", "blue"), lty = 1,
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()