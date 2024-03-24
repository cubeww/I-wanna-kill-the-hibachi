#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
x += 17
y += 23

sprite_index = sprPlayerIdle
gravity = 0.4
image_speed = 0.2
xscale = 1
djump = true
die = false

t = 0

instance_create(x,y,PlayerMask)

frozen = 1
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if die {
    exit
}

if frozen {
    exit
}

h = keyboard_check_direct(vk_right)
if h == 0 {
    h = -keyboard_check_direct(vk_left)
}

if h != 0 {
    xscale = h
    sprite_index = sprPlayerRunning
    image_speed = 0.5
} else {
    sprite_index = sprPlayerIdle
    image_speed = 0.2
}

hspeed = 3 * h

if vspeed < -0.05 {
    sprite_index = sprPlayerJump
}

if vspeed > 0.05 {
    sprite_index = sprPlayerFall
}

if abs(vspeed) > 9 {
    vspeed = sign(vspeed) * 9
}

if keyboard_check(ord('Z')) && t == 0 {
    t = 10
    a = instance_create(x, y, PlayerBullet)
    a.speed = 12
    a.direction = 90
    a = instance_create(x, y, PlayerBullet)
    a.speed = 12
    a.direction = 90+45
    a = instance_create(x, y, PlayerBullet)
    a.speed = 12
    a.direction = 90-45
    a = instance_create(x, y, PlayerBullet)
    a.speed = 12
    a.direction = 90-22.5
    a = instance_create(x, y, PlayerBullet)
    a.speed = 12
    a.direction = 90+22.5
    sound_play('sndShoot')
}

if keyboard_check_pressed(vk_shift) {
    if place_meeting(x, y + 1, Block) {
        vspeed = -8.5
        djump = true
        sound_play('sndJump')
    } else if 1 || djump {
        vspeed = -7
        sprite_index = sprPlayerJump
        djump = false
        sound_play('sndDJump')
    }
}

if keyboard_check_released(vk_shift) {
    if vspeed < 0 {
        vspeed *= 0.45
    }
}

t -= 1

if t < 0 {t = 0}
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if die {
    exit
}
#define Collision_Block
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if die {
    exit
}

if !place_free(x + hspeed, y) {
    move_contact_solid(180 * (hspeed <= 0), abs(hspeed))
    hspeed = 0
}

if !place_free(x, y + vspeed) {
    if vspeed > 0 {
        djump = true
    }
    move_contact_solid(90 + 180 * (vspeed > 0), abs(vspeed))
    vspeed = 0
}

if !place_free(x + hspeed, y + vspeed) {
    hspeed = 0
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if die {
    exit
}

draw_sprite_ext(sprite_index, image_index, x, y, xscale, image_yscale, image_angle, image_blend, image_alpha)
