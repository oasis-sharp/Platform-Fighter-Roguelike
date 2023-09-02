
function debugger_on(){
	draw_set_color(c_black);
	draw_text(20,20, fastFallBuffer);
	draw_text(20,20, json_stringify(STATE));
}