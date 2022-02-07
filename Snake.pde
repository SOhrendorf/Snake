int xpos;
int ypos; 
int dx;
int dy; 

void setup(){
    size(800, 800);
    frameRate(12);
}

void draw(){
    //Feld malen 
     for(int i = 0; i < 800; i=i+25){
        line(i, 0, i, 800);
        line(0, i, 800, i);
    }
}

void keyPressed() {
    if(keyCode == 38){
        dx = 0
        dy = -1
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
}