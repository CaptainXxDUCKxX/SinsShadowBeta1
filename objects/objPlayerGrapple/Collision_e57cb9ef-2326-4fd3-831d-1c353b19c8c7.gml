/// COLLISION ///
//x = other.x;
//if not moving with regular controls then do the below
//{
	if x < other.x
	{
		physics_apply_force(x, y, 250, 0);
	}

	if x > other.x
	{
		physics_apply_force(x, y, -250, 0);
	}
//}