public class Sphere {
    int r;  

    
    Sphere(int r) {
        this.r = r;
    }

    
    public double calcVol() {
        double vol = (4.0 / 3) * Math.PI * Math.pow(r, 3);
        return vol;
    }

    
    public double calcSurfArea() {
        double surfaceArea = 4 * Math.PI * Math.pow(r, 2);
        return surfaceArea;
    }
}