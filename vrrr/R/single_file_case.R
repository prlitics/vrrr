#' Helper function for load_state() dedicated to states with a single file.
#' Uses col_formatter() to determine the formats of each column in the dataset and
#' then reads-in a single dataframe based off of those specifications--as well as others
#' in the embedded YAML data.
#'
#' @param col_classes Column classes, as ascertained from the YAML by load_state()
#' @param col_names Column names, as ascertained from the YAML by load_state()
#' @param d_format The format of the date-fields, as ascertained from the YAML by load_state()
#'
#' @return A data frame of the state's voter registration file.

single_file_case<-function(col_classes, col_names, d_format, yaml, vtr_file){
  y<-col_formatter(cols = col_classes, column_names = col_names, date_format = d_format)
  delim <- yaml[["delimiter"]]
  #Not all states have column names in the file
  if(isTRUE(yaml[["has_headers"]])){
    readr::read_delim(file = vtr_file, delim = delim, col_names = T, col_types = eval(y))
  } else{

    readr::read_delim(file = vtr_file, delim = delim, col_names = col_names, col_types = eval(y))
  }
}
