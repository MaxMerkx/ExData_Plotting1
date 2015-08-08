# load data 
household_power_consumption <- read.csv("household_power_consumption.txt", sep=";", stringsAsFactors=FALSE, na.strings="?")

# We will only be using data from the dates 2007-02-01 and 2007-02-02. 
household_power_consumption <- subset(household_power_consumption, Date %in% c("1/2/2007", "2/2/2007"))

#  convert date strings to date format
as.Date(household_power_consumption$Date,format="%d/%m/%Y") -> household_power_consumption$Date

# insert column with date and time combined
as.POSIXct(paste(household_power_consumption$Date, household_power_consumption$Time)) -> household_power_consumption$DateTime

# open png device
png(filename = "plot3.png",
    width = 480, height = 480, units = "px", pointsize = 12)

# basic line plots
plot(household_power_consumption$DateTime,household_power_consumption$Sub_metering_1, type="l", ylab = "Energy sub metering", xlab = "")
lines(household_power_consumption$DateTime,household_power_consumption$Sub_metering_2, col="red")
lines(household_power_consumption$DateTime,household_power_consumption$Sub_metering_3, col="blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty=1)

# close device to write & close file
dev.off()