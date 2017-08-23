property_make = function(value=NA,value_class=NULL,name=NULL,...) {
  new_property = value
  if(is.null(value_class)) {
    value_class = class(value) #inherit class from value
  } else {
    new_property = as(new_property,value_class) #or cast value as input value_class
  }
  class(new_property) = c(name,"property",value_class)
  #new_property = 
  return(new_property)
}

validate.property = function(x,newRules=NULL) {
  if(!is.null(newRules)) Rules = newRules else{
    Rules = list(
      wattage = list(
        Class= function(x) any(class(x) %in% c("numeric","integer")),
        Test=function(x) is.finite(x) && x>=0
   )
  }
}
