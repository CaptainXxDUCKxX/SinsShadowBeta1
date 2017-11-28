/// @description Timeout Animation

if (bDoingNothing = true)
{
	sprite_index = sprTimeout;
	bDoingNothing = false;
	alarm [3] = (room_speed * 5);
}