# Plot 1

# Load data
power <- read.table("household_power_consumption.txt",header = TRUE,sep=";", na.strings = "?")
power$Date <- as.Date(power$Date, format="%d/%m/%Y")
power$Time <- format(power$Time, format="%H:%M:%S")

power_subset <- subset(power,power$Date>="2007-02-01")
power_subset <- subset(power_subset,power_subset$Date<="2007-02-02")



# Save plot to png

png("plot1.png", width=500, height=500)

# Make plot
hist(as.numeric(as.character(power_subset$Global_active_power)),
           col="red",
           main="Global Active Power",
           xlab="Global Active Power(kilowatts)")

dev.off()