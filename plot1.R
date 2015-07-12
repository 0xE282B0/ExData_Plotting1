# If not installed, the folowing line will install lubridate
# install.packages("lubridate")
library("lubridate")

# Load the dataset from the Downloads folder on a Unix system.
household_power_consumption <- read.csv("~/Downloads/household_power_consumption.txt", sep=";", na.strings="?")

# Set up a simple binary vector to filter the dataset.
dates  <- dmy(household_power_consumption$Date)
start  <- ymd('2007-02-01')
end    <- ymd('2007-02-02')
filter <- (dates >= start & dates <= end)

# Plot histogram and use variable name to set the label of the Y-Axis.
png("plot1.png", width=480, height=480)
`Global Active Power (kilowatts)` <- household_power_consumption[filter,'Global_active_power']
hist(`Global Active Power (kilowatts)`,col = "red",main = "Global Active Power")
dev.off()