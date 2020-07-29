library(yaml)
library(rlang)
library(readr)


list.files(pattern="get the file ending from the yaml")


load_state<-function(path, vtr_file, state_yaml){
  
  
  yaml <- state_yaml
  
  # Gather Date Format
  date_format<-yaml[["date_format"]]
  
  #Gather County
  agg_county<-yaml[["format"]][["separate_counties_voter_file"]]
  
  file_type<-yaml[["file_type"]]
  
  # Gather Column Types
  cols<-yaml["column_classes"][[1]]
  col_names<-names(cols)
  
  # Gather Delimiter
  delim <- yaml[["delimiter"]]
  
  
  single_case<-function(){
  y<-col_formatter(cols = cols, col_names = col_names, date_format = date_format)
  
  
  readr::read_delim(file = vtr_file, delim = delim, col_names = T, col_types = eval(y)) 
  }
  
  
  
  
  pause2<-function(){
    date_time<-Sys.time()
    while (as.numeric(Sys.time()) - as.numeric(date_time) < 1.5 ) {}
  }    
  
  if(isTRUE(agg_county)){
    
    wd<-getwd()
    setwd<-path
    menu1<-c(" List Files in Directory", " Compile State from Files Currently in the Directory", " Retry load_states()", " Quit")
    num_counties_yaml <- yaml[["num_files"]]
    files_to_agg <- list.files(pattern=file_type)
    num_in_dir <- length(files_to_agg)
    
    writeLines("Warning in load_states(): You have selected a state that must be aggregated up from the county level.")
    writeLines("")
    pause2()
    writeLines(paste0("According to state_yaml, this state has ",num_counties_yaml," county files."))
    writeLines("")
    pause2()
    writeLines(paste0("These files should be ",shQuote(file_type)," type files."))
    writeLines("")
    pause2()
    writeLines(paste0("Currently there are ",num_in_dir," such files in the specified directory."))
    writeLines("")
    pause2()
    if(num_in_dir!=num_counties_yaml){
      writeLines("We advise that you move all of the files you wish to aggregate (and only these files) into\n the directory you specified in vrrr_read()")
      writeLines("")
      pause2()}
    
    
    
    sub_sub_menu<-function(){
      if(num_in_dir!=num_counties_yaml){
        writeLines("WARNING: You do not have the same number of files as counties in the state.")
        continue<-menu(c("Yes","No"), title = "Do you wish to continue with the aggregation?")
        if(continue==1){"Loop Function Here"}else{stop("vrrr_read() exited",call. = F)}
      }else{"loop function here"} }
    
    sub_menu<- function(){
      choice<-as.numeric(menu(menu1, title = "Please make a selection"))
      switch(choice,
             {print(files_to_agg)
               sub_menu()},
             sub_sub_menu(),
             load_state(path=path, vtr_file=vtr_file, state_yaml = state_yaml),
             stop("vrrr_read() exited",call. = F))
    }  
    
    
    sub_menu()
    
    
    
    
    
  }else{
    
    single_case()
    
  }
  
  
  
}