#generic configure anything
configure = function(x) UseMethod("configure",x)
validite = function(x) UseMethod("validate",x)
'set<-' = function(x,...,value) UseMethod("set<-",x)
Get = function(x,...,value) UseMethod("Get",x)
