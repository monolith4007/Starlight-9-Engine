/// player_add_score(score_x, score_y)
// Increases the player's score based on a multiplier.
var _score;
_score = instance_create(argument0, argument1, obj_score);

// Add to multiplier and return score.
score_multiplier += 1;
if (score_multiplier == 1)
{
    _score.image_index   = 1;
    global.player_score += 100;
}
else if (score_multiplier == 2)
{
    _score.image_index   = 2;
    global.player_score += 200;
}
else if (score_multiplier == 3)
{
    _score.image_index   = 3;
    global.player_score += 500;
}
else if (score_multiplier > 3 && score_multiplier < 16)
{
    _score.image_index   = 4;
    global.player_score += 1000;
}
else
{
    _score.image_index   = 5;
    global.player_score += 10000;
}
