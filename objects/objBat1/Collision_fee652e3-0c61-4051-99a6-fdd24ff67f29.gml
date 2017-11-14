/// @description Insert description here
// You can write your code in this editor

/*
if other.visible
{
	move_bounce_all(false);
}
*/

if (objAmeliaV2.bCanTakeDamage == 1 && bCanAttack == true)
	{
	objAmeliaV2.iCurrentHP -= iBatDamage;
	objAmeliaV2.bCanTakeDamage = 0;
	objAmeliaV2.bGotHit = 1;
}

bCanAttack = false;