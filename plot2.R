## Read data file into R and subset to only two dates of information

full_data <- read.table("household_power_consumption.txt", sep = ";", 
                        header = TRUE, na.strings = "?")
full_data$DT <- paste(full_data$Date, full_data$Time)
full_data$DT <- strptime(full_data$DT, format = "%d/%m/%Y %H:%M:%S")

full_data$Date <- as.Date(full_data$Date,format = "%d/%m/%Y")

data <- subset(full_data, Date == "2007-02-01" | Date == "2007-02-02")

## Create plot 2 line graph in png format

png(filename = "plot2.png", width = 480, height = 480)

plot(data$DT, data$Global_active_power, type = "l", col = "black", xlab = "", 
     ylab = "Global Active Power (kilowatts)")

dev.off()