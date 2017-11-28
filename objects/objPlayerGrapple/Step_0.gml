 /////STEP\\\\\

scrGrapple ();

scrMovement ();
	     
/// Slide Dash/Dodge Code. She can apply the force in the air for some reason... 
//Fix Application of force when vk_down is pressed in air
//limit the usage of slide dash to be much shorter;
//it can be used infinitely, given Amelia has stamina
if keyboard_check(vk_down) && keyboard_check(ord("D")) && iCurrentStamina > 14
{
	bUnspaced = true;
	iCurrentStamina -= 1; 
	physics_apply_force(x,y,1000,0);
	sprite_index = sprSlide;
}

if keyboard_check(vk_down) && keyboard_check(ord("A")) && iCurrentStamina > 14
{
	bUnspaced = true;
	iCurrentStamina -= 1; 
	physics_apply_force(x,y,-1000,0);
	sprite_index = sprSlide;
}


//physics collision events
phys_x = phy_position_x
phys_y = phy_position_y

//if Amelia Dies
if (objPlayerGrapple.y >= 1200) iCurrentHP = 0; 

if (iCurrentHP <= 0) 
{
	instance_destroy(objPlayerGrapple);
	game_restart();
} 

/////// JUMP CONDITIONS AND FUNCTIONALITY //////

//Used to see if the space key has been released since last successful jump
if(keyboard_check_released(vk_space))
{
	bUnspaced = true;
}

//Check to see if player is on the ground
if(place_meeting(x,y+5,objCollisionPhys) or place_meeting(x,y+5,objMovingPlatformPhys)) or place_meeting(x, y, objCollisionPhysHALFTOP) or place_meeting(x, y, objCollisionPhysHALF)
{
	bOnGround = true;
	bJumping = false;
} 
else
{
	bOnGround = false;
}

//Jump only under appropriate conditions
if(keyboard_check(vk_space)) && bUnspaced == true && bOnGround == true 
{
	bUnspaced = false;
	physics_apply_impulse(x, y, 0, -280);
	//iCurrentStamina -= 15; Turning off the usage of Stamina with jumping
	bJumping = true;
			///Jump functionality (pre-physics)///
			//vspeed += -15;
			//sprite_index = sprJump;
			//image_index = 
}

//display correct sprite while jumping
// attempting to put the proper fall animation in here as well
if bJumping == true
{
	if phy_linear_velocity_y <= 0
		sprite_index = sprJump;
	if phy_linear_velocity_y > 0
		sprite_index = sprFall;
		if sprite_index == sprFall && image_index >= 5 && image_index < 5
		{
			sprite_index = sprFall2; 
		}
}

if(active == true) && bUnspaced == true
{
	physics_apply_angular_impulse(100);
}

/// Attempting to get the correct animation for the Idle Jump
// this is hard... 
// FUCK

if bJumping == true && hspeed == 0
{
	if phy_linear_velocity_y <= 0
		sprite_index = sprJump;
	if phy_linear_velocity_y > 0	
		sprite_index = sprFall2;
} 