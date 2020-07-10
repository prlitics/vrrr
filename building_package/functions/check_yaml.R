library(yaml)

# function will take in a state 
check_yaml <- function(state){
  source("C:/Users/jenna/Documents/GitHub/vrrr/building_package/helpful_lists.R")
    # check if given a character vector
  if (typeof(state)=='character'){
    if (tolower(state) %in% names(state_key)){
      # continue 
      current_dir <- getwd()
      setwd('C:/Users/jenna/Documents/GitHub/vrrr/yaml_files')
      # paste .yaml on the backend of it 
      state_yaml <- paste0(state_key[tolower(state)],".yaml")
    
      # this corrects "fl" or "FlOrIdA" to "florida" and makes it "florida.yaml" 

      # access a list of all YAMLs in our repo
      # check if this state is in it/exists
      if(file.exists(state_yaml)){
        print("File exists, proceed")
        called_yaml<- yaml:: yaml.load_file(state_yaml)
      
        setwd(current_dir)
        called_yaml
      }
      
    }else{
      stop("Documentation on this state does not exist in your current instance of vrr")
    } 
    }
  else{
    stop("Please insert a character string with your state's name")
  }
}


check_yaml('florida')
