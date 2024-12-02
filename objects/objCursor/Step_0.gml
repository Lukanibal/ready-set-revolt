/// @description
lookDir := objCamera.lookDir-90;

if(array_length(objCamera.mouse_ray))
{
    var _dir := point_direction( objPlayer.x, objPlayer.y, objCamera.mouse_ray[0], objCamera.mouse_ray[1]);
    var _dist := point_distance(objPlayer.x, objPlayer.y, objCamera.mouse_ray[0], objCamera.mouse_ray[1]);
    x := -lengthdir_x( _dist , _dir);
    y := -lengthdir_y( _dist , _dir);
    }