#the function below takes in a directory of data files and a threshold for complete cases
#and calculates the correlation between sulfate and nitrate for monitor locations
#where numobs>=threshold.

corr <- function(directory='specdata',threshold=0){
  source('pollutantscomplete.R')
  completepolls <- complete()
  id <- completepolls[completepolls$numobs>threshold,'id']
  corrs <- c()
  for (i in id){
    while (nchar(i)<3){
      i <- paste(0,i,sep='')
    } #end of while loop
    file <- paste(directory,'/',i,'.csv',sep='')
    monitor <- na.omit(read.csv(file))
    corrs <- c(corrs, cor(monitor$sulfate,monitor$nitrate))
  } #end of monitor loop
  return(corrs)
}