# aggregating counties
 
# if separate_counties_voter_file = TRUE
  # call the agg_county() function
  # agg_county <- function(path, state_yaml){
    # if zipped, 
      #unzip all files 
    # create an empty list for file names 
    # append to a list of file names 
    # gather state_yaml['file_names']
    
    # if state_yaml['file_names'] == path file names 
      # if has_headers == TRUE 
        # load in the first row of each file 
        # if (ncol = the same ) 
          # proceed 
        # else throw error 
          #stop( all cols not the same )
      # else 
        # plus the same as the number listed in the yaml file (is this already checked?)
        # check that the colnames 
    # else if path file names %in% state_yaml['file_names']
      # if has_headers == TRUE 
        # load in the first row of each file 
        # ncol = the same?
        # plus the same as the number listed in the yaml file (is this already checked?)
        # check that the colnames 
#  }

