#The following function is designed to calculate the mean of a pollutant (sulfate or nitrate) across a list of monitors

pollutantmean <- function(directory='specdata', pollutant,id=1:332){
  data <- c()
  #looping through the files for the list of monitors given
  for (i in id){
    #while loop necessary to make the id match the format on the filenames (i.e., id(1)='001')
    while (nchar(i)<3){
      i <- paste(0,i,sep='')
    } #end of while loop
    file <- paste(directory,'/',i,'.csv',sep='')
    monitor <- read.csv(file)
    #removing na values from monitor dataset
    monitor <- subset(monitor, !is.na(monitor[pollutant]))
    data <- append(data,monitor[[pollutant]],after=length(data))
  } #end of monitor loop
  mean(data)
}