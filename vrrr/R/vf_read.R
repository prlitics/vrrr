

vf_read <- function(path=getwd(), state, vtr_file = NULL, standard_columns = T, recode_vals = T) {
  check_state(state = state)

  state_yaml<-retrieve_yaml(state=state)


  load_state(path=path, vtr_file = vtr_file, yaml = state_yaml)
}
