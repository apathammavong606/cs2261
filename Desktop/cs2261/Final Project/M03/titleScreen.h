
//{{BLOCK(titleScreen)

//======================================================================
//
//	titleScreen, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 50 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 1600 + 2048 = 4160
//
//	Time-stamp: 2018-11-12, 16:46:05
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_TITLESCREEN_H
#define GRIT_TITLESCREEN_H

#define titleScreenTilesLen 1600
extern const unsigned short titleScreenTiles[800];

#define titleScreenMapLen 2048
extern const unsigned short titleScreenMap[1024];

#define titleScreenPalLen 512
extern const unsigned short titleScreenPal[256];

#endif // GRIT_TITLESCREEN_H

//}}BLOCK(titleScreen)
