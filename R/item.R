
#' make a new item
#'
#' @param type 
#' @param configure_now
#' @param ... 
#'
#' @return the new item of class input type + item
#' @export
#'
#' @examples item_make(type="fishtank")
item_make = function(type=NULL,configure_now=TRUE,...) {
  x = list(type=type,misc = list(...))
  class(x) = c(type,"item")
  if(configure_now) x = configure(x)
  return(x)
}