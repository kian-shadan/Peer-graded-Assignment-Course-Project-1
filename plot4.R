# reading relevant data
data <- read.table("household_power_consumption.txt", sep = ";", skip = 66637, nrows = 2880)
# clearing name row and unrelevant variables, casting to right classes
# as plot1.png when we selected 2880 rows of househole_power_consumption. that columns names changed now have to make proper name for columns.
colnames(data) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")


data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data$DateTime <- strptime(paste(data$Date,data$Time),
                          format = "%Y-%m-%d %H:%M:%S")
#Making png format plot

png("plot2.png", width = 480, height = 480)

par(mfrow = c(2,2))

#making first column and first row plot.


with(data, plot(DateTime, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power"))

#making second column and first row plot.

with(data, plot(DateTime, Voltage, type = "l", xlab = "datetime", ylab = "Voltage" ))

#making first column and second row plot.


with(data, plot(DateTime, Sub_metering_1, type = "n", xlab = "", ylab = "Energy Sub Metering"))
with(data, points(DateTime, Sub_metering_1, col = "black", type="l"))
with(data, points(DateTime, Sub_metering_2, col = "red", type = "l"))
with(data, points(DateTime, Sub_metering_3, col = "blue", type = "l"))
legend("topright", lty=1, col = c("black", "red", "blue"), 
       legend = c("Sub_Metering_1", "Sub_Metering_2", "Sub_Metering_3"))

#making second column and second row plot.

with(data, plot(DateTime, Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power"))

dev.off()

