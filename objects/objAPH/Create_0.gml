/// THIS OBJECT IS A PLACEHOLDER FOR AMELIA 

//fixtureAmelia creates this object as a fixture in physics
//then, you give it a shape, and create a rope between the two objects

fixtureAmelia = physics_fixture_create();
physics_fixture_set_circle_shape(fixtureAmelia, 5);

iLinkCounter = 10;
offset_y = 10;
host = self;
grapple = instance_create_layer(x, y, "Instances", objRope);
attach = physics_joint_distance_create(grapple, objGP, grapple.x, grapple.y, objGP.x, objGP.y, false);
rope = physics_joint_rope_create(objAPH, objGP, objAPH.x, objAPH.y, objGP.x, objGP.y, 256, false);

physics_fixture_bind(fixtureAmelia, objRope);
physics_fixture_bind(fixtureAmelia, objGP);


physics_joint_set_value(attach, phy_joint_damping_ratio, 1);
physics_joint_set_value(attach, phy_joint_frequency, 100);

next_rope = instance_create_layer(x, y + offset_y, "Instances", objRope);
//physics_joint_set_value(next_rope, phy_joint_damping_ratio, 1);


with(grapple)
{
	parent = other.id;
}
 
/// Creating the links in the rope, giving it rope-like physics
// if I leave it, it doesn't work

/*
repeat (iLinkCounter)
{
	iLinkCounter -= 1;
	offset_y += 50;
	last_rope = next_rope;
	next_rope = instance_create_layer(x, y + offset_y, "Instances", objRope);
	
	link = physics_joint_distance_create(last_rope, next_rope, last_rope.x, last_rope.y, next_rope.x, next_rope.y, false);
	physics_joint_set_value(link, phy_joint_damping_ratio, 1);
	physics_joint_set_value(link, phy_joint_frequency, 10);
	
	with(next_rope)
	{
		parent = other.last_rope;
	}
	if iLinkCounter = 1
	{
		
		//link = physics_joint_distance_create(objAPH, objGP, objAPH.x, objAPH.y, objGP.x, objGP.y, false);
		//link = physics_joint_weld_create(objAPH, objGP, objGP.x, objGP.y, 0, 10, 12, false);
	} 
}

*/