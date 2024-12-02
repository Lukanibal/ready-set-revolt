global.controls :=
{
    left : ord("A"),
    right: ord("D"),
    up   : ord("W"),
    down : ord("S"), 
    jump : vk_space
    
}

function draw_text_drop(_x, _y, _text, _shadowWidth)
{
    draw_text_color(_x+_shadowWidth, _y+_shadowWidth, _text, c_black, c_black, c_black, c_black, 0.8);
    draw_text(_x, _y, _text);
}
