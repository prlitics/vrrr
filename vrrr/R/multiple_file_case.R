#' A function to read state voter record datasets split across several different files.


multiple_file_case<-function(path, file_type, yaml,
                  col_classes, col_names, d_format, delim, menu){


single_case_repeated<-function(col_classes, col_names, d_format, yaml ){
    df<-data.frame()
    for (i in files_to_agg) {
      print(i)
      x <- single_file_case(col_classes = col_classes, col_names = col_names,
                            d_format = d_format, yaml = yaml, vtr_file = i)
      df<-rbind(df,x)
    }
    df
  }

pause2<-function(){
  date_time<-Sys.time()
  while (as.numeric(Sys.time()) - as.numeric(date_time) < 1.5 ) {}
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
    if(continue==1){single_case_repeated(col_classes = col_classes, col_names = col_names,
                                         d_format=d_format, yaml = yaml)}
    else{stop("vrrr_read() exited",call. = F)}
  }else{
    single_case_repeated(col_classes = col_classes, col_names = col_names, d_format=d_format,
                         yaml = yaml)} }


if(isTRUE(menu)){
sub_menu()
} else {
  single_case_repeated(col_classes = col_classes, col_names = col_names, d_format=d_format,
                       yaml = yaml)
}


}

