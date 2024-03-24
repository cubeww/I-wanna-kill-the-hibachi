#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
len = point_distance(x,y,Hibachi.x,Hibachi.y)
dir = point_direction(Hibachi.x,Hibachi.y,x,y)
obj = BulletDir_A_XL_Blue
t = 0
dy = 32
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
x = Hibachi.x + lengthdir_x(len, dir)
y = dy + Hibachi.y + lengthdir_y(len, dir)

if len > 10 {
    len -= 0.3
}

dir -= 0.5

if t mod 3 == 0 {
    i = instance_create(x, y, BulletSpawnEffect)
    i = instance_create(x, y, obj)
    i.vspeed = 12
}

t += 1
