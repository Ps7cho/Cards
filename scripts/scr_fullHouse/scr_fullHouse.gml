///scr_fullHouse(hand);

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


var threeOfAKindCard = -1;
var twoOfAKindCard = -1;
for (var cardKey = 13; cardKey >= 1; cardKey--) { // Starting from King going to 2
	var size = ds_list_size(ds_map_find_value(cardMap, cardKey));
	
	if (size >= 3 && threeOfAKindCard == -1) {
		threeOfAKindCard = cardKey;
		cardKey = 13;
	} else if (size >= 2 && twoOfAKindCard == -1) {
		if (cardKey != threeOfAKindCard) {
			twoOfAKindCard = cardKey;
		} 
		
	}
}

// Check for Aces specifically 
var aceSize = ds_list_size(ds_map_find_value(cardMap, 0));
if (aceSize >= 3) {
	threeOfAKindCard = 0;
} else if (aceSize >= 2) {
	twoOfAKindCard = 0;
}


if (threeOfAKindCard != -1 && twoOfAKindCard != -1) {
	var fullHouse = ds_list_create();
	
	for (var i = 0; i < 3; i++) {
		var handPosition = ds_list_find_value(ds_map_find_value(cardMap, threeOfAKindCard), i);
		var value = ds_list_find_value(hand, handPosition)
		ds_list_add(fullHouse, value);
	}
	
	for (var i = 0; i < 2; i++) {
		var handPosition = ds_list_find_value(ds_map_find_value(cardMap, twoOfAKindCard), i);
		var value = ds_list_find_value(hand, handPosition)
		ds_list_add(fullHouse, value);
	}
	l = instance_create(0,0,playerHand);
	l.handvalue = fullhouse;
	
	return fullHouse;
}

/*
var hand = argument0;
var fullHouse = ds_list_create();

//check for Four of a Kind 
var rank = 0;//start from ace
for (var cards = 0; cards < 14; cards++) {
	for (var suits = 0; suits < 4; suits++){
		var pos = ds_list_find_index(hand,rank);
		if pos >= 0{ //if the rank exists in our hand
			var val = ds_list_find_value(hand, pos);
			ds_list_add(fullHouse, val);//add it to your fullHouse
			if ds_list_size(fullHouse) > 2 {// if 3 of a kind 
				repeat (3){
					var pos = ds_list_find_index(hand, rank);// remove them 
					ds_list_delete(hand, pos);
					rank -= 13;
				}
				var rank = 0;//start from ace
				var set = 0; 
				for (var cards = 0; cards < 14; cards++) {
					for (var suits = 0; suits < 4; suits++){
						var pos = ds_list_find_index(hand,rank);
						if pos >= 0{ //if the rank exists in our hand
							set ++;
							var val = ds_list_find_value(hand, pos);
							ds_list_add(fullHouse, val);//add it to your fullHouse
							if ds_list_size(fullHouse) > 4 {// if fullHouse 
								return fullHouse;// you got a full House 
							}
						}else{
							if set = 1{ // if we added one, Remove it
								ds_list_delete(fullHouse, ds_list_size(fullHouse)-1);
								set = 0;
							}
						}
					rank += 13;
					}
					rank -= 51;
					if set = 1{
						ds_list_delete(fullHouse, ds_list_size(fullHouse)-1);// if we added one, Remove it
						set = 0;
					}
				}
			}
		}else{
			ds_list_clear(fullHouse);// if not, clear and keep checking
		}
	rank += 13;
	}
	rank -= 51;
	ds_list_clear(fullHouse);
}
*/