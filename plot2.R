##download zip and extract file to desktop in order to read the file

read_data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))
dim(read_data)



finalData <- read_data[read_data$Date %in% c("1/2/2007","2/2/2007"),]
finalData

SetTime <-strptime(paste(finalData$Date, finalData$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
finalData <- cbind(SetTime, finalData)

##Plot 2
plot(finalData$SetTime, finalData$Global_active_power, type="l", col="black", xlab="", ylab="Global Active Power (kilowatts)")
dev.copy(png,"plot2.png", width=480, height=480)
dev.off()