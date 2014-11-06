plot4<-function(){
  
  if(!file.exists("data")){dir.create("data")}
  download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",destfile="./data/data.zip")
  library(utils)
  unzip("./data/data.zip",exdir="./data")
  alldata<-read.table("./data/household_power_consumption.txt",sep=";",head=T)
  alldata$Date<-as.Date(alldata$Date,format="%d/%m/%Y")
  data<-subset(alldata,alldata$Date=="2007-02-02"|alldata$Date=="2007-02-01")
  datetime<-paste(as.character(data$Date),as.character(data$Time))
  datetime<-strptime(datetime,format="%Y-%m-%d %H:%M:%S")
  data<-cbind(datetime,data)
  
  
  data$Sub_metering_1<-as.numeric(as.character(data$Sub_metering_1))
  data$Sub_metering_2<-as.numeric(as.character(data$Sub_metering_2))
  data$Sub_metering_3<-as.numeric(as.character(data$Sub_metering_3))
  data$Global_active_power<-as.numeric(as.character(data$Global_active_power))
  data$Voltage<-as.numeric(as.character(data$Voltage))
  data$Global_reactive_power<-as.numeric(as.character(data$Global_reactive_power))
  
  png(file="./data/plot4.png")
  par(mfrow=c(2,2),mar=c(4,4,2,1))
  plot(data$datetime,data$Global_active_power,type = "l",ylab = "Global Active Power",xlab="")
  plot(data$datetime,data$Voltage,type = "l",ylab = "Voltage",xlab="datetime")
  
  
  plot(data$datetime,data$Sub_metering_1,type = "l",ylab = "Global Active Power(kilowatts)",xlab="")
  lines(data$datetime,data$Sub_metering_2,type = "l",ylab = "Global Active Power(kilowatts)",xlab="",col="red")
  lines(data$datetime,data$Sub_metering_3,type = "l",ylab = "Global Active Power(kilowatts)",xlab="",col="blue")
  legend("topright",lty=c(1,1,1),col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
  
  plot(data$datetime,data$Global_reactive_power,type = "l",ylab = "Global Reactive Power",xlab="datetime")
  dev.off()
}