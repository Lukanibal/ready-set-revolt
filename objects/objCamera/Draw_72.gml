/// @description setup our 3d projection <3

var camDist := 250;

var _exists := instance_exists(target);
var _xto := _exists ? target.x : 2500;
var _yto := _exists ? target.y : 2500;
var _zto := _exists ? target.z : 128;



var _xfrom; 
var _yfrom; 
var _zfrom; 

if(wait)
{
    _xfrom := xFromBuffer;
    _yfrom := yFromBuffer;
    _zfrom := zFromBuffer;
}
else
{
    _xfrom := _exists ? _xto - camDist * dcos(lookDir) : x;
    _yfrom := _exists ? _yto + camDist * dsin(lookDir) : y;
    _zfrom := _exists ?  _zto + camDist * dsin(lookPitch) : z;
    
    xFromBuffer := _xfrom;
    yFromBuffer := _yfrom;
    zFromBuffer := _zfrom;
}

x := _xfrom;
y := _yfrom;
z := _zfrom;


draw_set_color(c_white);
draw_clear(c_teal);

camera_set_view_mat(camera, matrix_build_lookat(_xfrom, _yfrom, _zfrom, _xto, _yto, _zto, 0, 0, 1));
camera_set_proj_mat(camera, matrix_build_projection_perspective_fov(-70, -(window_get_width()/window_get_height()), 1, 10000) );
camera_apply(camera);

