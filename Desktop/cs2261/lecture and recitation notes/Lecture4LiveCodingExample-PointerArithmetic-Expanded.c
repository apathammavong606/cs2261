// Pointer Arithmetic In-Class Examples (extended)
#define RGB(R, G, B) ((R) | (G) << 5 | (B) << 10)
#define REG_DISPCNT (unsigned short *)0x04000000
#define PIXEL_00 0x06000000

typedef unsigned short u16;
typedef unsigned char u8;

int main() {
  *REG_DISPCNT = 0x403;
  u16 *pixel00 = (u16*)PIXEL_00;

  pixel00 + 1; // what is this???
  // this is the same as:
  (u16*)((int)pixel00 + 1*sizeof(u16));

  // Use to set pixel (239,0) to cyan (remember to deref, still)
  *(pixel00 + 239) = RGB(0, 31, 31);
  // Use verbose version to Set Pixel (238,0) yellow
  *(u16*)((int)pixel00 + 239*sizeof(u16)) = RGB(31, 31, 0);
  // this is also the same as:
  // pixel00[239] = RGB(31, 31, 0);

  // Our Original Demo for pixels using the array syntax which does
  //   pointer arithmetic AND a dereference for us very conveniently
  u16* videoBuffer = (u16*)PIXEL_00;
  videoBuffer[0] = RGB(31, 31, 31);
  videoBuffer[1] = RGB(31, 0, 0);
  videoBuffer[2] = RGB(0, 31, 0);
  videoBuffer[3] = RGB(0, 0, 31);

  // so in principal, these are all valid SetPixels:
  #define SetPixel1(x, y, val) (*(u16*)(PIXEL_00 + 2*(x) + 2*(y)*240) = val)
  #define SetPixel2(x, y, val) (*((u16*)PIXEL_00 + (x) + (y)*240) = val)
  #define SetPixel3(x, y, val) (((u16*)PIXEL_00)[(x) + (y)*240] = val)

  SetPixel1(5, 5, RGB(0, 31, 31));
  SetPixel2(10, 10, RGB(31, 0, 31));
  SetPixel3(15, 15, RGB(31, 31, 0));
}
