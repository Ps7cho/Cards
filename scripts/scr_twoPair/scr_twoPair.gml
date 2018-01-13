///scr_twoPair(hand);

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


var firstTwoOfAKindCard = -1;
var secondTwoOfAKindCard = -1;
for (var cardKey = 13; cardKey >= 1; cardKey--) { // Starting from King going to 2
	var size = ds_list_size(ds_map_find_value(cardMap, cardKey));
	
	if (size >= 2 && firstTwoOfAKindCard == -1) {
		firstTwoOfAKindCard = cardKey;
		cardKey = 13;
	} else if (size >= 2 && secondTwoOfAKindCard == -1) {
		if (cardKey != firstTwoOfAKindCard) {
			secondTwoOfAKindCard = cardKey;
		} 
	}
}

// Check for Aces specifically 
var aceSize = ds_list_size(ds_map_find_value(cardMap, 0));
if (aceSize >= 2) {
	secondTwoOfAKindCard = firstTwoOfAKindCard;
	firstTwoOfAKindCard = 0
}


if (firstTwoOfAKindCard != -1 && secondTwoOfAKindCard != -1) {
	var twoPair = ds_list_create();
	
	for (var i = 0; i < 2; i++) {
		var handPosition = ds_list_find_value(ds_map_find_value(cardMap, firstTwoOfAKindCard), i);
		var value = ds_list_find_value(hand, handPosition)
		ds_list_add(twoPair, value);
	}
	
	for (var i = 0; i < 2; i++) {
		var handPosition = ds_list_find_value(ds_map_find_value(cardMap, secondTwoOfAKindCard), i);
		var value = ds_list_find_value(hand, handPosition)
		ds_list_add(twoPair, value);
	}
	
	for (var cardKey = 13; cardKey >= 0; cardKey--) { // Starting from King going to 2
		var size = ds_list_size(ds_map_find_value(cardMap, cardKey));
	
		if (size = 1) {
			var handPosition = ds_list_find_value(ds_map_find_value(cardMap, cardKey), 0);
			var value = ds_list_find_value(hand, handPosition)
			ds_list_add(twoPair, value);
			return twoPair;
		}
	}
}

/*
var hand = argument0;
var twoPair = ds_list_create();

//check for Four of a Kind 
var rank = 0;//start from ace
for (var cards = 0; cards < 14; cards++) {
	for (var suits = 0; suits < 4; suits++){
		var pos = ds_list_find_index(hand,rank);
		if pos >= 0{ //if the rank exists in our hand
			var val = ds_list_find_value(hand, pos);
			ds_list_add(twoPair, val);//add it to your twoPair
			if ds_list_size(twoPair) > 1 {// if pair
				var set = 0; 
				while suits < 4{
					rank += 13;
					suits++;
				}	
				rank -=51;
				for (var cards = 0; cards < 13; cards++) {
					for (var suits = 0; suits < 4; suits++){
						var pos = ds_list_find_index(hand,rank);
						if pos >= 0{ //if the rank exists in our hand
							set ++;
							var val = ds_list_find_value(hand, pos);
							ds_list_add(twoPair, val);//add it to your twoPair
							if ds_list_size(twoPair) > 3 {// if pair 
								rank = 0;
								for (var cards = 0; cards < 13; cards++) {
									var value = ds_list_find_value(hand, cards);
									pos = ds_list_find_index(twoPair, value);
									if pos == -1{
										ds_list_add(twoPair, (ds_list_find_value(hand, cards)));
									}
							//	return twoPair;// you got two pair
								}
							}
						}else{
							if set = 1{ // if we added one, Remove it
								ds_list_delete(twoPair, ds_list_size(twoPair)-1);
								set = 0;
							}
						}
						rank += 13;
					}
					rank -= 51;
					if set = 1{
						ds_list_delete(twoPair, ds_list_size(twoPair)-1);// if we added one, Remove it
						set = 0;
					}
				}
			}
		}else{
			ds_list_clear(twoPair);// if not, clear and keep checking
		}
	rank += 13;
	}
	rank -= 51;
	ds_list_clear(twoPair);
}
*/