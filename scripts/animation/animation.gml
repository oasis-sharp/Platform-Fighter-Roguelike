
function animation(){
	
// this is some spaghetti code and is probably getting all redone
// later on, its just a placeholder rn

	var move = (rightHeld - leftHeld);
	
	
	// Set the sprite to the walking sprite if the player is holding a direction
	if(move != 0){
		if(find_in_array(STATE,array_length(STATE), "grounded") != -4){
			image_xscale=move*scale;
		}
		sprite_index = walk;
		image_speed = 0.4;
		add_to_array(STATE, "walking");
		delete_from_array(STATE, "idle");
	}
	// Set the sprite to the idle sprite if the player is not holding a direction
	else{
		sprite_index = idle;
		delete_from_array(STATE, "walking");
		add_to_array(STATE, "idle");
	}
	

	if(jsquatf > 0){
		sprite_index = jumpsquat;	
		image_index = jumpsquat_frames-jsquatf;
	}
	
	if(wavedashf > 1){
		sprite_index = initial;	
		image_index = wavedash_time-wavedashf;
	}
	
}