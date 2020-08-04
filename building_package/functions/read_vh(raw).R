read_vh<- function(path=getwd(), state, vtr_file = NULL, standard_columns = T, recode_vals = T) {
  source("C:/Users/prlic/Documents/GitHub/vrrr/building_package/functions/helpful_lists.R")
  check_state(states = state)
  state_yaml<-check_yaml(state=state)
 
  check_yaml_history(yaml = state_yaml)



}


read_vh(state = "nj")


