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

	    vsp = 0;
	}
	
	
	if (place_meeting(x,y,plat_obj))
	{
		if(vsp > 0) && !platDrop {
	
		    while (!place_meeting(x,y+px,plat_obj))
		    {
		        y = y + px;
		    }

		    vsp = 0;
		}
	}
	
	
	x = x + hsp;
	y = y + vsp;
}
