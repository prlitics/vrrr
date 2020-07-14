library(yaml)
library(rlang)
library(readr)




load_state<-function(state, vtr_file, state_yaml){


yaml <- state_yaml

# Gather Column Types

cols<-yaml["column_classes"][[1]]
col_names<-names(cols)

x<-""
z<-0
for (i in cols) {
  z<- z + 1
  
  if(z==1){
    x<-(paste0('list(',shQuote(col_names[z])," = col_",i[[1]],'(), '))
  }else if (z < length(cols)){
    x<-paste0(x,shQuote(col_names[z])," = col_",i[[1]],'(), ')}
  else{
    x <-paste0(x,shQuote(col_names[z])," = col_",i[[1]],'() ',')')
  }
  

  
}


# Gather Delimiter
delim <- yaml[["delimiter"]]

y<-parse_expr(x)

print(names(y))


#Load it in (need to complicate it from here, but it'll be fine for )
readr::read_delim(file = vtr_file, delim = delim, col_names = T, col_types = eval(y))


}

h<-"hi"
p<-parse_expr("print(h)")
eval(p)
