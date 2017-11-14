/// @description Insert description here
// You can write your code in this editor
if (objPlayerGrapple.bCanTakeDamage == 1 && bCanAttack == true)
	{
	objPlayerGrapple.iCurrentHP -= iBatDamage;
	objPlayerGrapple.bCanTakeDamage = 0;
	objPlayerGrapple.bGotHit = 1;
}

bCanAttack = false;