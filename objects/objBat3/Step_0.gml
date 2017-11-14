//Bat AI pathing
if instance_exists(objPlayerGrapple)
{
if (distance_to_object(objPlayerGrapple) < iBatDetectionRadius && bCanAttack == true)
{
bContinuePath = 0;
path_end();
move_towards_point(objPlayerGrapple.x, objPlayerGrapple.y, 2);
}
else if bContinuePath == 0
{
bContinuePath = 1;
path_start(pathEnemyBat, iBatSpeed, path_action_continue, 0);
}
}

//Timer countdown
if bCanAttack == false
{
tAttackRefresh -= 1;
}

show_debug_message(tAttackRefresh);
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