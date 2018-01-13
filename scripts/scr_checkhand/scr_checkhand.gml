//checkhand(cards);

var hand = argument0;

var flush = scr_flush(hand);

// if no flush was found check for Straight
var straight = scr_checkStraight(hand);

if flush{
	var royalFlush = scr_royalFlush(flush);
	if royalFlush{
		handValue = "Royal Flush";
		return royalFlush;
	}
	var straightFlush = scr_checkStraight(flush);
	if straightFlush{
		handValue = "Straight Flush";
		return 	straightFlush;
	}	
}

var fourKind = scr_fourKind(hand);
if fourKind {
	handValue = "Four of a Kind";
	return fourKind;
}

//check for a full house
var fullHouse = scr_fullHouse(hand);
if fullHouse {
	handValue = "Full House";
	return fullHouse;
}


if flush{
	handValue = "Flush";
	cleanFlush(flush);
	return 	flush;
}

if straight{
	handValue = "Straight";
	return straight;	
}

var threeKind = scr_threeKind(hand);
if threeKind{
	handValue = "Three of a Kind";
	return threeKind;
}


var twoPair = scr_twoPair(hand);
if twoPair{
	handValue = "Two Pair";
	return twoPair;
}

var onePair = scr_onePair(hand);
if onePair {
	handValue = "One Pair"
	return onePair;
}