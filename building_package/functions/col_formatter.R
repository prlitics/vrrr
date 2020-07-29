#Returns R script to be evaluated by readr that will format the columns appropriately.

col_formatter<-function(cols = cols, col_names = col_names, date_format = date_format){
  x<-""
  z<-0
  for (i in cols) {
    
    z<- z + 1
    
    if(i == "date"){
      
      if(z==1){
        x<-(paste0('list(',shQuote(col_names[z])," = col_date( format = ",shQuote(date_format),'),'))
      }else if (z < length(cols)){
        x<-paste0(x,shQuote(col_names[z])," = col_date( format = ",shQuote(date_format),'),')}
      else{
        x <-paste0(x,shQuote(col_names[z])," = col_date( format = ",shQuote(date_format),')',')')
      }
      
    } else {
      
      if(z==1){
        x<-(paste0('list(',shQuote(col_names[z])," = col_",i[[1]],'(), '))
      }else if (z < length(cols)){
        x<-paste0(x,shQuote(col_names[z])," = col_",i[[1]],'(), ')}
      else{
        x <-paste0(x,shQuote(col_names[z])," = col_",i[[1]],'() ',')')
      }
    }
    
    
    
  }
  
  return(parse_expr(x)) 
  
  
}

