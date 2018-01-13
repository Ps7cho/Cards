globalvar delt;


var deck = ds_list_create();//create the list
randomize();
var q = 0;
var s = 0;
var c = 0;
for(var u = 0; u < 4; u++) // 4 suits
{
    for(var i = 0; i < 13; i++) { // 13 cards for each suit
        ds_list_add(deck, q,);  //add each card to the deck
        q++;
    }
}

ds_list_shuffle(deck);//shuffle the deck

var xx = room_width -100;
var yy = 20;

totalPlayers = 5; //temporary

for (var players = 0; players < totalPlayers; players++){
		var player = instance_create_layer(xx,yy,"Table",oPlayer);
		yy += 145;
}


var position = 0;

for (var c = 0; c < 52; c++) {
	with oPlayer{
		if position < 52 {
			ds_list_add(hand, (ds_list_find_value(deck, position)));
			position++;
		}
	}

}

with oPlayer {
	scr_placehand(hand,x,y);	
}

