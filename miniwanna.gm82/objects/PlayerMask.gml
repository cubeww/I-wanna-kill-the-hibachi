#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
live = 10
can_kill = 1
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
can_kill = 1
Player.image_alpha = 1
with HibachiProtect quit = 1
#define Alarm_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
sound_play('sndHibachiBomb')
#define Collision_Killer
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if can_kill {
    can_kill = 0
    live -= 1

    alarm[0] = 200
    alarm[1] = 50
    if live > 0 {
        sound_play('sndDeath')
        instance_create(x,y,HibachiProtect)
    }

    Player.image_alpha = 0.5


    if live = 0 {
        sound_play('sndHibachiKill')
        kill_player()
        instance_destroy()
    }
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
x = Player.x
y = Player.y

draw_self()

if !can_kill {
    draw_set_color(c_white)
    draw_text(x-4, y-32, live)
}
