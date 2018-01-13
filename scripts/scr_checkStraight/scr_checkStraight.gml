///scr_checkStraight(hand);
var hand = argument0;
var newHand = ds_list_create();
var straight = ds_list_create();


var position = 0;
for (var card = 0; card < ds_list_size(hand); card++) {
	var m = ds_list_find_value(hand, position);
	var e = (m mod 13);// devide by 13, get the remainder 
	ds_list_add(newHand, e);//add the remainder to the new hand
	position++
}

//check for straights 
var rank = 0;//start from ace
for (var r = 0; r <= 14; r++){
	var pos = ds_list_find_index(newHand,rank);
	if pos >= 0{ //if the rank exists in the new hand
		var val = ds_list_find_value(hand, pos);
		ds_list_add(straight, val);//add it to your straight
		if ds_list_size(straight) > 4 {// if 5 in a row
			return straight;// you got a straight
		}
	}else{
		ds_list_clear(straight);// if not, clear and keep checking
	}
	if rank = 0{
		rank = 13;	//work back from king 
	}else{
		rank--
	}
}