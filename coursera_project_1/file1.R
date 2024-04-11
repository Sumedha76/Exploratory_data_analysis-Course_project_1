# STEP 1 - Get data


data_full <- read.csv("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?",
                      nrows=2075259, check.names=FALSE, stringsAsFactors=FALSE, comment.char="", quote='"')
data_full$Date <- as.Date(data_full$Date, format="%d/%m/%Y")

# STEP 2 - Subsetting the data

data <- subset(data_full, Date >= "2007-02-01" & Date <= "2007-02-02")
rm(data_full)  

# STEP 3 - Converting dates

datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

# STEP 4 - Generate the histogram

hist(data$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="red")

# STEP 5 - Saving to file (assuming you have png installed)

dev.copy(png, file="file1.png", height=480, width=480)

