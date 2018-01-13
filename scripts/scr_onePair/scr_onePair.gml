///scr_onePair(hand);

var hand = argument0;
var cardMap = ds_map_create(); // Stores position of specific card from hand

ds_list_sort(hand,false);

// Create card map
for (var i = 0; i < 14; i++) {
	var list = ds_list_create();
	ds_map_add_list(cardMap, i, list);
}


// Add card from hand to card map by position
for (var position = 0; position < ds_list_size(hand); position++) {
	var m = ds_list_find_value(hand, position);
	var e = (m mod 13);// devide by 13, get the remainder 
	ds_list_add(ds_map_find_value(cardMap, e), position) // add position of the card from the hand to the map
}


var firstPair = -1;
for (var cardKey = 13; cardKey >= 1; cardKey--) { // Starting from King going to 2
	var size = ds_list_size(ds_map_find_value(cardMap, cardKey));
	
	if (size >= 2 && firstPair == -1) {
		firstPair = cardKey;
		break;
	}
}

// Check for Aces specifically 
var aceSize = ds_list_size(ds_map_find_value(cardMap, 0));
if (aceSize >= 2) {
	firstPair = 0;
}


if (firstPair != -1) {
	var onePair = ds_list_create();
	
	for (var i = 0; i < 2; i++) {
		var handPosition = ds_list_find_value(ds_map_find_value(cardMap, firstPair), i);
		var value = ds_list_find_value(hand, handPosition)
		ds_list_add(onePair, value);
	}
	
	for (var cardKey = 13; cardKey >= 0; cardKey--) { // Starting from King going to 2
		var size = ds_list_size(ds_map_find_value(cardMap, cardKey));
		if (size = 1 && ds_list_size(onePair) < 5) {
			var handPosition = ds_list_find_value(ds_map_find_value(cardMap, cardKey), 0);
			var value = ds_list_find_value(hand, handPosition)
			ds_list_add(onePair, value);
		} else if (ds_list_size(onePair) >= 5) {
			return onePair;
		}
	}
}

/*
var hand = argument0;
var onePair = ds_list_create();

//check for Four of a Kind 
var rank = 0;//start from ace
for (var cards = 0; cards < 14; cards++) {
	for (var suits = 0; suits < 4; suits++){
		var pos = ds_list_find_index(hand,rank);
		if pos >= 0{
		//if the rank exists in our hand
			var val = ds_list_find_value(hand, pos);
			ds_list_add(onePair, val);//add it to your twoPair
			if ds_list_size(onePair) > 1 {// if pair
				//return onePair;
			}
		}else{
			ds_list_clear(onePair);// if not, clear and keep checking
		}
	rank += 13;
	}
	rank -= 51;
	ds_list_clear(onePair);
}
*/