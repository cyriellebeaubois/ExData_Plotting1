# Plot 2

# Load data
power <- read.table("household_power_consumption.txt",header = TRUE,sep=";", na.strings = "?")
power$DateTime <- strptime(paste(power$Date, power$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
power$Date <- as.Date(power$Date, format="%d/%m/%Y")

power_subset <- subset(power,power$Date>="2007-02-01")
power_subset <- subset(power_subset,power_subset$Date<="2007-02-02")


# Save plot to png
png("plot2.png", width=500, height=500)

# Make plot
plot(power_subset$DateTime,as.numeric(as.character(power_subset$Global_active_power)),
     type="l",
     xlab="",
     ylab="Global Active Power (kilowatts)") 

dev.off()