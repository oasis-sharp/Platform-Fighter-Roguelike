function check_collision(){
	
	var px = sign(hsp);
	x = round(x);
	y = round(y);
	
	if (place_meeting(x+hsp,y, floor_obj))
	{
		// Player is colliding with a block, so adjust position to resolve the collision
		while (!place_meeting(x+px,y, floor_obj))
		{
			x = x + px;
	    }
		
	    hsp = 0;	
	}
	
	var px = sign(vsp);
	
	if (place_meeting(x,y+vsp, floor_obj))
	{
		// Player is colliding with a block, so adjust position to resolve the collision
	    while (!place_meeting(x,y+px, floor_obj))
	    {
	        y = y + px;
	    }
		
		// Create landing particles
		if(vsp > 2){
			create_smoke(abs(vsp)*5);
		}
		
		vsp = 0;
		add_to_array(STATE, "grounded");
		
	}
	
	
	if (place_meeting(x,y+vsp,plat_obj))
	{
		
		var plat = instance_place(x, y+vsp, plat_obj);
		
		if(vsp >= 0) && !platDrop && plat.y >= y {
	
		    while (!place_meeting(x,y+px,plat_obj))
		    {
		        y = y + px;
		    }
			
			// Create landing particles
			if(vsp > 2){
				create_smoke(abs(vsp)*5);
			}
			
			vsp = 0;
			add_to_array(STATE, "grounded");
			fastFallBuffer = 2;
		
		}
	}
	
	
	x = x + hsp;
	y = y + vsp;
}
