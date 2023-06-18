
function create_smoke(count){
	while(count > 0){
		(instance_create_layer(x+(hsp*3),(y-1),"Instances", smoke_land));
			count--;
		}
}