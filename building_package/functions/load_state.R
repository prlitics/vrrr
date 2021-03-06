#' Loads in state.

load_state<-function(path, vtr_file, yaml){

  # Gather Date Format
  d_format<-yaml[["date_format"]]

  #Gather County
  agg_county<-yaml[["format"]][["separate_counties_voter_file"]]

  file_type<-yaml[["file_type"]]

  # Gather Column Types
  col_classes<-yaml["column_classes"][[1]]
  col_names<-names(cols)

  # Gather Delimiter
  delim <- yaml[["delimiter"]]



  if(isTRUE(agg_county)){



multiple_file_case(path = path, vtr_file = vtr_file, yaml = yaml, file_type = file_type,
                   col_classes = col_classes, col_names = col_names, d_format = d_format,
                   delim = delim)

  }else{

    single_file_case(col_classes = col_classes, col_names = col_names, d_format = d_format)

  }



}
