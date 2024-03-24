#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
t = 0
dir = 0
dir2 = 0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
x=Hibachi.x
y=Hibachi.y

num = 5

if t mod 2 == 0 {
    if t mod 20 < 12 {
        for(i=0;i<num;i+=1) {
            a=instance_create(x,y,BulletBall_B_S_Pink)
            a.image_xscale = 1.2
            a.image_yscale = 1.2
            a.direction = dir + 360/num*i
            a.speed = 10
        }
        for(i=0;i<num;i+=1) {
            a=instance_create(x,y,BulletBall_B_S_Pink)
            a.image_xscale = 1.2
            a.image_yscale = 1.2
            a.direction = -dir + 360/num*i
            a.speed = 10
        }
    }

    dir += 1
}

if t mod 2 == 0 {
    if t mod 20 < 12 {
        for(i=0;i<num;i+=1) {
            a=instance_create(x,y,BulletBall_B_S_Pink)
            a.image_xscale = 1
            a.image_yscale = 1
            a.direction = dir2 + 360/num*i + 45
            a.speed = 12
        }
        for(i=0;i<num;i+=1) {
            a=instance_create(x,y,BulletBall_B_S_Pink)
            a.image_xscale = 1
            a.image_yscale = 1
            a.direction = -dir2 + 360/num*i + 45
            a.speed = 12
        }
    }

    dir2 += 1
}


t += 1
