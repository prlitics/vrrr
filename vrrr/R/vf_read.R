

vf_read <- function(path=getwd(), state, vtr_file = NULL,
                    recode_vals = TRUE, standard_cols = TRUE, menu = TRUE,
                    keep_names = TRUE, keep_addresses = TRUE, yaml = NULL) {

  check_state(state = state)

  if(is.null(yaml)){
  state_yaml <- retrieve_yaml(state=state)
  }else{
    state_yaml <- yaml
  }

  df <- load_state(path=path, vtr_file = vtr_file, yaml = state_yaml, menu, vtr_names =
               keep_names, vtr_addresses = keep_addresses)


  if(isFALSE(keep_names)){
    df<-df[!(names(df) %in% state_yaml["name_fields"][[1]])]
  }

  if(isFALSE(keep_addresses)){
    df<-df[!(names(df) %in% state_yaml["address_fields"][[1]])]
  }

  if(isTRUE(standard_cols)){
    df<-col_renamer(data = df, yaml = state_yaml)
    return(df)
  } else {
     return(df)
  }
}
