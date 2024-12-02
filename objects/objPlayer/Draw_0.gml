/// @description draw

if(asset_get_type(sprite) == asset_sprite)
{
    matrix_set(matrix_world, matrix_build(x, y, z + 16, 90, image_angle, lookDir, 1, 1, 1));
    draw_sprite_ext(sprite, 0, 0, 0, 1, 1, 0, c_white, 1);
    //draw_sprite_ext(sprHats, hat, 0, 0, 1, 1, 0, c_white, 1);
}
else 
{
    if(!surface_exists(sprSurf) or init)
    {
        sprSurf := surface_create(sprite_width, sprite_height);
        
        surface_set_target(sprSurf);
            draw_clear_alpha(c_black, 0.);
            if(hat != 2)
            {
                draw_sprite_ext(sprTownie, 0, sprite_get_xoffset(sprTownie), sprite_get_height(sprTownie)-sprite_get_yoffset(sprTownie), 1, -1, 0, image_blend, 1);
                draw_sprite_ext(sprHats, 0, sprite_get_xoffset(sprTownie), sprite_get_height(sprTownie)-sprite_get_yoffset(sprTownie), 1, -1, 0, c_white, 1);
            }
            else 
            {
                draw_sprite_ext(sprHats, hat, sprite_get_xoffset(sprTownie), sprite_get_height(sprTownie)-sprite_get_yoffset(sprTownie), 1, -1, 0, c_white, 1);
                draw_sprite_ext(sprTownie, 0, sprite_get_xoffset(sprTownie), sprite_get_height(sprTownie)-sprite_get_yoffset(sprTownie), 1, -1, 0, image_blend, 1);
            }
        surface_reset_target();
        
        sprite := sprite_create_from_surface(sprSurf, 0, 0, sprite_width, sprite_height, false, false, 30, 50);
        init := false;
    }
}


matrix_set(matrix_world, matrix_build_identity());

var _spr := room == rmTownSquare ? sprTownSquare : sprCastle;
draw_sprite_stretched( _spr, 0, 0, 0, room_width, room_height);


if(modeRadius > 0)
{
    draw_circle(x, y, modeRadius, true);
}
