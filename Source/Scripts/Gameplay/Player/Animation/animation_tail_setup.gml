/// animation_tail_setup()
// Applies the appropriate animation & positioning for Tails' tails.
switch (animation_index)
{
    case "IDLE":
    case "BORED_1":
    case "BORED_2":
    case "LOOK_UP":
    case "CROUCH":
    case "HANG":
    {
        animation_tail_apply(spr_tail_part_1, 0.125, animation_direction * -14, 2, 0, animation_direction);
        break;
    }
    case "PUSH":
    {
        animation_tail_apply(spr_tail_part_3, 0.125, animation_direction * 11, 2, 0, animation_direction);
        break;
    }
    case "BALANCE_IN":
    {
        animation_tail_apply(spr_tail_part_1, 0.125, animation_direction * -10, -4, 0, animation_direction);
        break;
    }
    case "BRAKE":
    {
        animation_tail_apply(spr_tail_part_1, 0.125, animation_direction * -10, 2, 0, animation_direction);
        break;
    }
    case "ROLL":
    {
        animation_tail_apply(spr_tail_part_3, 0.25, 0, 0, tails_tail_angle, animation_direction);
        break;
    }
    case "SPINDASH":
    {
        animation_tail_apply(spr_tail_part_2, 0.33, animation_direction * -16, 2, 0, animation_direction);
        break;
    }
    case "RUN":
    {
        if (abs(x_speed) < 8)
        {
            animation_tail_apply(spr_tail_part_5, animation_speed, animation_direction * -2, -2, tails_tail_angle, animation_direction);
        }
        else
        {
            animation_tail_apply(spr_tail_part_6, animation_speed, animation_direction * -2, -2, tails_tail_angle, animation_direction);
        }
        break;
    }
    case "FLY":
    case "FLY_CARRY":
    case "FLY_DROP":
    {
        animation_tail_apply(spr_tail_part_4, 0.5, animation_direction * -6, -11, 0, animation_direction);
        break;
    }
    default:
    {
        animation_tail_apply(noone);
    }
}
