Get.item = function(x,property) {
  available_properties = sapply(x$config,function(z) class(z)[1])
  match_ind = match(property,available_properties)[1]
  x$config[[match_ind]]
}
