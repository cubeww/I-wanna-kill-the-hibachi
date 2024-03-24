#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_alpha = .7
quit = 0
#define Collision_PlayerBullet
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
with other instance_destroy()
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
x=Hibachi.x
y=Hibachi.y

draw_set_blend_mode(bm_add)
draw_self()
draw_set_blend_mode(bm_normal)

if quit {
    mask_index = sprEmpty
    image_alpha -= 0.1
    if image_alpha < 0 {
        instance_destroy()
    }
}
