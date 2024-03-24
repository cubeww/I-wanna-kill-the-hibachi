#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed = 0.3
shadow = 1
shadow_dir = 0
t = 0
mode = 0

sound_stop_all()

alarm[0] = 1
//alarm[1] = 1
//alarm[2] = 2

start_mode = 1

move = 0
move_x = x
move_y = y

can_kill = 0

max_hp = 280+150
hp = max_hp

cool = 0
add = 0
can_skip = 1

hp_al = 0
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
sound_play('sndHibachiStart')
alarm[1] = 16*50
#define Alarm_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
alarm[2] = 3 * 50
sound_play('sndHibachiStart2')
sprite_index = sprHibachiStart3
image_index = 0

can_skip = 0
#define Alarm_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
sprite_index = sprHibachiDefault
shadow = 0
sound_loop('musBoss')
instance_create(x,y,HibachiWing)
instance_create(x,y,HibachiStartBomb)
instance_create(x,y,HibachiFire)
image_speed = 0.3
alarm[3] = 50
#define Alarm_3
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
mode = start_mode
can_kill = 1
with Player {
    frozen = 0
}
#define Alarm_5
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
cool = 0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=612
applies_to=self
invert=0
arg0=mode
arg1=0
arg2=0
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=425
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Mode 1

if mode != 1 {
    exit
}

dur = 14

if t == 0 {
    move_to(x, ystart-100, 0.1, -0.1)
}

if t == 50*6 {
    sound_play('sndHibachiMode1')
}

if t > 49 && t mod 50 == 0 && t < 50*(dur-1) {
    len = 100
    ysp = 200
    xsp = 400
    if x < xsp && y < ysp {
        dir = random_range(-90, 0)
    } else if x > xsp && y < ysp {
        dir = random_range(180, 270)
    } else if x < xsp && y > ysp {
        dir = random_range(0, 90)
    } else {
        dir = random_range(90, 180)
    }
    move_to(x+lengthdir_x(len,dir), y+lengthdir_y(len,dir), 0.1, -0.1)
}

if t == 70 {
    for (i = 0; i < 6; i += 1) {
        len = 64
        dir = i*360/6
        s = instance_create(x+lengthdir_x(len,dir),y+lengthdir_y(len,dir),Attack1_Fall_Spawner)
        if i mod 2 == 1 {
            s.obj = BulletDir_A_XL_Pink
        }
    }

    instance_create(x, y, Attack1_Spin_Spawner)
}

if t == 50*(dur-1) {
    with Attack1_Fall_Spawner instance_destroy()
    with Attack1_Spin_Spawner instance_destroy()
}

if t == 50 * dur {
    mode = 2
    t = 0
    exit
}

t += 1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Mode 2

if mode != 2 {
    exit
}

if t > 50 && t mod 25 == 0 {
    move = 0
    friction = 0
    tx = random_range(xstart-25,xstart+25)
    ty = random_range(ystart-25 - 64, ystart+25 - 64)
    direction = point_direction(x,y,tx,ty)
    speed = 0.5
}

if t == 50*6 {
    sound_play('sndHibachiMode2')
}

if t == 0 {
    move_to(xstart, ystart, 0.1, -0.1)
}

if t == 50 {
    instance_create(x,y,Attack2_Spawner)
}

if t == 12*50 {
    with Attack2_Spawner {
        instance_destroy()
    }
}

if t == 14*50 {
    mode = 3
    t = 0
    exit
}


t += 1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Mode 3

if mode != 3 {
    exit
}

if t mod 25 == 0 {
    move = 0
    friction = 0
    tx = random_range(xstart-25,xstart+25)
    ty = random_range(ystart-25 - 64, ystart+25 - 64)
    direction = point_direction(x,y,tx,ty)
    speed = 0.5
}

if t == 50 {
    instance_create(x,y,Attack3_Spawner)
}

if t == 50*6 {
    sound_play('sndHibachiMode3')
}

if t == 50*13 {
    with Attack3_Spawner instance_destroy()
}

if t == 50*14 {
    t = 0
    mode = 4
    exit
}


t += 1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Mode 4

if mode != 4 {
    exit
}

if t == 0 {
    phase = 0
    move_to(xstart, ystart + 320, 0.1, -0.05)
}

if y >= ystart+300 && phase == 0 {
    phase = 1
    friction = 1
    move = 0
}

if phase == 1 && speed <= 0.01 {
    phase = 2
    move_to(xstart, ystart - 64, 2, 0)
    instance_create(0,0,Attack4_Spawner)
}

if phase == 2 && y <= ystart - 64 + 10 {
    phase = 3
}

if phase == 3 && t mod 25 == 0 {
    move = 0
    friction = 0
    tx = random_range(xstart-25,xstart+25)
    ty = random_range(ystart-25 - 64, ystart+25 - 64)
    direction = point_direction(x,y,tx,ty)
    speed = 0.5
}


if t == 50*8 {
    sound_play('sndHibachiMode4')
}

if t == 50 * 31 {
    with Attack4_Spawner instance_destroy()
}

if t == 50 * 35 {
    mode = 1
    t = 0
    exit
}

t += 1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Mode 5

if mode != 5 {
    exit
}

