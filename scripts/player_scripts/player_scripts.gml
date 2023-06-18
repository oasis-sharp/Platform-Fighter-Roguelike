
function player_script(){
	
	fetch_inputs();
	
	horizontal_movement();

	// Apply gravity
	vsp = vsp + grav;
	
	if(vsp > 0){
		vsp+=grav_add;	
	}
	
	if(find_in_array(STATE,array_length(STATE), "fastfall") != -4){
		vsp+=grav_ff_add;
	}
	
	landing();
	jumping();
	wavedash();

	walljump();
	check_collision();
	
	animation();
	
	x = x + hsp;
	y = y + vsp;
}


function check_collision(){
	
	var px = sign(hsp);
	x = round(x);
	y = round(y);
	
	if (place_meeting(x+hsp,y,block_par))
	{
		// Player is colliding with a block, so adjust position to resolve the collision
		while (!place_meeting(x+px,y,block_par))
		{
			x = x + px;
	    }
		
	    hsp = 0;	
	}
	
	var px = sign(vsp);
	
	if (place_meeting(x,y+vsp,block_par))
	{
		// Player is colliding with a block, so adjust position to resolve the collision
	    while (!place_meeting(x,y+px,block_par))
	    {
	        y = y + px;
	    }

	    vsp = 0;
	}
}

function walljump(){
	
	var px = sign(hsp);
	var move = (rightHeld - leftHeld);

	if(place_meeting(x+move,y,block_par)){
		
		if(find_in_array(STATE,array_length(STATE), "grounded") == -4 and vsp > 0){
			// Player is in the air and moving down, so perform wallslide
			vsp /= wallslide_f;
		}
	
		if(move = px and jumpPressed and find_in_array(STATE,array_length(STATE), "grounded") == -4){
			// Player presses jump and is in the air and against a wall, so perform walljump
			hsp = -move * walljump_mul;
			vsp = walljump_height;
			image_xscale = -move*scale;
	
		}
	}		
}


function horizontal_movement(){
	
	// Calculate the horizontal movement
	var move = (rightHeld - leftHeld);
	
	// If the player is holding a direction and is grounded
	if(move != 0 and find_in_array(STATE,array_length(STATE), "grounded") != -4 && !(wavedashf > 0)){
		if(move = 1){
			if(hsp < walksp){
				hsp = move * walksp;
			}
		}
		else{
			if(hsp > -walksp){
				hsp = move * walksp;
			}
		}
	}
	
	else{ 
		// If the player is holding a direction and is not grounded
		if(find_in_array(STATE, array_length(STATE), "grounded") == -4 and move!=0){
			hsp+=air_accel*move;
		}
		
		// If the player is grounded
		if(find_in_array(STATE,array_length(STATE), "grounded") != -4){
			if !(wavedashf > 0){
				hsp*=fric;
			}
			add_to_array(STATE, "sliding");
			if(abs(hsp) < 1){
				hsp = 0;
				delete_from_array(STATE, "sliding");
			}
		}
	}	
}


function jumping(){
	// If the player is grounded and is holding the jump button
	if(find_in_array(STATE,array_length(STATE), "grounded") != -4 and (jumpPressed)){
		jsquatf = jumpsquat_frames;
	}	
	
	if(jsquatf > 0){
		jsquatf--;	
	}
	
	if(jsquatf = 0){
		if(jumpHeld){
			vsp=jump_height;
		}
		else{
			vsp=jump_height_s;	
		}
		jsquatf--;	
	}

	if(vsp > max_air_vsp){
		
		if(find_in_array(STATE, array_length(STATE), "fastfall") == -4){
			vsp=max_air_vsp;
		}
		else{
			if(vsp > max_air_vsp_ff){
				vsp=max_air_vsp_ff;
			}
		}
	}
	
	
	if(find_in_array(STATE, array_length(STATE), "grounded") == -4){
		if(abs(hsp) > max_air_hsp){
		
			hsp=max_air_hsp*sign(hsp);
		}
	
		if(vsp >= -1){
			if(downPressed){
				add_to_array(STATE, "fastfall");	
			}	
		}
	}
}



function landing(){
	// If the player is colliding with a block object
	if (place_meeting(x,y+vsp, block_par)) {
		// If the player was not grounded before
		if(add_to_array(STATE, "grounded")){
			
			delete_from_array(STATE, "fastfall");
			
			// Create landing particles
			if(vsp > 2){
				create_smoke(abs(vsp)*5);
			}
		}
	}
	// If the player is not colliding with a block object
	else{
		delete_from_array(STATE, "grounded");
	}	
}

function wavedash(){
	if(jsquatf > 0 && dashPressed){
		jsquatf = -1;
		hsp=wavedash_speed*(rightHeld-leftHeld);
		wavedashf = wavedash_time;
		create_smoke_walk(wavedash_speed);
	}
	
	if(wavedashf > -1){
		wavedashf--;
		create_trail(5, c_black, 75, 10, 1.02, x, y);
	}
}