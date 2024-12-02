/// @description setup the Person

lookDir := 0;
image_speed := 0;

state := STATES.NEUTRAL;

hat = irandom(sprite_get_number(sprHats)-1);

state := STATES.NEUTRAL;
    
following := false; 
against := false;

distance := (objPlayer.multiplierMultiplier * 48);

xprevious := x;
yprevious := y;

image_blend := c_white;
angle := 0;
flip := false;

hat := irandom(sprite_get_number(sprHats)-1);
if(hat == 0)
{
    hat := 1;
}

mode := MODES.FOLLOW;

sprSurf := -1;
init = true;
sprite := -1;

target = noone;

acquireTarget := function(_attack := false)
{
    var _num := instance_number(objPerson)-1;
    var _choice := irandom(_num);
    
    if(_attack)
    {
        if(instance_exists(target))
        {
            if(objPlayer.detractors > 0)
            {
                do
                {
                    self.target := instance_find(objPerson, _choice);
                    _choice := irandom(_num);
                }
                until(target.against);
            }
        }
        else 
        {
            state := STATES.FOLLOW;
        }
    }
    else
    if(_choice == self.id)
    {
        if(_choice < _num)
        {
            self.target := instance_find(objPerson, _choice+1);
        }
        else if(_choice == _num)
        {
            self.target := instance_find(objPerson, _choice-1);
        }
    }
    else 
    {
        self.target := instance_find(objPerson, _choice);
    }
}
