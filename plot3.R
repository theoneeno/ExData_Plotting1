plot3<-function(){
  
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
  png(file="./data/plot3.png")
  plot(data$datetime,data$Sub_metering_1,type = "l",ylab = "Global Active Power(kilowatts)",xlab="")
  lines(data$datetime,data$Sub_metering_2,type = "l",ylab = "Global Active Power(kilowatts)",xlab="",col="red")
  lines(data$datetime,data$Sub_metering_3,type = "l",ylab = "Global Active Power(kilowatts)",xlab="",col="blue")
  legend("topright",lty=c(1,1,1),col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
  dev.off()
}