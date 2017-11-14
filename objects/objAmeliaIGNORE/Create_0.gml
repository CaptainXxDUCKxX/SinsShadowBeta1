//GRAPPLE VARIABLES
mx = x;	//hook x coordinates
my = y;	//hook y coordinates
active = false;
iGrappleRadius = 200;
instNearestGP = objGrappleBlock;

//PHYSICS VARIABLES
fixtureAmelia = physics_fixture_create ();
jointGrapple = pointer_null;
physics_fixture_set_circle_shape (fixtureAmelia, 5);

phy_rotation = 0;
phy_fixed_rotation = true;

//ATTACK VARIABLES
attack = false;
iAttackTimer = 2;
alarm [0] = iAttackTimer;

iPrevFrameX = 0;

//HP
iCurrentHP = 100;
iMaxHP = 100;

//Stamina
iCurrentStamina = 100;
iMaxStamina = 100;

//TAKE DAMAGE
bCanTakeDamage = 0;
bOnGround = false;	//is Amelia on the ground
bJumpImpulseSwitch = true;	//"true" meaning "can jump"   