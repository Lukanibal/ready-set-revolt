/// @description move the player
lookDir := objCamera.lookDir-90;
var _left  := keyboard_check(global.controls.left);
var _right := keyboard_check(global.controls.right);
var _up    := keyboard_check(global.controls.up);
var _down  := keyboard_check(global.controls.down);
var _jump  := keyboard_check_pressed(global.controls.jump);

if(_left)
{
    x := x + lengthdir_x(4, lookDir-180);
    y := y + lengthdir_y(4, lookDir-180);
}

if(_right)
{
    x := x + lengthdir_x(4, lookDir);
    y := y + lengthdir_y(4, lookDir);
}

if(_up)
{
    x := x + lengthdir_x(4, lookDir+90);
    y := y + lengthdir_y(4, lookDir+90);
}

if(_down)
{
    x := x + lengthdir_x(4, lookDir-90);
    y := y + lengthdir_y(4, lookDir-90);
}

if(_jump and not jumped)
{
    jumpHeight := (z + 98);
    jumped := true;
}

z += zspeed;

modeMax := (modeBase + charisma);
if(not jumped)
{
    if(z > ground)
    {
        zspeed := -0.5;
    }
    else
    {
        zspeed := 0;
        jumped := false;
    }
}
else 
{
    arced := point_distance_3d(x, y, z, x, y, jumpHeight) > 2 ? false : true;
    if(not arced)
    {
        z := lerp(z, jumpHeight, 0.125); 
    }
    else 
    {
        jumpHeight = 0;
        z := lerp(z, ground, 0.025); 
        if(point_distance_3d(x, y, z, x, y, ground) < 2)
        {
            jumped := false;
        }
    }
}

if(mouse_wheel_down() || keyboard_check_pressed(ord("2")))
{
    if(mode < array_length(modes)-1)
    {
        mode ++;
    }
    else 
    {
        mode := 0;
    }
}

if(mouse_wheel_up() || keyboard_check_pressed(ord("1")))
{
    if(mode > 0)
    {
        mode --;
    }
    else 
    {
        mode := array_length(modes)-1;
    }
}


if(mouse_check_button(mb_right))
{
    modeRadius += modeRadius < modeMax ? 2:0;
}

if(mouse_check_button_released(mb_right))
{
    
    with(objPerson)
    {
        var _dist := point_distance_3d(self.x, self.y, self.z, objPlayer.x, objPlayer.y, objPlayer.z) ;
        switch(objPlayer.mode)
        {
            case 0:
            {
                
                if(state == STATES.HOLD)
                {
                    state := STATES.FOLLOW;
                }
                
                if(_dist < objPlayer.modeRadius)
                {
                    var _roll := random(10);
                    
                    if(_roll > 9)
                    {
                        state = STATES.FOLLOW;
                        self.following := true;
                        global.followerCount ++;
                        objPlayer.charisma ++;
                    }
                    
                    if(_roll < 1 && global.followerCount > 10)
                    {
                        state = STATES.AGAINST;
                        self.against := true;
                        objPlayer.detractors ++;
                        
                        var _reroll = irandom(objPlayer.charisma*2);
                        if(objPlayer.charisma >= _reroll)
                        {
                            state = STATES.FOLLOW;
                            self.against := false;
                            objPlayer.detractors --;
                            global.followerCount ++;
                            objPlayer.charisma ++;
                        }
                    }
                }
                
                break;
            }
            
            case 1:
            {
                if(_dist < objPlayer.modeRadius
                and self.following) 
                {
                    state := STATES.CONVERT;
                }
                break;
            }
            
            case 2:
            {
                if(_dist< objPlayer.modeRadius
                and self.following) 
                {
                    state := STATES.ATTACK;
                }
                break;
            }
            
            case 3:
            {
                if(_dist < objPlayer.modeRadius
                and self.following) 
                {
                    state := STATES.HOLD;
                }
                break;
            }
        }
    }
    modeRadius := 0;
}

x := clamp(x, 0, room_width);
y := clamp(y, 0, room_height);