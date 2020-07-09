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


