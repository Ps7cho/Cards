///scr_fourKind(hand);

var hand = argument0;
var fourKind = ds_list_create();

//check for Four of a Kind 
var rank = 0;//start from ace
for (var cards = 0; cards < 14; cards++) {
	for (var suits = 0; suits < 4; suits++){
		var pos = ds_list_find_index(hand,rank);
		if pos >= 0{ //if the rank exists in our hand
			var val = ds_list_find_value(hand, pos);
			ds_list_add(fourKind, val);//add it to your Four of a Kind 
			if ds_list_size(fourKind) > 3 {// if Four of a Kind 
				if pos = 0 {
					ds_list_add(fourKind, (ds_list_find_value(hand, pos+1)));	
				}else{
					ds_list_add(fourKind, (ds_list_find_value(hand, pos-1)));
				}
				return fourKind;// you got a Four of a Kind 
			}
		}else{
			ds_list_clear(fourKind);// if not, clear and keep checking
		}
	rank += 13;
	}
	rank -= 51;
	ds_list_clear(fourKind);
}