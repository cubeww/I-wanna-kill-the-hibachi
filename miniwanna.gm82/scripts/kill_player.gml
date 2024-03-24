with Player {
    die = true
    sound_play('sndDeath')

    repeat 200 {
        instance_create(x, y, PlayerBlood)
    }

    World.death += 1
}
