/// @description draw
/// 
matrix_set(matrix_world, matrix_build(x, y, z + 16, 90, 0, lookDir, 1, 1, 1));
draw_sprite_ext(sprite_index, 0, 0, 0, 1, 1, image_angle, image_blend, 1);
draw_sprite_ext(sprHats, hat, 0, 0, 1, 1, image_angle, c_white, 1);
matrix_set(matrix_world, matrix_build_identity());  

