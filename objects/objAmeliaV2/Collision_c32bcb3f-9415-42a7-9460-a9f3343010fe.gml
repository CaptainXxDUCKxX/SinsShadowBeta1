/// @description Insert description here
// You can write your code in this editor
if(place_meeting(x-hspeed,y,objBreakBlock)){
	x += hsp;
}
if(place_meeting(x+hspeed,y,objBreakBlock)){
	x -= hsp;
}

if(other.y < y && !place_free(x,y+vsp)){
	move_contact_solid(90,8);
	vsp = 0;
}

if(place_meeting(x,y+vsp,objBreakBlock)){
	vsp = 0;
	move_contact_solid(270,12);
} 
