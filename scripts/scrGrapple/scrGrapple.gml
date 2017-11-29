 ///// Grapple functionality /////
// The iGrappleRadius variable seems to be a bit janky. She can grapple when she's near an instance of objGrappleBlock, but she does not grapple the nearest one
// only the first one
// it doesn't matter what instance layer the Grapple Point is on, either 
// Need to figure out why it's only drawing the physics joint rope on that singular objGrappleBlock... 
if(keyboard_check_pressed(vk_up)) && (instance_exists(objGrappleBlock)) && (distance_to_object(objGrappleBlock) < iGrappleRadius)
{
	active = true;
	instNearestGP = instance_nearest(x, y, objGrappleBlock);
	jointGrapple = physics_joint_rope_create(objPlayerGrapple, instNearestGP, (objPlayerGrapple.x + 9), (objPlayerGrapple.y - 41), instNearestGP.x, instNearestGP.y, 100, true); 
	bJumping = false;
	
/// code to get momentum-based swinging physics	///
// if movement is stopped, making it harder to apply force
	if (hspeed == 0)
	{
		phy_linear_damping -= phy_linear_damping; 
	} 

/*
	if instNearestGP.y < y
	{
		mx = instNearestGP.x;
		my = instNearestGP.y;*/
	if(distance_to_object(objGrappleBlock) > iGrappleRadius) 
	{ 
		active = false;
	}
	
}
//}

if(keyboard_check_released(vk_up)) && (active == true)
{
	physics_joint_delete(jointGrapple);
	active = false;
	
}