

vf_read <- function(path=getwd(), state, vtr_file = NULL, standard_columns = T,
                    recode_vals = T, standard_cols = T, menu = T, keep_names = T,
                    keep_addresses = T) {

  check_state(state = state)

  state_yaml<-retrieve_yaml(state=state)

  df <- load_state(path=path, vtr_file = vtr_file, yaml = state_yaml, menu, vtr_names =
               keep_names, vtr_addresses = keep_addresses)


  if(isFALSE(keep_names)){
    df<-df[!(names(df) %in% state_yaml["name_fields"][[1]])]
  }

  if(isFALSE(keep_addresses)){
    df<-df[!(names(df) %in% state_yaml["address_fields"][[1]])]
  }

}
