///// PLAYER MOVEMENT /////
if(hspeed == 0) sprite_index = sprIdle;
if(keyboard_check(vk_right)) || (gamepad_button_check(0, gp_padr)) || (gamepad_axis_value(0,gp_axislh) > 0.1)
{
	image_xscale = 1;
	physics_apply_force(x, y, 310, 0);
	hspeed = 3;
	image_speed = 0.5;
	sprite_index= sprWalk; 
	if(active == true)
	{
		physics_apply_angular_impulse(fForceStrength);
		//fForceStrength -= 1;
		sprite_index = sprAmeliaSwing;
	}
	if(keyboard_check(vk_down)) || (gamepad_button_check(0, gp_shoulderr))
	{
		bCanSlide = true;
		tStopSlide = 2;
		bUnspaced = false;
		bOnGround = true;
		//physics_apply_force(x,y,580,0);
		sprite_index = sprSlide; 
	}
}

show_debug_message(fForceStrength);

if(keyboard_check(vk_left)) || (gamepad_button_check(0, gp_padl)) || (gamepad_axis_value(0,gp_axislh) < -0.1)
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
	if(keyboard_check(vk_down)) || (gamepad_button_check(0, gp_shoulderr))
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