#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
t = 0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
x=Hibachi.x
y=Hibachi.y

if t mod 10 == 0 {
    a=instance_create(x,y,BulletExpo)
    a.direction = random(360)
    a.speed = 10
}


t += 1
