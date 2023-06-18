/// @function add_to_array(array, term);

function add_to_array(array, term){
	if(find_in_array(array,array_length(array), term) == -4){
		array_push(array, term)
		return true;
	}
	
	return false;
}



/// @function find_in_array(array, size, term);

function find_in_array(array, i, term){
    i--;
     
    if (i < 0) { return -4; }
	
	else{
	    if (array[i] == term) { return i; }
	}

    return find_in_array(array, i, term);
}



/// @function delete_from_array(array, term);

function delete_from_array(array, term){
	
	var find = find_in_array(array, array_length(array), term);
	
	if(find != -4){
		array_delete(array, find, 1);
		return true;
	}
	else{
		return false;	
	}
}
