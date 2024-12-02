/// @description Insert description here
draw_sprite_ext(sprButton, image_index, x+4, y+4, 1, 1, 0, c_black, 0.8);
draw_self();

draw_set_valign(fa_middle);
draw_set_halign(fa_center);
draw_set_color(c_black);

draw_text(x, y, text);

draw_set_valign(fa_top);
draw_set_halign(fa_left);
draw_set_color(c_white);