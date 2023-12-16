/// save_delete(slot)
// Deletes the save load with the given ID.

// Add a zero in front of the slot number if it's less than 10:
if (argument0 < 10)
{
    argument0 = "0" + string(argument0);
}

// Check if the save exists and delete it. Otherwise, return false.   
if (file_exists(working_directory + "\data\save\data" + string(argument0) + ".sav"))
{
    file_delete(working_directory + "\data\save\data" + string(argument0) + ".sav");
    return true;
}
else
{
    return false;
}
