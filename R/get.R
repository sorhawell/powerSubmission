
#' Get a property from something
#'
#' @param x 
#' @param ... 
#'
#' @return
#' @export
#'
#' @examples
Get = function(x,...) {UseMethod("Get",x) }

#' Get a property from something
#'
#' @param x 
#' @param ... 
#'
#' @return
#' @export
#'
#' @examples
Get2 = function(x,...) {UseMethod("Get",x) }


#' get a property of an item
#'
#' @param x 
#' @param property 
#'
#' @return
#' @export
#'
#' @examples
Get.item = function(x,property) {
  available_properties = sapply(x$config,function(z) class(z)[1])
  match_ind = match(property,available_properties)[1]
  x$config[[match_ind]]
}
