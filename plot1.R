# load data 
household_power_consumption <- read.csv("household_power_consumption.txt", sep=";", stringsAsFactors=FALSE, na.strings="?")

# We will only be using data from the dates 2007-02-01 and 2007-02-02. 
household_power_consumption <- subset(household_power_consumption, Date %in% c("1/2/2007", "2/2/2007"))
             
#  convert date strings to date format
as.Date(household_power_consumption$Date,format="%d/%m/%Y") -> household_power_consumption$Date

# open png device
png(filename = "plot1.png",
    width = 480, height = 480, units = "px", pointsize = 12)

# basic hist plot
hist(household_power_consumption$Global_active_power, col="red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")

# close device to write & close file
dev.off()