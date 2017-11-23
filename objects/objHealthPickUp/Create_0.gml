/// @description Insert description here
// You can write your code in this editor

range = 200;

do
{
	x = random_range(32, room_width - 32);
}

until(point_distance(x, y, objPlayerGrapple.x, objPlayerGrapple.y) >= range)