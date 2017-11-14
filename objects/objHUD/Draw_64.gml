//Draw GUI
draw_sprite(spr_GUI, 1, iHUDX, iHUDY);

//Draw Stamina Bar
//draw_sprite_stretched(spr_StaminaBar, 0, mouse_x, mouse_y, 256, 8);
draw_sprite_stretched_ext(spr_StaminaBar, 0, iHUDX + 74, iHUDY + 39, (166/(objPlayerGrapple.iMaxStamina/objPlayerGrapple.iCurrentStamina)), 6, c_white, 0.75);

//Draw Health Bar
//draw_sprite_stretched(spr_HealthBar, 0, mouse_x, mouse_y, 256, 8);
draw_sprite_stretched_ext(spr_HealthBar, 0, iHUDX + 72, iHUDY + 25, (273/(objPlayerGrapple.iMaxHP/objPlayerGrapple.iCurrentHP)), 7, c_white, 0.75);

//Debug messages
//show_debug_message("x: " + string(mouse_x - iHUDX));
//show_debug_message("y: " + string(mouse_y - iHUDY));