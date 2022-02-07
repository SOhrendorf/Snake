int xpos = 16;
int ypos = 16; 
int dx;
int dy;
static List<Koerper> koerperliste;
Koerper apfel; 

void setup(){
    size(800, 800);
    frameRate(10);
    koerperliste = new List<Koerper>();
    apfel = new Koerper((int)random(0, 32),(int)random(0,32));
}

void draw(){
    // Feld malen
    background(190,190,190);
     for(int i = 0; i < 800; i+=25){
        line(i, 0, i, 800);
        line(0, i, 800, i);
    }
    bewegen();

    apfel.apfel_zeichnen();
    if(checkCollision()){
        apfelEssen();
    }
    
}

void keyPressed() {
    if(keyCode == 37 && dx != 1){ //Pfeil-Links
        dx = -1;
        dy = 0;
    }
    if(keyCode == 38 && dy != 1){ //Pfeil-Hoch
        dx = 0;
        dy = -1;
    }
    if(keyCode == 39 && dx != -1){ //Pfeil-Rechts
        dx = 1;
        dy = 0;
    }
    if(keyCode == 40 && dy != -1){ // Pfeil-Runter
        dx = 0;
        dy = 1;
    }
}

void bewegen(){
    xpos = xpos + dx;
    ypos = ypos + dy;
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

public boolean checkCollision(){
    println((apfel.xpos == xpos) && (apfel.ypos == ypos));
    return (apfel.xpos == xpos) && (apfel.ypos == ypos);
    
}

public void apfelEssen(){
    apfel = new Koerper((int)random(0, 32),(int)random(0,32));
    //Zähler einbauen hier & oben 
}
