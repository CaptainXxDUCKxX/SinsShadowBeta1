//HIT THAT BAT

hit = instance_place   (x, y, objBat);

if (hit != noone)
	{
	hit.batHP -= 1;
	instance_destroy ();
	}
	
//image_xscale = other.image_xscale; 