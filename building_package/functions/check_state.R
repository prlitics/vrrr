#' Check that user has inputted only one state and in the correct format
#'
#' @param state A character vector of length 1 that can either be a postal code ("FL") or state name ("Florida"; "West Virginia"; "westvirginia")
#' @return Nothing if successful; a warning describing why the state input was improper.
#'
#'  @examples
#' check_state("fl")
#' check_state("New Jersey")
#' check_state("northDaKoTA")

check_state<-function(state){
  # Check if given a character vector
  if (typeof(state)=="character"){


    if(length(state) == 1){
      #Check if given a state that is in the list of states
      if(tolower(state) %in% vrrr:::state_list){
        #If so, yay!


      } else {
        #too many states
        stop("Your state input is either not a state in our library or is not in a recognized format.")
      }

    } else if(length(state) > 1){
      stop("vrr_read can only read-in one state at a time.")

    } else {

      stop("Please enter at least one state or state postal abbreviation.")
    }


  } else{

    stop("Please insert a character list of at least one state or state postal abbreviation.")
  }
}

