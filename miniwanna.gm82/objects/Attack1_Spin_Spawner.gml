#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
t = 0
dir = 0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if t mod 5 == 0 {
    for (i=0; i<4; i+=1) {
        a = instance_create(Hibachi.x, Hibachi.y, BulletBall_A_M_Pink)
        a.direction = dir + 360/4*i
        a.speed = 11

        a = instance_create(Hibachi.x, Hibachi.y, BulletBall_A_M_Pink)
        a.direction = dir + 360/4*i
        a.speed = 13

        a = instance_create(Hibachi.x, Hibachi.y, BulletBall_A_M_Pink)
        a.direction = dir + 360/4*i + 10
        a.speed = 12
        a.image_xscale=1.2
        a.image_yscale=a.image_xscale

        a = instance_create(Hibachi.x, Hibachi.y, BulletBall_A_M_Pink)
        a.direction = dir + 360/4*i + 10
        a.speed = 14
        a.image_xscale=1.2
        a.image_yscale=a.image_xscale
    }
    dir -= 27
}


t += 1
