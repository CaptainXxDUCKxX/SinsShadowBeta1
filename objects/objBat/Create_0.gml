//variables 
hit = 0;
hspeed = 0;
vspeed = 0; 

batHP = 4; 

// Bat's Pathing && Speed
bBatDebugMode = 1;
bContinuePath = 1;
iBatDetectionRadius = 150;
iBatSpeed = 2.25;

// Bat's Damage Variables and Timer
iBatDamage = 1;
bCanAttack = true;
tAttackRefresh = 180;

// Bat's Direction...?
dirToPlayer = 0;
iPrevFrameX = 0;
path_start(pathEnemyBat, iBatSpeed, path_action_restart, 0);

// Bat's sound effects
iBatNoiseTimer = random_range(180, 420);