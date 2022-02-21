public class Apfel{
    int xpos; 
    int ypos; 

    public Apfel(){
        xpos = (int)random(0, 32);
        ypos = (int)random(0, 32);
        rect(xpos*25, ypos*25, 25, 25);
    }

    public void apfel_zeichnen(){
        rect(xpos*25, ypos*25, 25, 25);
    }
}
