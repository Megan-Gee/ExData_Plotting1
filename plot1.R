## Read data file into R and subset to only two dates of information

full_data <- read.table("household_power_consumption.txt", sep = ";", 
                    header = TRUE, na.strings = "?")
full_data$Date <- as.Date(full_data$Date,format = "%d/%m/%Y")

data <- subset(full_data, Date == "2007-02-01" | Date == "2007-02-02")

## Create plot 1 histogram in png format

png(filename = "plot1.png", width = 480, height = 480)

hist(data$Global_active_power, col = "red", 
     xlab = "Global Active Power (kilowatts)", main = "Global Active Power")

dev.off()