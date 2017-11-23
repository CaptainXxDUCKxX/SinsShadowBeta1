
//  ESC - Quit the Game (Game Closes)
//	F2 - Restart Level 
//	F1 - Restart Game 
//	Enter - Next Level
//	F3 - Previous Level 



if keyboard_check_pressed(vk_escape) || (gamepad_button_check_pressed(0, gp_select)) game_end();
if keyboard_check_pressed(vk_enter) room_goto_next();
if keyboard_check_pressed(vk_f2) room_restart();
if keyboard_check_pressed(vk_f1)|| (gamepad_button_check_pressed(0, gp_start)) game_restart();
if keyboard_check_pressed(vk_f3) room_goto_previous();

if keyboard_check_pressed(vk_numpad1) room_goto(rmStage1);