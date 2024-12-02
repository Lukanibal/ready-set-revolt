/// @description Insert description here
switch(text)
{
    case "PLAY":
    {
        room_goto(rmTownSquare);
        break;
    }
    
    case "CLOSE":
    {
        game_end();
        break;
    }
    
    case "HELP":
    {
        room_goto(rmHowToPlay);
        break;
    }
    
    case "BACK":
    {
        room_goto(rmMenu);
        break;
    }
    
    case "CODE":
    {
        objMenu.gitask := show_question_async("This will open github.com in you default browser, okay?");
        break;
    }
    
    case "FONT":
    {
        if(draw_get_font() == fntOpenDyslexic)
        {
            draw_set_font(fntArial);
            layer_set_visible(layer_get_id("Assets_1"), false);
            layer_set_visible(layer_get_id("Assets_2"), true);
        }
        else 
        {
            draw_set_font(fntOpenDyslexic);
            layer_set_visible(layer_get_id("Assets_2"), false);
            layer_set_visible(layer_get_id("Assets_1"), true);
        }
        objFontController.getFont();
        break;
    }
}