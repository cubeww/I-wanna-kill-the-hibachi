#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
dir = 0
dir2 = 0
t = 0

dir3 = 0
dir4 = 0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
x=Hibachi.x
y=Hibachi.y

if t < 950 {
    if t mod 8 == 0 {
        for(i=0;i<4;i+=1) {
            a=instance_create(x,y,BulletBall_A_M_Pink)
            a.direction=dir+360/4*i
            a.speed=10
            a.image_xscale=1.2
            a.image_yscale=1.2
        }
        dir-=5
    }

    if t > 150 and t mod 8 == 0 {
        for(i=0;i<4;i+=1) {
            a=instance_create(x,y,BulletBall_A_M_Pink)
            a.direction=dir2+360/4*i
            a.speed=10
            a.image_xscale=1.2
            a.image_yscale=1.2
        }
        dir2+=8
    }

    if t > 250 and t mod 2 == 0 {
        a=instance_create(x,y,BulletBall_B_L_Blue)
        a.direction=random(360)
        a.speed=10
    }
}

if t > 970 {
    n = 24
    if t mod 10 == 0 {
        for(i=0;i<n;i+=1) {
            if i <= n/4-1 || (i >= n/2 && i <= n/2+(n/4)-1) {
                a=instance_create(x,y,BulletDir_Final)
                a.direction=dir3+360/32*i
                a.speed=10
            }
        }
        dir3 += 8
    }
    if t mod 10 == 0 {
        for(i=0;i<n;i+=1) {
            if i <= n/4-1 || (i >= n/2 && i <= n/2+(n/4)-1) {
                a=instance_create(x,y,BulletDir_Final)
                a.direction=dir4+360/32*i + 45
                a.speed=10
            }
        }
        dir4 -= 10
    }

    if t == 1670 {
        t = 250
    }
}

t += 1
