
my_item = item_make()
my_item = configure(my_item)
if(!all.equal(class(my_item),"item")) stop("generic item is wrong")

your_item = item_make(type="fish tank")
your_item = configure(your_item)
your_item

their_item = item_make(type="lamp")
their_item = configure(their_item)
their_item

configure(1:4)


property_make(42,"wattage")

my_fishtank = item_make("fishtank")
set(my_fishtank,"place") = "living_room"
set(my_fishtank,"non_Defined_property") = "living_room"
Get(my_fishtank,"place")


my_fishtank = item_make(type="fishtank")
set(my_fishtank,"volume") = 100 
