///scr_flush(hand);

var hand = argument0;

ds_list_sort(hand,true);

var clubs = ds_list_create();
var spades = ds_list_create();
var hearts = ds_list_create();
var diamonds = ds_list_create();

var position = 0;

for (var card = 0; card < ds_list_size(hand); card++) {
    var m = ds_list_find_value(hand, position);
        var e = (m div 13);
    switch (e) {
           case 0: ds_list_add(clubs, m); break;
           case 1: ds_list_add(diamonds, m); break;
           case 2: ds_list_add(hearts, m); break;
           case 3: ds_list_add(spades, m); break;
    }
    position++;
}
if ds_list_size(clubs) >= 5{
   return clubs;
} 
if ds_list_size(spades) >= 5{
   return spades;
} 
if ds_list_size(hearts) >= 5{
   return hearts;
} 
if ds_list_size(diamonds) >= 5{
   return diamonds;
}