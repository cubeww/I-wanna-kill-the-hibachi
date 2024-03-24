#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
t = 0
xx = 0
xx2 = 0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
x=Hibachi.x
y=Hibachi.y

spac = 80

if t mod 20 == 0 {
    for (i=0;i<100;i+=1) {
        a=instance_create(-spac+i*spac+xx,608,BulletBall_A_M_Pink)
        a.vspeed=-5
        a.image_speed=0.5
    }

    if t > 50*6 {
        xx = (xx + 15) mod spac
    }
}

if t > 50*6 && t mod 25 == 0 {
    for (i=0;i<100;i+=1) {
        a=instance_create(800+spac-i*spac-xx2,0,BulletBall_A_M_Blue)
        a.vspeed=8
        a.image_speed=0.5
    }

    xx2 = (xx2 + 15) mod spac
}

t += 1