if t == 0 {
    can_kill = 0

    sound_play("sndHibachiP1Die")

    with Attack1_Fall_Spawner instance_destroy()
    with Attack1_Spin_Spawner instance_destroy()
    with Attack2_Spawner instance_destroy()
    with Attack3_Spawner instance_destroy()
    with Attack4_Spawner instance_destroy()
    with HibachiProtect instance_destroy()

    with BulletParent {
        if string_pos('Blue', sprite_get_name(sprite_index) ) != 0 {
            instance_create(x,y,BulletVanishEffect_Blue)
        } else {
            instance_create(x,y,BulletVanishEffect_Pink)
        }

        instance_destroy()
    }
}

if t == 50 {
    sprite_index = sprHibachiChange
    image_index = 0
    sound_play("sndHibachiChange")
}

if t == 120 {
    instance_create(x,y,Attack5_Spawner)
    can_kill = 1
}

if t == 150 {
    final = sound_play("sndHibachiFinal")
}

if t > 50 && t mod 50 ==0 {
    len = 100
    ysp = 200
    xsp = 400
    if x < xsp && y < ysp {
        dir = random_range(-90, 0)
    } else if x > xsp && y < ysp {
        dir = random_range(180, 270)
    } else if x < xsp && y > ysp {
        dir = random_range(0, 90)
    } else {
        dir = random_range(90, 180)
    }
    move_to(x+lengthdir_x(len,dir), y+lengthdir_y(len,dir), 0.1, -0.1)
}


t += 1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Mode 6 - Die

if mode != 6 {
    exit
}

if t == 0 {
    mask_index = sprEmpty

    with Attack5_Spawner instance_destroy()

    with Attack1_Fall_Spawner instance_destroy()
    with Attack1_Spin_Spawner instance_destroy()
    with Attack2_Spawner instance_destroy()
    with Attack3_Spawner instance_destroy()
    with Attack4_Spawner instance_destroy()

    with HibachiProtect instance_destroy()

    with HibachiWing instance_destroy()
    with HibachiFire instance_destroy()

    with BulletParent {
        if string_pos('Blue', sprite_get_name(sprite_index) ) != 0 {
            instance_create(x,y,BulletVanishEffect_Blue)
        } else {
            instance_create(x,y,BulletVanishEffect_Pink)
        }

        instance_destroy()
    }

    sound_stop_all()
    sound_play('sndHibachiP2Die')

}

if t > 1 && t < 100 and t mod 10 == 0 {
    instance_create(random_range(x-64,x+64),random_range(y-64,y+64),ExpoEffect)
}

if t == 100 {
    a=instance_create(x,y,ExpoEffect)
    a.sprite_index = sprExpo_L

    sprite_index = sprHibachiDie1
    image_index = 0

    instance_create(x,y,HibachiDieEffect)

    sound_play('sndHibachiP2End')
    add = 1

    vspeed = 0.5
    friction = 0
    move = 0
}

if t == 300 {
    sprite_index = sprHibachiDie3
    image_index = 0
}

if t == 350 {
    instance_create(0, 0, PassWhite)
}

t += 1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// MOVE

if move {
    if point_distance(x, y, move_x, move_y) <= speed {
        x = move_x
        y = move_y
        speed = 0
        move = 0
    }
}
#define Collision_PlayerBullet
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
with other {
    instance_destroy()
}
if can_kill and !cool {
    cool = 1
    hp -= 1
    alarm[5] = 5

    if hp == 150 {
        t = 0
        mode = 5
    }

    if hp == 0 {
        t = 0
        mode = 6
    }
}
#define Other_7
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
switch sprite_index {
    case sprHibachiStart1:
        sprite_index = sprHibachiStart2
        break
    case sprHibachiStart2:
        sprite_index = sprHibachiStart2Loop
        break
    case sprHibachiStart3:
        image_speed = 0
        image_index = image_number-1
        break
    case sprHibachiChange:
        image_speed = 0.3
        image_index = 0
        sprite_index = sprHibachiBee
        break
    case sprHibachiDie1:
        image_speed = 0.3
        image_index = 0
        sprite_index = sprHibachiDie2
        break
    case sprHibachiDie3:
        visible = 0
        break
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if shadow {
    for (i = 0; i < 4; i += 1) {
        for (j = 0; j < 5; j += 1) {
            len = j * 15
            dir = shadow_dir + i * 90
            al = lerp(0.5, 0, j/5)
            draw_set_blend_mode(bm_add)
            draw_sprite_ext(sprHibachiDefault, 0, x+lengthdir_x(len, dir), y+lengthdir_y(len, dir), image_xscale, image_yscale, image_angle, image_blend, al)
            draw_set_blend_mode(bm_normal)
        }
    }

    shadow_dir -= 1
}

if add {
    draw_set_blend_mode(bm_add)
    draw_self()
    draw_set_blend_mode(bm_normal)
} else draw_self()

draw_set_color(c_white)
//draw_text(32,32,t)
//draw_text(32,64,hp)
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///HP
if can_skip exit
draw_set_color(c_red)

draw_set_alpha(hp_al)

draw_rectangle(0,0,800*(hp/max_hp),16,0)

draw_set_alpha(1)

if hp_al < 1 {
    hp_al += 0.01
}
#define KeyPress_83
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if !can_skip exit
sound_stop_all()
alarm[1] = 1
