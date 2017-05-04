#The following reads the number of complete cases for each monitor

complete <- function(directory='specdata',id=1:332){
  #creating empty dataframe to store observed cases for each monitor
  data_observed <- data.frame(id=integer(0),numobs=integer(0))
  for (i in id){
    while (nchar(i)<3){
      i <- paste(0,i,sep='')
    } #end of while loop
    file <- paste(directory,'/',i,'.csv',sep='')
    monitor <- read.csv(file)
    #removing na values from monitor dataset
    monitor <- subset(monitor, !is.na(monitor['sulfate']))
    newrow <- data.frame('id'=monitor[['ID']][1],'numobs'=length(monitor[['ID']]))
    data_observed <- rbind(data_observed,newrow)
  }
  data_observed
}