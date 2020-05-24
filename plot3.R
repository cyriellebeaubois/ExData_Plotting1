# Plot 3

# Load data
power <- read.table("household_power_consumption.txt",header = TRUE,sep=";", na.strings = "?")
power$DateTime <- strptime(paste(power$Date, power$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
power$Date <- as.Date(power$Date, format="%d/%m/%Y")

power_subset <- subset(power,power$Date>="2007-02-01")
power_subset <- subset(power_subset,power_subset$Date<="2007-02-02")


# Save plot to png
png("plot3.png", width=500, height=500)

# calling the basic plot functions
plot(power_subset$DateTime, power_subset$Sub_metering_1,type="n",
     xlab="",
     ylab="Energy sub metering")
with(power_subset,
     lines(DateTime,as.numeric(as.character(Sub_metering_1))))
with(power_subset,
     lines(DateTime,as.numeric(as.character(Sub_metering_2)),
           col="red"))
with(power_subset,
     lines(DateTime,as.numeric(as.character(Sub_metering_3)),
           col="blue"))
legend("topright", lty=1, 
       col=c("black","red","blue"),
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.off()