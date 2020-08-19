#' Checks to see if user input a valid state.
#'
#' @param state A character input that is either a state name (e.g., "North Carolina" or "Florida)
#' or a postal code ("FL" or "nc"). Can be capitalized or not.
#' @return An error if the was inputted incorrectly.


check_state<-function(state){
  # Check if given a character vector
  if (typeof(state)=="character"){


    if(length(state) == 1){
      #Check if given a state that is in the list of available state YAMLs
      if(tolower(state) %in% vrrr:::state_list){
        #If so, yay!


      } else {
        #too many states
        stop("Your state input is either not a state in our library or is not in a recognized format.")
      }

    } else if(length(states) > 1){
      stop("vrr_read can only read-in one state at a time.")

    } else {

      stop("Please enter at least one state or state postal abbreviation.")
    }


  } else{

    stop("Please insert a character list of at least one state or state postal abbreviation.")
  }
}

