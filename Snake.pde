int dx = 0;
int dy = 0;
int koerperlaenge = 0;
int score = 0; 
static List<Koerper> koerperliste;
Apfel apfel;
Koerper kopf;
Koerper body;
Highscore oHighscore;

void setup(){
    size(800, 800);
    frameRate(6);
    koerperliste = new List<Koerper>();
    kopf = new Koerper(16, 16);
    koerperliste.append(kopf);
    apfel = new Apfel();
    oHighscore = new Highscore();
    
    //Textsetup
    textSize(30);
}

void restart(){
    score = 0;
    koerperlaenge = 0;
    dx = 0;
    dy = 0;
    setup();
    loop();
    //hier die restart routine ergänzen
}

void draw(){
    // Feld malen
    background(190,190,190);
     for(int i = 0; i < 800; i+=25){
        line(i, 0, i, 800);
        line(0, i, 800, i);
    }
    
    //(High-)Score anzeigen
    fill(0);
    text("score: " + score, 650, 30);
    text("Highscore: " + oHighscore.highscore, 600, 70);

    //Schlangenkopf bewegen
    kopf.kopfBewegen(dx, dy);

    //Alle Körperglieder bewegen
    koerperbewegen();

    //Apfel zeichnen & bei Collison umpositionieren & neues Körperteil veranlassen
    apfel.apfel_zeichnen();
    println((apfel.xpos == kopf.xpos) && (apfel.ypos == kopf.ypos));
    if((apfel.xpos == kopf.xpos) && (apfel.ypos == kopf.ypos)){
        println("mumpf");
        apfelEssen();
        neuesKoerperteil();
    }

    if(bitSlef()){
        if(score > oHighscore.highscore){
          oHighscore.saveNewHighscore(score);
        }
        println("Stop Game");
        noLoop();
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

    if(keyCode == 32){
      println("Restart");
        restart();
    }
}


public void apfelEssen(){
    apfel = new Apfel();
    score++;
}

public void neuesKoerperteil(){
  koerperlaenge++;
  Koerper body = new Koerper((kopf.xpos+(dx*-1))*25, (kopf.ypos+(dy*-1))*25);
  koerperliste.append(body);
  //Schöneheits-Bug ausbügeln; nur Lücke schaffen, wenn mind. 1 Glied vorhanden ist
  if(koerperlaenge > 1){
      kopf.kopfBewegen(dx, dy);
      koerperbewegen();
  }
}

public void koerperbewegen(){
    //alle Körperteile zeichnen
    koerperliste.toFirst();
    for(int i = 0; i < koerperlaenge; i++){
        int oldx = koerperliste.getContent().oldXpos;
        int oldy = koerperliste.getContent().oldYpos;
        koerperliste.next();
        koerperliste.getContent().body_zeichnen(oldx, oldy);
    }
}

public boolean bitSlef(){
    koerperliste.toFirst();
    koerperliste.next(); 
    do{
        if(koerperlaenge >= 4){ // ein Körperlänge ereicht die sich selbst beisen kann? 
            if((kopf.xpos == koerperliste.getContent().xpos) && (kopf.ypos == koerperliste.getContent().ypos)){
                return true; // joa slebt gebissen
            }
        }
        koerperliste.next();
    }while(koerperliste.hasAccess()); // solange widerholen, bis das leztzt Glied überprüft wurde
    return false;
}
