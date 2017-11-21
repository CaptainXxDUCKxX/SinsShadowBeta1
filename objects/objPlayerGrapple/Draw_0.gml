 /// DRAW SELF AND GRAPPLE LINE 

draw_self(); 

if(active)
{
	draw_line_width_color(x, y, instNearestGP.x, instNearestGP.y, 5, c_teal, c_teal);
}
