library(yaml)
library(rlang)
library(readr)
library(tibble)

list.files(pattern="get the file ending from the yaml")


standardize_cols<-function(vtr_file, state_yaml){
  
  yaml <- state_yaml
  
  # Gather Column Types
  cols<-yaml["column_classes"][[1]]
  col_names<-names(cols)
  
  # Gather Column Names
  cols<-yaml["standard_colpairs"][[1]]
  col_names <- names(cols)

  # if column names gathered here, match the original column names 
  if(col_names == colnames(vtr_file)){
    # then gather standard colnames
    standard_cols = c()
    for(i in 1:length(cols)){
      standard_cols = append(standard_cols, cols[[i]])
    }
    colnames(utah.file) = standard_cols
  }
  else{
    stop("Unable to standardize column names because the column names in the voter file you provided do not match the column names we have documented.")
  }
}
