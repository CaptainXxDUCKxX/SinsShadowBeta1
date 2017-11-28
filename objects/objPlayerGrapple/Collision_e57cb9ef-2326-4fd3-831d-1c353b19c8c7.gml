/// COLLISION ///
//x = other.x;
//if not moving with regular controls then do the below
//{
	if x < other.x
	{
		physics_apply_force(x, y, 245, 0);
		sprite_index = sprIdle;
	}

	if x > other.x
	{
		physics_apply_force(x, y, -245, 0);
		sprite_index = sprIdle;
	}
//}