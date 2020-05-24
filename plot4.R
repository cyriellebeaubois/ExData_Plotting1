# Plot 4

# Load data
power <- read.table("household_power_consumption.txt",header = TRUE,sep=";", na.strings = "?")
power$DateTime <- strptime(paste(power$Date, power$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
power$Date <- as.Date(power$Date, format="%d/%m/%Y")

power_subset <- subset(power,power$Date>="2007-02-01")
power_subset <- subset(power_subset,power_subset$Date<="2007-02-02")

# Save plot to png
png("plot4.png", width=500, height=500)

        # Graph layout
        par(mfrow=c(2,2))
        
        
        # Plot 1
        with(power_subset, plot(DateTime, Global_active_power, type="l", 
                                xlab="",ylab="Global Active Power"))
        
        # Plot 2
        with(power_subset, plot(DateTime, Voltage, type = "l", 
                                xlab="datetime",  ylab="Voltage"))
        
        # Plot 3
        with(power_subset, plot(DateTime, Sub_metering_1, type="l", 
                                xlab="",ylab="Energy sub metering"))
                lines(power_subset$DateTime, power_subset$Sub_metering_2,type="l", col= "red")
                lines(power_subset$DateTime, power_subset$Sub_metering_3,type="l", col= "blue")
                legend("topright", 
                        legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
                        lty= 1, lwd=2, col = c("black", "red", "blue"))
        
        # Plot 4
        with(power_subset, plot(DateTime, Global_reactive_power, type="l", 
                                xlab="datetime", ylab="Global_reactive_power"))


dev.off()