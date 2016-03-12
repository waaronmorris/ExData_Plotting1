loadCleanData <- function (fileName, dateFrom, dateTo){
  powerconsumption <- read.csv(fileName, sep = ";")
  
  powerconsumption$Date <- as.Date(powerconsumption$Date, format = "%d/%m/%Y")
  
  powerconsumption <- powerconsumption[(powerconsumption$Date >= as.Date(dateFrom, format = "%Y-%m-%d") 
                    & powerconsumption$Date <= as.Date(dateTo, format = "%Y-%m-%d")), ]
  
  powerconsumption$Global_active_power <- as.numeric(powerconsumption$Global_active_power)
  powerconsumption$Global_reactive_power <- as.numeric(powerconsumption$Global_reactive_power)
  powerconsumption$Voltage <- as.numeric(powerconsumption$Voltage)
  powerconsumption$Global_intensity <- as.numeric(powerconsumption$Global_intensity)
  powerconsumption$Sub_metering_1 <- as.numeric(powerconsumption$Sub_metering_1)
  powerconsumption$Sub_metering_2 <- as.numeric(powerconsumption$Sub_metering_2)
  powerconsumption$Sub_metering_3 <- as.numeric(powerconsumption$Sub_metering_3)
  
  powerconsumption$Time <- strptime(
                                    paste(as.Date(powerconsumption$Date, format = "%d/%m/%Y")
                                          , powerconsumption$Time)
                                    , format = "%Y-%m-%d %H:%M:%S")
  
  return(powerconsumption)
}

makePNG <- function(fileName, plot, width, height, bg, data) {
  png(fileName, width = width, height = height, bg = bg)
  
  plot(data)
  
  dev.off()
}

plot1 <- function(data){
          hist(data$Global_active_power
                , main = "Global Active Power"
                , xlab = "Global Active Power (kilowatt)"
                , col = "red" )
}

plot2<- function(data){
          plot(x = data$Time
               , y = data$Global_active_power 
               , main = "Global Active Power by the Hour"
               , ylab = "Global Active Power (kilowatts)"
               , type = 'l'
          )
}

plot3 <- function(data){
          plot(x = data$Time
               , y = data$Sub_metering_1 
               , main = "Energy Sub Metering"
               , ylab = "SUb Metering"
               , type = 'l'
          )
          
          points(data$Time, data$Sub_metering_2, type = "l", col = "red")
          points(data$Time, data$Sub_metering_3, type = "l", col = "blue")
          
          legend(x = "topright"
                 , legend = grep("Sub_metering", colnames(data), value = TRUE)
                 , col = c("black", "red", "blue")
                 , lty = 1
          )
}

plot4_1 <- function(data){
            plot2(data)
}
plot4_2 <- function(data){
            plot(x = data$Time
                 , y = data$Voltage
                 , type = "l"
                 , ylab = "Voltage"
  )
  
}

plot4_3 <- function(data){
            plot3(data)
}

plot4_4 <- function(data){
            plot(data$Time
                 , data$Global_reactive_power
                 , type = "l"
                 , ylab = "Global_reactive_power"
            )
}