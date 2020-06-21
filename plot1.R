#making Plot1.png
#reading .txt file into R and select the rows between 01/02/2007-02/02/2007.
data <- read.csv("household_power_consumption.txt", sep = ";", skip = 66637, nrows = 2880)
#when we selected the rows 2880 the columns names changed now have to make proper name for columns.
colnames(data) <- c("Data", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
#creating numerics column of Global_active_power.
data <- data %>% select(Global_active_power) %>% mutate(Global_active_power = as.numeric(as.character(Global_active_power)))

# making png width and height
png("plot1.png", width = 480, height = 480)

#creating histgram of Global_active_power.
hist(data$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (Kilowatts", ylab = "Frequancy")

dev.off()


