#' Function to take in a state and fetch its associated yaml.
#'
#' @param state A state name or postal code (e.g., "Florida" or "FL" or "fL")
#' @return The YAML file on file for this state or an error, alerting users that it is not currently documented.


retrieve_yaml <- function(state, history = FALSE){

  if(isFALSE(history)){
    state_yaml <- paste0(vrrr:::state_key[tolower(state)],".yaml")}
  else if(isTRUE(history)){
    state_yaml <- paste0(vrrr:::state_key[tolower(state)],"_history.yaml")}

  if(exists(state_yaml)){
    eval(parse(text = state_yaml))
  }else{
    stop("Documentation on this state does not exist in your current instance of vrrr")
  }

}

