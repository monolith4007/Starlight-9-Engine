# Starlight-9-Engine
![alt text](https://cdn.discordapp.com/attachments/1010298152106086540/1185522850229125211/Logo.png)

Starlight 9 Engine (abbreviated as S9E) is a Sonic the Hedgehog framework/template for Game Maker 8.1 and a modification of the Starlight 8 Engine.
Based on previous Sonic Dash frameworks, it is designed with simplicity in mind, whilst attempting to fix any issues these previous frameworks had, as well as remaining mostly accurate to the original Genesis Sonic games.

# Features
- Mostly accurate Sonic 2/3 physics and camera movement.
- 5 playable characters: Classic Sonic, Tails, Knuckles, Amy & Modern Sonic, each with their respective abilities.
- Tails flight assist: he can carry an existing second character while flying.
- Character-colored trail effect that follows them whilst jumping and rolling from Sonic the Hedgehog 4.
- 360 degree rotation mimicking Sonic Mania's, and 8x 45 degree rotation mimicking the original Genesis games'.
- Basic & Elemental shields.
- A selection of badniks and gimmicks from the original Genesis games.
- Basic grinding.
- Sonic 1's, 2's and 3's title cards.
- An identical Data Select menu to Sonic 3's, and custom title screen, options and level selection menus.

# S8E => S9E Changes
For the full list of changes between S8E and S9E, see the changelog:
https://github.com/AkumaXP/Starlight-9-Engine/blob/main/S9E_Changelog.txt

Alternatively, you can download V3.1 of S8E from here and view the differences between it and S9E:
https://drive.google.com/file/d/1NCz-Uax4JcLz3-trludktemMbF2GelRi/view

# Building
- You can either download the .gm81 file from the "Releases" section, or you can use GmkSplitter to compile the "Source" folder from the main branch back into a .gm81 (https://github.com/Medo42/Gmk-Splitter).
- You'll need Game Maker 8.1.141 Standard to load the project, and you'll also need to install the GM 8.2 extensions in the "Extensions" folder from the main branch (do NOT download the extensions from the "Releases" section of their respective GitHub pages as those builds are outdated).
- You'll also need to include the "data" folder from the main branch in the same directory as the .gm81 file for audio to load/play and savestates to be read/written to.

# GameMaker: Studio Compatibility
S9E is mostly compatible with GameMaker: Studio, however, you'll need to make some changes with audio playback and gamepad management before importing the project.

For audio playback:
- You'll need to remove the gm82snd extension and re-write the audio scripts using Studio's audio functions.
- You'll have to add each sound and music file from the "data\audio" directory into the project, and you'll need to delete the "audio_initialize" script.
- The "audio_is_playing" script needs to be deleted.
- For the "audio_stop" script, you have 2 choices:
  1. You can replace the calls for "audio_stop" with Studio's "audio_stop_sound" function (but if the argument is "all", you'll need to replace it with "audio_stop_all").
  2. You can simply place the following code in the script:
     ```
     if (argument0 != all) audio_stop_sound(argument0);
     else audio_stop_all();
     ```

For gamepad management:
- You'll need to remove the gm82joy extension and use Studio's gamepad functions instead.

# Credits
- Coding: Aleksander Norberg (A.NB/AleksNB), Damizean, RogueYoshi, Chaos Rush, Chasman86, Shiro/Violet, TruePowerofTeamwork/Tpot, Noah N Copeland, F4LK, John-Kun, VectorSatyr, SoniKast, PVic, TsukiruP, AkumaXP (myself).
  > Additional credit to everyone else that helped with the development of S8E, Sonic MAX, SonicForGMS and any other Sonic Dash based frameworks.
- Accuracy: Sonic Retro's Physics Guide.
- Beta testing: somerandomusername, TsukiruP.
- S8E reupload: Sonic Help Zone.
- Amy Rose sprites: ChelseaCatGirl, E-122-Psi, MotorRoach.
- Modern Sonic sprites: Shinbaloonba (for the original sheet), thesped2334 (for the edited color palette).
- Classic Sonic, Tails, Knuckles and other sprites: SEGA, Sonic Team.
- Modified dropdash dust and basic shield sprites: VectorSatyr.
- Music: SEGA, Sonic Mania Team, the composer of the options menu theme.
- GmkSplitter: Medo42.
- Various Game Maker 8.2 extensions: 8.2 Project.
- JoyDLL (basis of gm82joy): Evan Balster.
    > SDL2: SDL contributors.
- GMFMODSimple (basis of gm82snd): icuurd12b42, Grix.
    > FMOD Sound System: Firelight Technologies.
- Game Maker 8.1: Mark Overmars, YoYo Games.
- Sonic the Hedgehog: SEGA, Sonic Team.

# Usage Terms
You're free to use S9E however you wish, just keep in mind to credit those who helped with its development.