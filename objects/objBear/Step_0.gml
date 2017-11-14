/// @description Insert description here
// You can write your code in this editor













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