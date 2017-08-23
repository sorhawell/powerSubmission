'set<-.item' =  function(x,property,value_class=NULL,value) {
  if(is.null(value_class)) value_class = class(value) else value = as(value,value_class)
  available_properties = sapply(x$config,function(z) class(z)[1])
  match_ind = match(property,available_properties)[1]
  if(is.na(match_ind)) stop("this property is not defined")
  oldProperty = x$config[[match_ind]]
  same_value_class = tail(class(value),1) == tail(class(oldProperty),1)
  if(!same_value_class) stop(paste("input value is not: ",tail(class(oldProperty),1)))
  newProperty = property_make(value,value_class,property)
  x$config[[match_ind]] = newProperty
  return(x)
}
