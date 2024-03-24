#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed = 0.5
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
sp = 6
margin = 16

if x <= margin {
    for(i=0;i<5;i+=1) {
        a = instance_create(x,y,BulletBall_B_S_Blue)
        a.direction = -45 + 18*i
        a.speed = sp
    }
    instance_create(x,y,ExpoEffect)
    instance_destroy()
}

if x >= 800-margin {
    for(i=0;i<5;i+=1) {
        a = instance_create(x,y,BulletBall_B_S_Blue)
        a.direction = 135 + 18*i
        a.speed = sp
    }
    instance_create(x,y,ExpoEffect)
    instance_destroy()
}

if y <= margin {
    for(i=0;i<5;i+=1) {
        a = instance_create(x,y,BulletBall_B_S_Blue)
        a.direction = 225 + 18*i
        a.speed = sp
    }
    instance_create(x,y,ExpoEffect)
    instance_destroy()
}

if y >= 608-margin {
    for(i=0;i<5;i+=1) {
        a = instance_create(x,y,BulletBall_B_S_Blue)
        a.direction = 45 + 18*i
        a.speed = sp
    }
    instance_create(x,y,ExpoEffect)
    instance_destroy()
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_angle = direction
draw_self()
