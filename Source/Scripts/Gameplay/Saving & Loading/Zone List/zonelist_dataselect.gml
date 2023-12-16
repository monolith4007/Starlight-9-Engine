/// zonelist_dataselect()
// This is used to load the proper stage after selecting a saved game.
// Make sure to set the value of global.zone_id in stage_initialization() in the first act of a zone.
switch (global.zone_id)
{
    case 1: return global.first_zone; break;
}
