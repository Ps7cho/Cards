//placehand(hand, xx, yy);

var cards = argument0;
var xx = argument1;
var yy = argument2;


var position = 0;

for (var c = 0; c < ds_list_size(cards); c++) {
    var m = instance_create(xx, yy, obj_cards);
    m.image_index = ds_list_find_value(cards, position);
    xx -= 30;
    position++;
}
global.delt = true;

var hand = scr_checkhand(cards);

// check for Straight Flush
   
if hand{
	
   
   position = 0;
	// place your hand
	for (var c = 0; c < ds_list_size(hand); c++) {
	    var m = instance_create(xx-100, yy, obj_cards);
	    m.image_index = ds_list_find_value(hand, position);
	    xx -= 30;
	    position++;
	}
	
}


