#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed = 0.3
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if instance_exists(Hibachi) {
    x = Hibachi.x
    y = Hibachi.y
    draw_self()
} else {
    instance_destroy()
}
