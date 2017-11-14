//Collision with the Collision Object

//Allowing the grapple to hook onto anything with Collision  
if(place_meeting(x-hspeed,y,objCollision)){
	x += hsp;
}
if(place_meeting(x+hspeed,y,objCollision)){
	x -= hsp;
}

if(other.y < y && !place_free(x,y+vsp)){
	move_contact_solid(90,8);
	vsp = 0;
}

if(place_meeting(x,y+vsp,objCollision)){
	vsp = 0;
	move_contact_solid(270,12);
} 
