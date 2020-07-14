install.packages("yaml")
library(yaml)



vrrr_read <- function(path=getwd(), state, vtr_file, standard_columns = T, recode_vals = T) {
  source("C:/Users/prlic/Documents/GitHub/vrrr/building_package/helpful_lists.R")
  check_state(states = state)
  
  state_yaml<-check_yaml(state=state)
  
  load_state(state, vtr_file = vtr_file, state_yaml = state_yaml)

  
}



states1<-c("hI")
states2<-c("hi","what's up?")
states3<-c()
states4<-c(1,2,3)
states5<-c(1,"pie",3)
states6 <-c("fLoRiDa")





ak<-vrrr_read(state = "ak", vtr_file = "C:/Users/prlic/Downloads/VOTERS List Report 9.25.19.csv")


check_state<-function(states){
  # Check if given a character vector
  if (typeof(states)=="character"){
    num_states<-length(states)
    
    if(num_states == 1){
      #Check if given a state that is in the list of available state YAMLs
      if(tolower(states) %in% state_list){
        #If so, yay!
        
        
      } else { 
        #too many states
        stop("Your state input is either not a state in our library or is not in a recognized format.")
      }
      
    } else if(num_states > 1){
      stop("vrr_read can only read-in one state at a time.")
      
    } else {
      
      stop("Please enter at least one state or state postal abbreviation.")
    }
    
    
  } else{
    
    stop("Please insert a character list of at least one state or state postal abbreviation.")
  }
}




yaml<-yaml.load_file("C:/Users/prlic/Dropbox/YAML/yaml standardization/yaml files/finished yaml/alaska.yaml")







