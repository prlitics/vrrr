col_renamer<-function(data, yaml){
  standard_colpairs<-yaml[["standard_colpairs"]]

  if(isTRUE(yaml[["has_headers"]])){
    for(i in seq_along(data)){

      if((names(standard_colpairs)[i] %in% colnames(data))){
        colnames(data)[[i]]<-standard_colpairs[[ colnames(data)[[i]] ]]

      }

      }
}
return(data)

}


