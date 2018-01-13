///scr_fourKind(hand);

var hand = argument0;
var threeKind = ds_list_create();

//check for Four of a Kind 
var rank = 0;//start from ace
for (var cards = 0; cards < 14; cards++) {
	for (var suits = 0; suits < 4; suits++){
		var pos = ds_list_find_index(hand,rank);
		if pos >= 0{ //if the rank exists in our hand
			var val = ds_list_find_value(hand, pos);
			ds_list_add(threeKind, val);//add it to your Four of a Kind 
			if ds_list_size(threeKind) > 2 {// if Four of a Kind 
				if pos <= 1 {
					repeat (2) ds_list_add(threeKind, (ds_list_find_value(hand, pos+1)));	
				}else{
					repeat (2) ds_list_add(threeKind, (ds_list_find_value(hand, pos-1)));
				}
				return threeKind;// you got a Four of a Kind 
			}
		}else{
			ds_list_clear(threeKind);// if not, clear and keep checking
		}
	rank += 13;
	}
	rank -= 51;
	ds_list_clear(threeKind);
}