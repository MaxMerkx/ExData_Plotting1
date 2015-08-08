# load data 
household_power_consumption <- read.csv("household_power_consumption.txt", sep=";", stringsAsFactors=FALSE, na.strings="?")

# We will only be using data from the dates 2007-02-01 and 2007-02-02. 
household_power_consumption <- subset(household_power_consumption, Date %in% c("1/2/2007", "2/2/2007"))

#  convert date strings to date format
as.Date(household_power_consumption$Date,format="%d/%m/%Y") -> household_power_consumption$Date

# insert column with date and time combined
as.POSIXct(paste(household_power_consumption$Date, household_power_consumption$Time)) -> household_power_consumption$DateTime

# open png device
png(filename = "plot4.png",
    width = 480, height = 480, units = "px", pointsize = 12)

# multiple basic plots ,mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0)
par(mfrow = c(2, 2))
with(household_power_consumption, {
  plot(household_power_consumption$DateTime,household_power_consumption$Global_active_power, type="l", ylab = "Global Active Power", xlab = "")
  plot(DateTime, Voltage, main = "", type="l", xlab = "datetime")
  plot(DateTime,Sub_metering_1, type="l", ylab = "Energy sub metering", xlab = "")
  lines(DateTime,Sub_metering_2, col="red")
  lines(DateTime,Sub_metering_3, col="blue")
  legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty=1, bty="n")
  plot(DateTime,Global_reactive_power, type="l", xlab = "datetime")
})

# close device to write & close file
dev.off()