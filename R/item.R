item_make = function(type=NULL,...) {
  x = list(type=type,misc = list(...))
  class(x) = c(type,"item")
  x = configure(x)
  return(x)
}

configure.item = function(x,...) {
  x$config = list(
    property_make(value=NA,value_class = "character",name="place"),
    property_make(NA,"numeric","ratedWattage"),
    property_make(NA,"numeric","dailyWattHours")
  )
  return(x)
}

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
