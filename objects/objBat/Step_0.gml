//Bat AI pathing
if instance_exists(objPlayerGrapple)
	{
	if (distance_to_object(objPlayerGrapple) < iBatDetectionRadius && bCanAttack == true)
		{
		bContinuePath = 0;
		path_end();
		dirToPlayer = point_direction(x,y,objPlayerGrapple.x, objPlayerGrapple.y-40);
		x += lengthdir_x(2,dirToPlayer);
		y += lengthdir_y(2,dirToPlayer);
		}
	else if bContinuePath == 0
		{
		bContinuePath = 1;
		path_start(pathEnemyBat, iBatSpeed, path_action_continue, 0);
		}
	}

//Bat sound
iBatNoiseTimer -= 1;
if iBatNoiseTimer <= 0
{
iBatNoiseTimer = random_range(180, 420);
audio_play_sound(sndBatNoise, 10, false);
}

//Timer countdown
if bCanAttack == false
	{                     
		tAttackRefresh -= 1;
	}
	
//Attack refresh
if tAttackRefresh <= 0
	{
		bCanAttack = true;
		tAttackRefresh = 180;
	}


//Bat taking damage and dying
if(batHP <=0)
	{					   
		instance_destroy();  
	} 

hit = instance_place (x, y, objSwordHitbox);

if (hit != noone)
	{
	//hit.batHP -= 1; BREAKING GAME
	instance_destroy ();
	}
	
//This makese the Bat flip when it switches it's position.	
if (x < iPrevFrameX)
	{
	image_xscale = 1;
	}
else if (x > iPrevFrameX)
	{
	image_xscale = -1;
	}
iPrevFrameX = x;

// physics collision
if collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, objPlayerGrapple, false, true) != noone
{
    //damage logic
	if (objPlayerGrapple.bCanTakeDamage == 1 && bCanAttack == true)
		{
			objPlayerGrapple.iCurrentHP -= iBatDamage;
			objPlayerGrapple.bCanTakeDamage = 0;
			objPlayerGrapple.bGotHit = 1;
		}
	bCanAttack = false;
	
//Debug
objPlayerGrapple.iCurrentHP -= iBatDamage;
}

//Debug messages
//show_debug_message(tAttackRefresh);