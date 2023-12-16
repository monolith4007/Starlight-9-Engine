/// player_ringtoss()
// Used to toss rings after getting hit.

// Play ring toss sound:
audio_play(SFX._player_ring_drop, SFX.sfx_volume, 1, 0, 0);

// Create ring variables:
var ring_total, ring_angle, ring_speed, ring;
ring_total = min(global.player_rings, 32);
ring_angle = 101.25;
ring_speed = 4;

// Toss rings:
while (ring_total)
{
    ring          =  instance_create(x, y, obj_ring);
    ring.lifespan =  256;
    ring.y_speed  = -dsin(round(ring_angle)) * ring_speed;
    ring.x_speed  =  dcos(round(ring_angle)) * ring_speed;
    ring.motion   =  true;

    if (ring_total mod 2 != 0)
    {
        ring_angle   += 22.5;
        ring.x_speed *= -1;
    }
    ring_total -= 1;
    if (ring_total == 16)
    {
        ring_speed = 2;
        ring_angle = 101.25;
    }
}
global.player_rings = 0;
