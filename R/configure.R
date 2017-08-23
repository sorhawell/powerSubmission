#' Configure something
#'
#' @param x 
#' @param ... 
#'
#' @return something configured
#' @export
#'
#' @examples configure(item_make(type="fishtank"))
configure = function(x) UseMethod("configure",x)


#' Configure item
#'
#' @param x 
#' @param ... 
#'
#' @return configured item
#' @export
#'
#' @examples configure(item_make(type="fishtank"))
configure.item = function(x,...) {
  x$config = list(
    property_make(value=NA,value_class = "character",name="place"),
    property_make(NA,"numeric","ratedWattage"),
    property_make(NA,"numeric","dailyWattHours")
  )
  return(x)
}

#' configure lamp
#' @aliases confiugre
#' @param x 
#' @param ... 
#'
#' @return configured lamp
#' @export
#'
#' @examples configure(item_make(type="lamp"))
configure.lamp = function(x,...) {
  print("hello imma laaamp")
  x = configure.item(x)
  x$config = c(
    x$config,
    lits(
      property_make(NA,"numeric","ratedLumen"),
      property_make(NA,"numeric","ratedLifetime"),
      property_make(NA,"logical","safeToDispose")
    ))
  return(x)
}

#' configure fishtank
#'
#' @param x 
#' @param ... 
#'
#' @return
#' @export
#'
#' @examples configure(item_make(type="fishtank"))
configure.fishtank = function(x,...) {
  print("hello imma fisssh taank")
  x = configure.item(x)
  x$config = c(
    x$config,
    list(
      property_make(NA,"numeric","volume"),
      property_make(NA,"numeric","numberOfFish"),
      property_make(NA,"logical","partyLobster")
    ))
  return(x)
}


#' Configure something
#'
#' @param x 
#' @param ... 
#'
#' @return something configured
#' @export
#'
#' @examples configure(item_make(type="fishtank"))
"set2<-" = function(x) UseMethod("set2<-",x)


#' Configure item
#'
#' @param x 
#' @param ... 
#'
#' @return configured item
#' @export
#'
#' @examples configure(item_make(type="fishtank"))
"set2<-.item" = function(x,property,value_class=NULL,value) {
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