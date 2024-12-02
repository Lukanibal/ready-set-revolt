/// @description Insert description here

currentCol := merge_color(startCol, nextCol, val);
val += 0.001;

layer_background_blend(layer_background_get_id("Background"), currentCol);

if(currentCol == nextCol)
{
    startCol := nextCol;
    nextCol := make_color_hsv(random(359), random(80), 40);
    val := 0.000;
}