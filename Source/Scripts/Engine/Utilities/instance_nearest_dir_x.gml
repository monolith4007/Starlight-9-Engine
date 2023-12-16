/// instance_nearest_dir_x(x, y, obj, dir, dist)
// Finds the nearest instance in the given direction within the given distance.

// Variables:
var _x, _y, _obj, _dir, _dist, _n, _ins, _ins_x;
_x    = argument0;
_y    = argument1;
_obj  = argument2;
_dir  = argument3;
_dist = argument4;
_n    = 1;

// Find instance:
repeat (instance_number(_obj))
{
    _ins = instance_nth_nearest(_x, _y, _obj, _n);
    if (distance_to_object(_ins) > _dist || _ins == noone)
    {
        break;
    }

    _ins_x = _ins.x;

    switch (_dir)
    {
        case ">":
        {
            if (_ins_x > _x) return _ins;
            break;
        }
        case "<":
        {
            if (_ins_x < _x) return _ins;
            break;
        }
        case ">=":
        {
            if (_ins_x >= _x) return _ins;
            break;
        }
        case "<=":
        {
            if (_ins_x <= _x) return _ins;
            break;
        }
    }
    _n += 1;
}

// If no instance was found or fit the given parameters, return.
return noone;
