public class Koerper{
    int xpos;
    int ypos;
    int oldXpos = 0;
    int oldYpos = 0;
    int bodyStelle;

    //Konstruktor für Kopf
    public Koerper(int pXpos, int pYPos){
        xpos = pXpos;
        ypos = pYPos;
        fill(150,0, 0);
        rect(xpos, ypos, 25, 25);
    }


    void kopfBewegen(int pDx, int pDy){
        oldXpos = xpos;
        oldYpos = ypos;
        xpos = xpos + pDx;
        ypos = ypos + pDy;
        //Überprüfung rand
        if(xpos >= 33){
            xpos = 0;
        }
        if(ypos >= 33){
          ypos = 0;
        }
        if(xpos <= -1){
            xpos = 33;
        }
        if(ypos <= -1){
            ypos = 33;
        }
        fill(255, 0, 0);
        rect(xpos*25, ypos*25, 25, 25);
    }

    public void body_zeichnen(int pXpos, int pYpos){
        fill(150,0, 0);
        oldXpos = xpos; 
        oldYpos = ypos; 
        xpos = pXpos;
        ypos = pYpos; 
        rect(pXpos*25, pYpos*25, 25, 25);
    }
}
