if (place_meeting ((x - hspeed), y, objBuildBlock))
	{
	x += hspeed;
	}
if (place_meeting ((x + hspeed), y, objBuildBlock))
	{
	x -= hspeed;
	}

if ((other.y < y) && (!place_free(x,y+speed)))
	{
	move_contact_solid (90, 8);
	vspeed = 0;
	}

if (place_meeting (x, (y+speed), objBuildBlock))
	{
	vspeed = 0;
	move_contact_solid (270, 12);
	}