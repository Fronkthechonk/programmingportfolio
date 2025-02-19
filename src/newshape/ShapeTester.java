import java.util.Scanner;
public class ShapeTester {
    public static void main(String[] args)
    {
        
        System.out.println("Welcome to shape maker! Lets find the volume and surface area for a few shapes.");
        
        while(true)
        {
            Scanner scanner = new Scanner(System.in);
            System.out.println();
            System.out.println("To build a box, press 1:");
        System.out.println("To build a sphere, press 2:");
        System.out.println("To build a pyramid, press 3:");
        System.out.println("To build a rectangular prism, press 4:");
        int number = scanner.nextInt();
        
        if(number == 1)
        {
            System.out.println("Great! Let's start with a box. Please enter the length of the box:");
            int l = scanner.nextInt();
            System.out.println("Please enter the width of the box:");
            int w = scanner.nextInt();
            System.out.println("Please enter the height of the box:");
           int h = scanner.nextInt();
           Box box = new Box(l,w,h);
            int vol = box.calcVol();
            int surfaceArea = box.calcSurfArea();
           System.out.println("The volume for your box is: " + vol);
           System.out.println("The surface area for your box is: " + surfaceArea);
        }
        if(number == 2)
        {
            System.out.println("Great! Let's start with a sphere. Please enter the radius of the sphere:");
            int r = scanner.nextInt();
            Sphere sphere = new Sphere(r);
            double sVol = sphere.calcVol();
            double ssurfaceArea = sphere.calcSurfArea();
            System.out.println("The volume for your sphere is: " + sVol);
           System.out.println("The surface area for your sphere is: " + ssurfaceArea);
            
        }
        if(number == 3)
        {
            System.out.println("Great! Let's start with a pyramid. Please enter the length:");
            int pl = scanner.nextInt();
            System.out.println("Please enter the width:");
            int pw = scanner.nextInt();
            System.out.println("Please enter the height:");
            int ph = scanner.nextInt();
            Pyramid pyramid = new Pyramid(pl,pw,ph);
            double pVol = pyramid.calcVol();
            double psurfaceArea = pyramid.calcSurfArea();
            System.out.println("The volume for your pyramid is: " + pVol);
           System.out.println("The surface area for your pyramid is: " + psurfaceArea);
        }
        if(number == 4)
        {
             System.out.println("Great! Let's start with a rectangular prism. Please enter the length:");
            int rl = scanner.nextInt();
            System.out.println("Please enter the width:");
            int rw = scanner.nextInt();
            System.out.println("Please enter the height:");
            int rh = scanner.nextInt();
            Rectangular rectangular = new Rectangular(rl,rw,rh);
            double rVol = rectangular.calcVol();
            double rsurfaceArea = rectangular.calcSurfArea();
            System.out.println("The volume for your rectangular prism is: " + rVol);
           System.out.println("The surface area for your rectangular prism is: " + rsurfaceArea);
        }
        }
    }
}