library(yaml)
library(rlang)
library(readr)


list.files(pattern="get the file ending from the yaml")


load_state<-function(vtr_file, state_yaml){


yaml <- state_yaml

# Gather Date Format
date_format<-yaml[["date_format"]]

#Gather County
agg_county<-yaml[["format"]][["separate_counties_voter_file"]]


# Gather Column Types

cols<-yaml["column_classes"][[1]]
col_names<-names(cols)

# Gather Delimiter
delim <- yaml[["delimiter"]]


simple_case<-function(){
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
  y<-parse_expr(x)
  readr::read_delim(file = vtr_file, delim = delim, col_names = T, col_types = eval(y)) 
  
  
}


if(isTRUE(agg_county)){
  
  print("Lol we'll deal with this later")

  }else{

  simple_case()

  }



}


