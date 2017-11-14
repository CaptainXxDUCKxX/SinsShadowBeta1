//Variables 
hsp = 0;
vsp = 0;
grv = 0.3;
walksp = 2;
controller = 0; 
deltax = 0;
key_down = 0;
iPrevFrameX = 0;

//Grapple Variables
mx = x; // hook x coordinates
my = y; // hook y coordinates
active = false;
iGrappleRadius = 280;
instNearestGP = objGrappleBlock;

//HP statistics 
bCanTakeDamage = 0;
iDamageBuffer = 60;
alarm[0] = iDamageBuffer;

bGotHit = 0;

iCurrentHP = 100; 
iMaxHP = 100;

/*
//Camera
camSpeed = 16;
camWidth = 640;
camHeight = 360;

//Window
windowWidth = 1280;
windowHeight = 720;
window_set_size (windowWidth, windowHeight);

//Monitor
monitorWidth = display_get_width ();
monitorHeight = display_get_height ();
window_set_position ((monitorWidth / 2) - (windowWidth / 2), (monitorHeight / 2) - (windowHeight / 2));

//States
/*
enum states {
	idle,
	attack 
}

state = states.idle;
*/  