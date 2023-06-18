
function create_smoke_walk(count){
	while(count > 0){
		(instance_create_layer(x+hsp,(y-1),"Instances", smoke_walk));
			count--;
		}
}