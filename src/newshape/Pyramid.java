public class Pyramid {
    int l;
    int w;
    int h;
   
   
   Pyramid(int l, int w, int h) {
       this.l = l;
       this.w = w;
       this.h = h;
       
   }
   
     public double calcVol() {

        double vol = (1.0 / 3) * l * w * h;
        return vol;
    }

    
    public double calcSurfArea() {
        double slantHeight = Math.sqrt(Math.pow(l / 2.0, 2) + Math.pow(h, 2));
        double baseArea = l * w;
        double perimeter = 2 * (l + w);
        double lateralArea = (1.0 / 2) * perimeter * slantHeight;
        double surfaceArea = baseArea + lateralArea;
        return surfaceArea;
    }
}