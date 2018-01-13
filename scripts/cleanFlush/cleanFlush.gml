//cleanFlush(flush);
var flush = argument0;


ds_list_sort(flush,false);

while ds_list_size(flush) > 5 { // if there are more than 6 in a flush 
	if ds_list_find_value(flush, 0) = 0 {// check if any are Aces
		ds_list_delete(flush, 1);// if we have Aces skip it
	}else if ds_list_find_value(flush, 0) = 13{
		ds_list_delete(flush, 1);
	}else if ds_list_find_value(flush, 0) = 26{
		ds_list_delete(flush, 1);
	}else if ds_list_find_value(flush, 0) = 39{
		ds_list_delete(flush, 1);
	}else{
		ds_list_delete(flush, 0);// if not just remove the lowes card
	}
}