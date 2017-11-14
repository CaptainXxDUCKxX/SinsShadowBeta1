//Grapple functionality
if (keyboard_check_pressed (vk_up))
	{
	jointGrapple = physics_joint_rope_create (objAmelia, objGrappleBlock, (objAmelia.x + 9), (objAmelia.y - 41), objGrappleBlock.x, objGrappleBlock.y, 256, false);
	}
if (keyboard_check_released (vk_up)) physics_joint_delete (jointGrapple);

//PLAYER MOVEMENT
if (keyboard_check (ord ("D")))
	{
	image_xscale = 1;
	physics_apply_force (x, y, 500, 0);
	hspeed = 3;
	sprite_index = sprWalk;
	}

if (keyboard_check (ord ("A")))
	{
	image_xscale = -1;
	physics_apply_force (x, y, -500, 0);
	hspeed = -3;
	sprite_index = sprWalk;
	}

if (!keyboard_check (ord ("A"))) && (!keyboard_check (ord ("D")))
	{
	hspeed = 0;
	sprite_index = sprIdle;
	}

//JUMP CONDITIONS AND FUNCTIONALITY
if (keyboard_check_released (vk_space))
	{
	bUnspaced = true;
	}

if (place_meeting (x, (y + 5), objCollisionPhys))
	{
	bOnGround = true;
	}
else
	{
	bOnGround = false;
	}

if ((keyboard_check (vk_space)) && bUnspaced == true && bOnGround == true)
	{
	bUnspaced = false;
	physics_apply_impulse (x, y, 0, -460);
	//vspeed += -15;
	//sprite_index = sprAmeliaV2;
	}

//DEBUG MESSAGES
//show_debug_message ("bJumpImpulseSwitch: " + string (bJumpImpulseSwitch));
//show_debug_message ("bOnGround: " + string (bOnGround));
//show_debug_message ("bUnspaced: " + string (bUnspaced));

//GRAPPLE FUNCTIONALITY
if (keyboard_check_pressed (vk_up)) && (instance_exists (objGrappleBlock))
	{
	instNearestGP = instance_nearest (x, y, objGrappleBlock);
	
	if instNearestGP.y < y
		{
		mx = instNearestGP.x;
		my = instNearestGP.y;
		active = true;
		vspeed += -5.7;
		if (distance_to_object (objGrappleBlock) > iGrappleRadius)
			{
			active = false;
			}
		}
	}

if (active == true)
	{
	gravity = 0.1;
	x += (mx - x) = 0.5;
	y += (my - y) = 0.5;
	}

if (keyboard_check_released (vk_up))
	{
	active = false;
	}

/*
///FACE DIRECTION OF MOVEMENT
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

/*
//ATTACK
if (attack == true)
	{
	if (mouse_check_button (mb_left))
		{
		sprite_index = sprSwordAtk;
		image_index = -1;
		var xdiff = x - xprevious;
		
		if (! (xdiff = 0))
			{
			deltax = xdiff;
			}
		instance_create_layer (x+ sign (other.x), y + sign (other.y) * 32, "Player", objSwordHitbox);
		if (image_index >= 7) && (mouse_check_button_released (mb_left))
			{
			image_speed = 0;
			sprite_index = objAmelia;
			}
		}
		else
			{
			sprite_index = objAmelia;
			}
	}
*/

/*
if (iAttackTimer > 1)
	{
	attack = true;
	}

*/  