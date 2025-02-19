public class Rectangular {
    int l;  
    int w;
    int h;

    
    Rectangular(int l, int w, int h) {
        this.l = l;
        this.w = w;
        this.h = h;
    }

    
    public double calcVol() {
        double vol = l * w * h;
        return vol;
    }

    
    public double calcSurfArea() {
        double surfaceArea = 2 * ((l*w)+(l*h)+(w*h));
        return surfaceArea;
    }
}