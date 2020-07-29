multiple_case<-function(path = path, vtr_file = vtr_file, state_yaml = state_yaml, file_type = file_type, yaml = yaml,
                  cols = cols, column_names = column_names, date_format = date_format, delim = delim){

  
simple_case_repeated<-function(cols = cols, column_names = column_names, date_format = date_format){
    df<-data.frame()
    y<-col_formatter(cols = cols, column_names = column_names, date_format = date_format)
    for (i in files_to_agg) {
      if(isTRUE(yaml[["has_headers"]])){
        x <- readr::read_delim(file = i, delim = delim, col_names = T, col_types = eval(y)) 
      } else{
        x <- readr::read_delim(file = i, delim = delim, col_names = column_names, col_types = eval(y)) 
      } 
      df<-rbind(df,x)
    }  
    df 
  }    
  
wd<-getwd()
setwd(path)
num_counties_yaml <- yaml[["num_files"]]
files_to_agg <- list.files(pattern=file_type)
num_in_dir <- length(files_to_agg)

message("Notice from load_states(): You have selected a state that must be aggregated up from the county level.")
writeLines("")
pause2()
message(paste0("According to state_yaml, this state has ",num_counties_yaml," county files."))
writeLines("")
pause2()
message(paste0("These files should be ",shQuote(file_type)," type files."))
writeLines("")
pause2()
message(paste0("Currently there are ",num_in_dir," such files in the specified directory."))
message("")
pause2()
if(num_in_dir!=num_counties_yaml){
  message("We advise that you move all of the files you wish to aggregate (and only these files) into\n the directory you specified in vrrr_read()")
  writeLines("")
  pause2()
}

sub_menu<- function(){
  menu1<-c(" List Files in Directory", " Compile State from Files Currently in the Directory", 
           " Retry load_states()", " Quit")
  choice<-as.numeric(menu(menu1, title = "Please make a selection"))
  switch(choice,
         {writeLines("")
           print(files_to_agg)
           writeLines("")
           sub_menu()},
         sub_sub_menu(),
         load_state(path=path, vtr_file = vtr_file, state_yaml = state_yaml),
         stop("vrrr_read() exited",call. = F))}


sub_sub_menu<-function(){
  if(num_in_dir!=num_counties_yaml){
    message("WARNING: You do not have the same number of files as counties in the state.")
    continue<-menu(c("Yes","No"), title = "Do you wish to continue with the aggregation?")
    if(continue==1){simple_case_repeated(cols = cols, column_names = column_names, date_format = date_format)}
    else{stop("vrrr_read() exited",call. = F)}
  }else{
    simple_case_repeated(cols = cols, column_names = column_names, date_format = date_format)} }



sub_menu()

}

