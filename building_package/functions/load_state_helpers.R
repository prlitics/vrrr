#These are helper functions used in the load_state function

pause2<-function(){
  date_time<-Sys.time()
  while (as.numeric(Sys.time()) - as.numeric(date_time) < 1.5 ) {}
}  

  
