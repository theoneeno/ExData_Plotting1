plot2<-function(){
  
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
  
  
  data$Global_active_power<-as.numeric(as.character(data$Global_active_power))
  png(file="./data/plot2.png")
  plot(data$datetime,data$Global_active_power,type = "l",ylab = "Global Active Power(kilowatts)",xlab="")
  dev.off()
  
}