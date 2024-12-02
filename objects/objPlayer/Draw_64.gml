/// @description Insert description here
draw_set_alpha(0.6);
draw_rectangle_color(0, 0, string_width($"Action: {objPlayer.modes[objPlayer.mode]}")+8, 200, c_black, c_black, c_dkgray, c_dkgray, false);
draw_set_alpha(1);

draw_text_drop(10, 4, $"People: {array_length(objPlayer.followers)}", 3);
draw_set_color(c_lime);
draw_text_drop(10, 38, $"Followers: {objPlayer.followerCount}", 3);
draw_set_color(c_red);
draw_text_drop(10, 72, $"Detractors: {objPlayer.detractors}", 3);
draw_set_color(c_aqua);
draw_text_drop(10, 110, $"Action: {objPlayer.modes[objPlayer.mode]}", 3);
draw_text_drop(10, window_get_height()-48, $"FPS: {fps} / {fps_real}", 3);
draw_set_color(c_white);