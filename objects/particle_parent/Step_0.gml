xvel+=x_accel;
yvel+=y_accel;
image_alpha-=fade_speed;
length--;

x+=xvel;
y+=yvel;

if(length < 0){
	instance_destroy();	
}