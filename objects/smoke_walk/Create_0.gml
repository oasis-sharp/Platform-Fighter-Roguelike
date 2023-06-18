event_inherited();

dir = player.image_xscale;


length = 50;
depth = 0;
image_blend = c_black;

xvel = random_range(0,1)*dir/5;
yvel = -0.03;

fade_speed = 0.05;
y_accel = random_range(0, -1)/100;
x_accel = 0;
				
image_xscale = random_range(1,2);
image_yscale = image_xscale;

