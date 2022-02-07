void setup(){
    size(800, 800);
   
}

void draw(){
    // Feld malen
    background(grey);
     for(int i = 0; i < 800; i+=25){
        line(i, 0, i, 800);
        line(0, i, 800, i);
    }
}