//HIT THAT BAT

hit = instance_place   (x, y, objBat && objBat1 && objBat2);

if (hit != noone)
	{
	hit.batHP -= 1;
	instance_destroy ();
	}
	
 image_xscale = other.image_xscale; 