#' Function that takes in information from the yaml to format each column appropriately.
#'
#' @param cols The column classes as ascertained by load_state().
#' @param column_names The column names, as ascertained by load_state()
#' @param date_format The date format for date-type files, as ascertained by load_state()
#'
#' @return R script to be evaluated by load_state() that will read the columns as the correct classes.
#'

col_formatter<-function(cols, column_names, date_format){
  x<-""
  z<-0
  for (i in cols) {

    z<- z + 1

    if(i == "date"){

      if(z==1){
        x<-(paste0('readr::cols_only(',shQuote(column_names[z])," = readr::col_date( format = ",shQuote(date_format),'),'))
      }else if (z < length(cols)){
        x<-paste0(x,shQuote(column_names[z])," = readr::col_date( format = ",shQuote(date_format),'),')}
      else{
        x <-paste0(x,shQuote(column_names[z])," = readr::col_date( format = ",shQuote(date_format),')',')')
      }

    } else {

      if(z==1){
        x<-(paste0('readr::cols_only(',shQuote(column_names[z])," = readr::col_",i[[1]],'(), '))
      }else if (z < length(cols)){
        x<-paste0(x,shQuote(column_names[z])," = readr::col_",i[[1]],'(), ')}
      else{
        x <-paste0(x,shQuote(column_names[z])," = readr::col_",i[[1]],'() ',')')
      }
    }



  }
  z<-parse(text = x)
  return(z)


}

