

read_vf<- function(path=getwd(), state, vtr_file = NULL, standard_columns = TRUE, recode_vals = TRUE,
                   yaml = NULL) {
  check_state(states = state)

  state_yaml<-retrieve_yaml(state=state)

  #load_state(path=path, vtr_file = vtr_file, state_yaml = state_yaml)
  print(state_yaml)

}

read_vf(state = "fL")
