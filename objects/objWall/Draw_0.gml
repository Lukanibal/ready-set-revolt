/// @description draw
/// 
matrix_set(matrix_world, matrix_build(x, y, z + sprite_height, 90, 0, dir, 1, 1, 1));
draw_sprite_ext(sprite_index, image_index, 0, 0, image_xscale, image_yscale, image_angle, image_blend, 1);
matrix_set(matrix_world, matrix_build_identity());  

