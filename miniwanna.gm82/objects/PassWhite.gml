#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
al = 0
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_set_color(c_white)
draw_set_alpha(al)
draw_rectangle(0,0,800,608,0)
draw_set_alpha(1)
al += 0.025

if al > 1.5 {
    room_goto(rmEnd)
}
