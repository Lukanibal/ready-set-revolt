
enum STATES
{
    NEUTRAL,
    FOLLOW,
    AGAINST,
    ATTACK,
    DEFEND,
    HOLD,
    CONVERT
}

enum MODES
{
    ATTACK := 3,
    FOLLOW := 1,
    DEFEND := 4,
    HOLD   := 5,
    CONVERT:= 6 
}


/**
 * Function Description
 * @param {real} _x Description
 * @param {real} _y Description
 * @param {real} _z Description
 * @param {real} _mult Description
 */
function Follower(_x, _y, _z, _mult) constructor 
{
    x := _x;
    y := _y;
    z := _z;
    
    state := STATES.NEUTRAL;
    
    following := false; 
    against := false;
     
    distance := (_mult * 48);
    show_debug_message($"distance: {distance}| mult:{_mult}");
    
    xprevious := x;
    yprevious := y;
    
    image_blend := c_white;
    angle := 0;
    
    static update = function()
    {
        
        
    }
} 