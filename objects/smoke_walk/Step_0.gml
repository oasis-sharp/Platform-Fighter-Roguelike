event_inherited();

if(xvel*dir < 0){ // this check causes the smoke to
	xvel = 0; // stop negatively accelerating
	x_accel = 0; // once its velocity is smaller than 0
	fade_speed=0.4;
}
