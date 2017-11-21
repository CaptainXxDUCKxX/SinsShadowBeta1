 /////STEP\\\\\

// INHERIT MOVING PLATFORM MOVEMENT 
//event_inherited();
if place_meeting(x, y+5, objMovingPlatformPhys)
{
	show_debug_message("Hi HOOOOOOOOOOO");
}
//phy_speed_x = -2;

///// Grapple functionality /////
if(keyboard_check_pressed(vk_up)) && (instance_exists(objGrappleBlock)) && (distance_to_object(objGrappleBlock) < iGrappleRadius)
{
	active = true;
	instNearestGP = instance_nearest(x, y, objGrappleBlock);
	bJumping = false;
	if instNearestGP.y < y
	{
		mx = instNearestGP.x;
		my = instNearestGP.y;
		jointGrapple = physics_joint_rope_create(objPlayerGrapple, objGrappleBlock, (objPlayerGrapple.x + 9), (objPlayerGrapple.y - 41), objGrappleBlock.x, objGrappleBlock.y, 100, false);
		if(distance_to_object(objGrappleBlock) > iGrappleRadius)
		{ 
			active = false;
		}
	}
}

if(keyboard_check_released(vk_up)) && (active == true)
{
	physics_joint_delete(jointGrapple);
	active = false;
	
}

///// PLAYER MOVEMENT /////
if(hspeed == 0) sprite_index = sprIdle;
if(keyboard_check(ord("D")))
{
	image_xscale = 1;
	physics_apply_force(x, y, 310, 0);
	hspeed = 3;
	sprite_index= sprWalk; 
	if(active == true)
	{
		physics_apply_angular_impulse(100);
		sprite_index = sprAmeliaSwing;
	}
	if(keyboard_check(vk_down))
	{
		bCanSlide = true;
		tStopSlide = 2;
		bUnspaced = false;
		bOnGround = true;
		//physics_apply_force(x,y,580,0);
		sprite_index = sprSlide; 
	}
}

if(keyboard_check(ord("A")))
{
	image_xscale = -1;
	physics_apply_force(x, y, -310, 0);
	hspeed = -3;
	sprite_index = sprWalk;
	if(active == true)
	{
		physics_apply_angular_impulse(-100);
		sprite_index = sprAmeliaSwing;
	}
	if(keyboard_check(vk_down))
	{
		bCanSlide = true; 
		tStopSlide = 2;
		bUnspaced = false;
		bOnGround = true;
		//physics_apply_force(x,y,-580,0);
		sprite_index = sprSlide; 
	}
}

if(active == true) && (hspeed == 0)
{
	sprite_index = sprHang; 
}	

if(!keyboard_check(ord("A"))) && !keyboard_check(ord("D")) hspeed = 0;


if position_meeting(x,y, objMovingPlatformPhys) 
  {
	  //path_start(pathMovingPlatform, iPlatformSpeed, path_action_restart, 0);
	  //gravity:=0;
	  //vspeed:=0;
	  //hspeed = other.hspeed;
  }

/*
if position_meeting(x-sprite_xoffset+sprite_width/2,y-sprite_yoffset+sprite_height,objMovingPlatformPhys)
  {
  objID=instance_position(x-sprite_xoffset+sprite_width/2,y-sprite_yoffset+sprite_height,objMovingPlatformPhys)
  hspeed = objID.hspeed;
  }
else
  {
  hspeed:=0;
  }
*/      
	     
/// Slide Dash/Dodge Code. She can apply the force in the air for some reason... 

//Fix Application of force when vk_down is pressed in air
//limit the usage of slide dash to be much shorter; it can be used infinitely, given Amelia has stamina
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


/////// JUMP CONDITIONS AND FUNCTIONALITY //////

//Used to see if the space key has been released since last successful jump
if(keyboard_check_released(vk_space))
{
	bUnspaced = true;
}

//Check to see if player is on the ground
if(place_meeting(x,y+5,objCollisionPhys) or place_meeting(x,y+5,objMovingPlatformPhys))
{
	bOnGround = true;
	bJumping = false;
} 
else
{
	bOnGround = false;
}

//Jump only under appropriate conditions
if(keyboard_check(vk_space)) && bUnspaced == true && bOnGround == true && iCurrentStamina > 14
{
	bUnspaced = false;
	physics_apply_impulse(x, y, 0, -220);
	iCurrentStamina -= 15;
	bJumping = true;
	///Jump functionality (pre-physics)///
	//vspeed += -15;
	//sprite_index = sprJump;
	//image_index = 
}

//display correct sprite while jumping
if bJumping == true
{
	if phy_linear_velocity_y <= 0
		sprite_index = sprJump;
	if phy_linear_velocity_y > 0
		sprite_index = sprFall;
}

//display correct sprite while falling
if active == false && phy_linear_velocity_y > 0 && bOnGround == false
{
	sprite_index = sprFall;
}
//show_debug_message(bJumping);

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
/*
if place_meeting(x, y, objMovingPlatform) 
{
	
}
*/
//Bat attack cooldown
/*
if alarm_get(0) <= 0
	{
	bCanTakeDamage = 1;
	}
	
if bGotHit = 1
{
	bGotHit = 0;
	alarm_set(0, iDamageBuffer);
}
*/


/*
/// FACE DIRECTION OF MOVEMENT    
if (x < iPrevFrameX)
	{
		image_xscale = -1;
	}
else if (x > iPrevFrameX)
	{
		image_xscale = 1;
	}
iPrevFrameX = x;
*/

//Attack isn't working, and hitbox isn't aligned with the Sword; 
//We'll have to change that functionality anyways, since we're taking the sword
//off of Amelia's sprite


/// ATTACK 
if(attack == true){
	if(mouse_check_button(mb_left)) {
		sprite_index = sprSwordAtk; 
		image_index = -1;
		var xdiff = x - xprevious;
	
		if(!(xdiff = 0)){
			deltax = xdiff; 
		}
		instance_create_layer(x+ sign(other.x),y+sign(other.y)*32,"Player",objSwordHitbox);
		if(image_index >= 7) && (mouse_check_button_released(mb_left)){
			image_speed = 0;
			sprite_index = objPlayerGrapple;
		} 
	}else {
		sprite_index = objPlayerGrapple;
	}
	audio_play_sound(slashAttack, 5, false);

}



/*
if(iAttackTimer > 1){
	attack = true; 
}

*/

///// DEBUG MESSAGES /////
//show_debug_message("bJumpImpulseSwitch: " + string(bJumpImpulseSwitch));
//show_debug_message("bOnGround: " + string(bOnGround));
//show_debug_message("bUnspaced: " + string(bUnspaced));
//show_debug_message(iCurrentHP);