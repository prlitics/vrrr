check_yaml_history<-function(state){
  yaml <- check_yaml(state=state)
  hist_type<-yaml[["format"]][["vote_history_type"]]
  
  sep_file<- yaml[["format"]][["separate_hist"]]

    if(is.null(hist_type) & isFALSE(sep_file)){
    stop("According to state_yaml: This state does not offer voter history.")
  }  

    if(isTRUE(sep_file)){
      yaml <- check_yaml(state=state, history = TRUE)
      
    }
return(yaml)
}


