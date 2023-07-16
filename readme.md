# Source Code for distressCall mod to Metroid II: Return of Samus

see here for original project: https://github.com/alex-west/M2RoS

## Build Instructions

1. Install [rgbds](https://github.com/rednex/rgbds#1-installing-rgbds)
2. Either run `make all` or `build.bat`, depending on your preference.
3. The assembled game and a [BGB](http://bgb.bircd.org/) compatible `.sym` file will appear in the `out` folder.
4. Download a copy of the distressCall IPS here: https://metroidconstruction.com/hack.php?id=737
5. Apply the IPS to a copy of Metroid II: Return of Samus (the original ROM you patch with the IPS should have this hash: `md5: 9639948ad274fa15281f549e5f9c4d87`)
6. When you edit banks of the distressCall source, you will need to build it, and then paste the modified banks from the file produced in 'out' to the ROM produced when you patched the original game with the .ips patch.
7. LAMP (found here: https://github.com/ConConner/LAMP) was the tool I used to make the room layouts and enemy placements.

## Resources

- [mgbdis](https://github.com/mattcurrie/mgbdis) - The disassember used to create this project.
- [PJ's Bank Logs](http://patrickjohnston.org/ASM/ROM%20data/RoS/) - A rather extensive, but unbuildable, disassembly of the game.
- [MetConst Wiki](https://wiki.metroidconstruction.com/doku.php?id=return_of_samus) - Some of the information here is outdated.
- [M2 Music Tools](https://github.com/kkzero241/M2MusicTools) - A song extractor written by kkzero.
- [LA DX Disassembly](https://github.com/zladx/LADX-Disassembly) - A disassembly project of another game that also uses rgbds.

### Editors

- [M2Edit](https://m2sw.zophar.net/m2edit/) - Abandoned editor from 2004. Stable, but closed source and lacks enemy and door editing capabilities.
- [ROSE](https://github.com/liamnajor/ROSE) - WIP editor. Web based.
- [YAM2E](https://github.com/ConConner/YAM2E) - Very early WIP editor.
