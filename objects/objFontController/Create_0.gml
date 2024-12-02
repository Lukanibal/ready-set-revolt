/// @description Insert description here
text := "";
getFont = function()
{
    self.fnt := draw_get_font();
    switch(self.fnt)
    {
        case fntOpenDyslexic:
        {
            self.text := "Open Dyslexic";
            break;
        }
        
        case fntArial:
        {
            self.text := "Arial";
            break;
        }
    }
}

getFont();
