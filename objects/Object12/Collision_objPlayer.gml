/// @description Insert description here
if(other.followerCount < 50)
{
    instance_create_depth(x, y, -10000, objNotice, 
    {
       text : "I don't think this piddly \r\nresistance will have any sway!" 
    });
}
else 
{
    instance_create_depth(x, y, -10000, objNotice, 
        {
        text : "Sorry, I didn't know \r\n what to do with the game from here..." 
        });
}
other.x := other.xprevious;
other.y := other.yprevious;