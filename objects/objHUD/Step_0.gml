/// @description Insert description here
// You can write your code in this editor


//Enforce MaxHP Cap
if (objPlayerGrapple.iCurrentHP >= objPlayerGrapple.iMaxHP)
{
	objPlayerGrapple.iCurrentHP = objPlayerGrapple.iMaxHP;
}


//Enforce Stamina Cap
if (objPlayerGrapple.iCurrentStamina > objPlayerGrapple.iMaxStamina)
{
	objPlayerGrapple.iCurrentStamina = objPlayerGrapple.iMaxStamina;
}
else
{
	objPlayerGrapple.iCurrentStamina = objPlayerGrapple.iCurrentStamina + 0.1;    //Every frame will add 1 stamina back to Amelia
}

/*
//If Amelia Dies
if (objPlayerGrapple.iCurrentHP <= 0)
{
	instance_destroy();
	game_restart();
}

	
if alarm_get(0) <= 0
	{
	objPlayerGrapple.bCanTakeDamage = 1;
	}
	
if objPlayerGrapple.bGotHit = 1
{
	objPlayerGrapple.bGotHit = 0;
	alarm_set(0, objPlayerGrapple.iDamageBuffer);
}
*/