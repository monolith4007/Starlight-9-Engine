/// wrap_angle(value)
// Ensures that the angle is within the bounds.
while (argument0 < 0) argument0 += 360;
while (argument0 >= 360) argument0 -= 360;
return argument0;
