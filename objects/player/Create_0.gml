/// @description here we go bruh

// nntntubtruhhhhhhhhhhhhhhhhhhhhhhh

// ok 
// fine
// lets initialise some shit

// i cant code for shit bruh

// FUCK MY LIFE

// GAMEPLAY

STATE = []

hsp = 0;
vsp = 0;

jsquatf = -1;

wavedashf = 0;
initialf = 0;

scale=4;

image_xscale = scale;
image_yscale = scale;

ECBID = instance_create_layer(x,y, "Instances", platECB_obj); 

with ECBID {
	owner = other.id	
}


// ATTRIBUTES

brawler_init();

// CONTROLS

set_controls();
fetch_inputs();



