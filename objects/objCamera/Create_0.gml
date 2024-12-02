/// @description Insert description here
xFromBuffer := x;
yFromBuffer := y;
zFromBuffer := z;



wait := false;

lookDir := 90;
lookPitch := 90;

///turn all this junk on for 3D
gpu_set_zwriteenable(true);
gpu_set_ztestenable(true);
gpu_set_texrepeat(true);
gpu_set_alphatestenable(true);
gpu_set_alphatestref(5);
gpu_set_blendenable(true);

gpu_set_cullmode(cull_counterclockwise)


///grab the camera
camera := camera_get_default();

window_set_size(1366, 768);
display_set_gui_size(1366, 768);

mouse_ray := [];

windowWidth := window_get_width();
windowHeight := window_get_height();

