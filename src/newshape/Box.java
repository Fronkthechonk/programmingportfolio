public class Box {
    int l;
    int w;
    int h;
   
   
   Box(int l, int w, int h) {
     this.l = l;
     this.w = w;
     this.h = h;
       
   }
   
   public int calcVol(){
     int vol = l * w * h;
     return vol;
   }
   public int calcSurfArea(){
      
     int sa = 2*l*w + 2*l*h + 2*h*w;
     return sa;
   }
}