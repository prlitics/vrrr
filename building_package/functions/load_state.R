load_state<-function(path=path, vtr_file = vtr_file, state_yaml = state_yaml){
  
  
  yaml <- state_yaml
  
  # Gather Date Format
  date_format<-yaml[["date_format"]]
  
  #Gather County
  agg_county<-yaml[["format"]][["separate_counties_voter_file"]]
  
  file_type<-yaml[["file_type"]]
  
  # Gather Column Types
  cols<-yaml["column_classes"][[1]]
  column_names<-names(cols)
  
  # Gather Delimiter
  delim <- yaml[["delimiter"]]
  

  
  single_case<-function(){
  y<-col_formatter(cols = cols, column_names = column_names, date_format = date_format)
  
  #Not all states have column names in the file
  if(isTRUE(yaml[["has_headers"]])){
  readr::read_delim(file = vtr_file, delim = delim, col_names = T, col_types = eval(y)) 
  } else{
    
    readr::read_delim(file = vtr_file, delim = delim, col_names = column_names, col_types = eval(y)) 
  }
  }
  

  
  
  if(isTRUE(agg_county)){
    

   
multiple_case(path = path, vtr_file = vtr_file, state_yaml = state_yaml, file_type = file_type, yaml = yaml,
        cols = cols, column_names = column_names, date_format = date_format, delim = delim) 
    
    
  }else{
    
    single_case()
    
  }
  
  
  
}