void setup(){
    size(800, 800);
   
}

void draw(){
     for(int i = 0; i < 800; i=i+25){
        line(i, 0, i, 800);
        line(0, i, 800, i);
    }
}