/// save_load(slot)
// Loads the save slot with the given ID.

// Add a zero in front of the slot number if it's less than 10:
if (argument0 < 10)
{
    argument0 = "0" + string(argument0);
}

// If the save does not exist, exit.    
if (!file_exists(working_directory + "\data\save\data" + string(argument0) + ".sav"))
{
    return false;
}
else // Load data.
{
    var dkey, dfile, zoneVal, lifeVal, continueVal, emeraldVal, charVal, cpuVal, gameVal;
    
    // Decryption key:
    dkey = $4ad682aeb7218;
    
    // Open save:
    dfile = file_text_open_read(working_directory + "\data\save\data" + string(argument0) + ".sav");
    
    // Skip Warning:
    file_text_readln(dfile);
    
    // Zone:
    zoneVal = file_text_read_real(dfile);
    global.zone_id = (dkey ^ zoneVal);
    file_text_readln(dfile);
    
    // Lives:
    lifeVal = file_text_read_real(dfile);
    global.player_lives = (dkey ^ lifeVal);
    file_text_readln(dfile);
    
    // Continues:
    continueVal = file_text_read_real(dfile);
    global.player_continues = (dkey ^ continueVal);
    file_text_readln(dfile);
    
    // Emeralds:
    emeraldVal = file_text_read_real(dfile);
    global.player_emeralds = (dkey ^ emeraldVal);
    file_text_readln(dfile);
    
    // Character (Main):
    charVal = file_text_read_real(dfile);
    global.character[0] = (dkey ^ charVal);
    file_text_readln(dfile);
    
    // Character (CPU):
    cpuVal = file_text_read_real(dfile);
    global.character[1] = (dkey ^ cpuVal);
    file_text_readln(dfile);
    
    // Game completion:
    gameVal = file_text_read_real(dfile);
    global.game_completed = (dkey ^ gameVal);
    file_text_readln(dfile);
    
    // Close.                  
    file_text_close(dfile);
    return true;
}
