/// @description setup the player
followerMultiplier := 25;
followers := [];
detractors := 0;
multiplierMultiplier := 1;
randomise();
createPerson := function(_num := 1)
{
    //self.followerCount ++;
    
    repeat(_num)
    {
        array_push(followers, instance_create_depth(random(room_width), random(room_height), objPlayer.z, objPerson));//new Follower(random(room_width), random(room_height), objPlayer.z,  self.multiplierMultiplier));
        if(global.followerCount >= self.followerMultiplier)
        {   
            self.followerMultiplier += (25 * multiplierMultiplier);
            multiplierMultiplier ++;
        }
    }
};

lookDir := 0;
zspeed := 0;
ground := 0;
jumped := false;

jumpHeight := 0;
arced := false;

image_speed := 0;

image_blend := choose(c_aqua, c_blue)

layer_background_blend(layer_background_get_id("Background"), c_teal);

hat := 0;//irandom(sprite_get_number(sprHats)-1);

modes :=["Speech about taxes", "Order followers to spread the word", "Order followers to \"silence\" detractors", "Order followers to stay here"];
mode := 0;

sprSurf := -1;
init = true;
sprite := -1;

hp := 100;
charisma := 0;
karma := 0;

modeRadius = 0;
modeBase := 80;
modeMax = modeBase;
repeat(1500)
{
    createPerson();
}

