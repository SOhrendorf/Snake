int xpos = 16;
int ypos = 16; 
int dx;
int dy; 

void draw(){
    // Feld malen
    background(190,190,190);
     for(int i = 0; i < 800; i+=25){
        line(i, 0, i, 800);
        line(0, i, 800, i);
    int xpos;
    int ypos;
    int dx;
    int dy;
     }
void setup(){
    size(800, 800);
    frameRate(12);
}



void draw(){
    // Feld malen
    background(190,190,190);
     for(int i = 0; i < 800; i+=25){
        line(i, 0, i, 800);
        line(0, i, 800, i);
    }
    bewegen();
}

void keyPressed() {
    if(keyCode == 38){
        dx = 0;
        dy = -1;
    }
    if(keyCode == 40){
        dx = 0;
        dy = 1;
    }
     if(keyCode == 37){
        dx = -1;
        dy = 0;
    }
    if(keyCode == 39){
        dx = 1;
        dy = 0;
    }
}

    void bewegen(){
        xpos = xpos + dx;
        ypos = ypos + dy;
        fill(255,0,0);
        rect(xpos*25, ypos*25, 25, 25);
    }
}