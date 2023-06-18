function fetch_inputs(){ // fetches inputs being made on current frame
	
	rightHeld = keyboard_check(right);
	leftHeld = keyboard_check(left);
	jumpHeld = keyboard_check(jump);
	downHeld = keyboard_check(down); 
	upHeld = keyboard_check(up); 

	downPressed = keyboard_check_pressed(down);
	jumpPressed = keyboard_check_pressed(jump);
	normalPressed = keyboard_check_pressed(normal);
	dashPressed = keyboard_check_pressed(dash);
	
	var inputs = [rightHeld, leftHeld, jumpHeld, downHeld, upHeld, downPressed, jumpPressed, normalPressed];
	return inputs;
	
}


function set_controls(){
		
	right = ord("D");
	left = ord("A");
	down = ord("S");
	up = ord("W");
	
	jump = vk_space;
	normal = ord("P");
	dash = ord("L");

}