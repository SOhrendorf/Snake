public class Koerper{
    int xpos;
    int ypos; 
    public Koerper(int pXpos, int pYPos){
        xpos = pXpos;
        ypos = pYPos;
    }

    public void apfel_zeichnen(){
        fill(0,250,0);
        rect(xpos, ypos, 25, 25);
    }
}
