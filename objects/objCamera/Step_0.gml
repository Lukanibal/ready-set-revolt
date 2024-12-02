/// @description Insert description here
if(keyboard_check_pressed(vk_control))
{
    window_mouse_set_locked(!window_mouse_get_locked());
    window_set_cursor( window_mouse_get_locked() ? cr_none: cr_default);
}

if(window_mouse_get_locked())
{
    lookDir -= (window_mouse_get_delta_x()) / 10;
    lookPitch += (window_mouse_get_delta_y()) / 10;  
}

var _ww, _wh;
_ww := window_get_width();
_wh := window_get_height();
if(windowWidth != window_get_width() || windowHeight != window_get_height())
{
    display_set_gui_size(_ww, _wh);
    windowWidth := _ww;
    windowHeight := _wh;
}