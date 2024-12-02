/// @description move the player
lookDir := objCamera.lookDir-90;

switch(state)
{

    case STATES.FOLLOW:
    {
        image_blend := c_green;
        following := true;
        if(point_distance_3d(self.x, self.y, self.z, objPlayer.x, objPlayer.y, objPlayer.z) > distance)
        {
            
            self.xprevious := x;
            self.yprevious := y;
            self.x := (lerp(self.x, objPlayer.x, 0.015)+random_range(-3, 3));
            self.y := (lerp(self.y, objPlayer.y, 0.015)+random_range(-3, 3));
            self.image_angle := flip ? lerp(image_angle, -45, 0.1): lerp(image_angle, 45, 0.1);
            
            if(flip && image_angle < -43)
            {
                flip := !flip;
            }
            
            if(!flip && image_angle > 43)
            {
                flip := !flip;
            }
        }
        else 
        {
            self.image_angle := 0;
            self.z := objPlayer.z;
        }
        
        
        break;
    }
    
    case STATES.AGAINST:
    {
        image_blend := c_maroon;
        
        if(target == noone)
        {
            acquireTarget();
        }
        
        if(target != noone)
        {
            if(point_distance_3d(self.x, self.y, self.z, target.x, target.y, target.z) > 32)
            {
                self.xprevious := x;
                self.yprevious := y;
                self.x := (lerp(self.x, target.x, 0.005)+random_range(-6, 6));
                self.y := (lerp(self.y, target.y, 0.005)+random_range(-6, 6));
                self.image_angle := random_range(-25, 25);
            }
            else 
            {
                self.image_angle := 0;
                self.z := target.z;
                
                var _roll := irandom(10);
                if(_roll > 9)
                {
                    target.state := STATES.AGAINST;
                    objPlayer.detractors ++;
                    acquireTarget();
                }
                else 
                {
                    acquireTarget();
                }
            }
        }
        
        break;
    }
    
    case STATES.CONVERT:
        {
            image_blend := c_purple;
            
            if(target == noone)
            {
                acquireTarget();
            }
            
            if(target != noone && instance_exists(target))
            {
                if(point_distance_3d(self.x, self.y, self.z, target.x, target.y, target.z) > 32)
                {
                    self.xprevious := x;
                    self.yprevious := y;
                    self.x := (lerp(self.x, target.x, 0.005)+random_range(-6, 6));
                    self.y := (lerp(self.y, target.y, 0.005)+random_range(-6, 6));
                    self.image_angle := random_range(-25, 25);
                }
                else 
                {
                    self.image_angle := 0;
                    self.z := target.z;
                    
                    var _roll := irandom(10);
                    if(_roll > 9)
                    {
                        target.state := STATES.FOLLOW;
                        target.following := true;
                        objPlayer.followerCount ++;
                        acquireTarget();
                    }
                    else 
                    {
                        acquireTarget();
                    }
                }
            }
            
            break;
        }
    
    case STATES.NEUTRAL:
    {
        
        
        break;
    }
    
    case STATES.HOLD:
    {
        
        self.image_angle := 0;
        self.z := 0;
        break;
    }
    
    case STATES.ATTACK:
    {
        
        image_blend := c_dkgray;
        
        if(target == noone)
        {
            acquireTarget(true);
        }
        
        if(target != noone)
        {
            if(instance_exists(target))
            {
                if(point_distance_3d(self.x, self.y, self.z, target.x, target.y, target.z) > 32)
                {
                    self.xprevious := x;
                    self.yprevious := y;
                    self.x := (lerp(self.x, target.x, 0.005)+random_range(-6, 6));
                    self.y := (lerp(self.y, target.y, 0.005)+random_range(-6, 6));
                    self.image_angle := random_range(-25, 25);
                }
                else 
                {
                    self.image_angle = 0;
                    self.z = target.z;
                    
                    var _roll := irandom(10);
                    if(_roll > 6)
                    {
                        instance_destroy(target)
                        objPlayer.detractors --;
                        acquireTarget(true);
                    }
                    else 
                    {
                        acquireTarget(true);
                    }
                }
            }
            else 
            {
                state := STATES.FOLLOW;
            }
            
        }
        
        break;
        
    }
    
}
