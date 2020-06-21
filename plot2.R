#making Plot2.png
#reading .txt file into R and select the rows between 01/02/2007-02/02/2007.
data <- read.csv("household_power_consumption.txt", sep = ";", skip = 66637, nrows = 2880)

# as plot1.png when we selected 2880 rows of househole_power_consumption. that columns names changed now have to make proper name for columns.
colnames(data) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

# making correct data and time format.
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data$DateTime <- strptime(paste(data$Date,data$Time),
                                 format = "%Y-%m-%d %H:%M:%S")
data <- select(data, DateTime, Global_active_power)

png("plot2.png", width = 480, height = 480)
with(data, plot(DateTime, Global_active_power, type = "1", xlab = "", ylab = "Global Active Power (Kilowatts)", labels = c("Thu", "Fri", "Sat")))