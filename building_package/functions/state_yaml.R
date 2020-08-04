state_yaml<-function(state){
  source("C:/Users/prlic/Documents/GitHub/vrrr/building_package/functions/helpful_lists.R")
  check_state(states = state)
  
  state_yaml<-check_yaml(state=state)
  state_yaml
}
