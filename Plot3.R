
# reading relevant data
data <- read.table("household_power_consumption.txt", sep = ";", skip = 66637, nrows = 2880)

# clearing name row and unrelevant variables, casting to right classes

data$V1 <- as.Date(data$V1, format = "%d/%m/%Y")
data$DateTime <- strptime(paste(data$V1,data$V2),
                                 format = "%Y-%m-%d %H:%M:%S")
data$V7 <-   as.numeric(as.character(data$V7))
data$V8 <-   as.numeric(as.character(data$V8))
data$V9 <-   as.numeric(as.character(data$V9))
                     

# create plot
png("plot3.png", width=480, height=480)
with(data, plot(DateTime,V7, type="n", xlab = "", ylab = "Energy Sub Metering"))
with(data, points(DateTime,V7, col="black", type="l"))
with(data, points(DateTime,V8, col="red", type="l"))
with(data, points(DateTime,V9, col="blue", type="l"))
legend("topright", lty=1, col = c("black", "red", "blue"), 
       legend = c("Sub_Metering_1", "Sub_Metering_2", "Sub_Metering_3"))