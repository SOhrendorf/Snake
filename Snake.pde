import processing.sound.*;
int dx = 0;
int dy = 0;
int koerperlaenge = 0;
int score = 0;
boolean keypressdOkay = true;
static List<Koerper> koerperliste;
static List<Apfel> barrierListe;
Apfel apfel;
Koerper kopf;
Koerper body;
Highscore oHighscore;
SoundFile sHintergrund;
SoundFile sEat;
SoundFile sDie;
SoundFile sHigh;

void setup(){
    size(800, 800);
    frameRate(6);
    koerperliste = new List<Koerper>();
    barrierListe = new List<Apfel>();
    kopf = new Koerper(16, 16);
    koerperliste.append(kopf);
    apfel = new Apfel();
    oHighscore = new Highscore();
    
    //Textsetup
    textSize(30);
    
    //sound
    sHintergrund = new SoundFile(this, "music/music.wav");
    sEat = new SoundFile(this, "music/eat.wav");
    sDie = new SoundFile(this, "music/crash.wav");
    sHigh = new SoundFile(this, "music/high.wav");
    
    sHintergrund.play();
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

public void gameOver(){
          if(score > oHighscore.highscore){
          oHighscore.saveNewHighscore(score);
        }
        sDie.play();
        println("Stop Game");
        sHintergrund.stop();
        noLoop();
}

void draw(){
    keypressdOkay = true;
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
    fill(0,250,0);
    apfel.apfel_zeichnen();
    println((apfel.xpos == kopf.xpos) && (apfel.ypos == kopf.ypos));
    if((apfel.xpos == kopf.xpos) && (apfel.ypos == kopf.ypos)){
        println("mumpf");
        apfelEssen();
        neuesKoerperteil();
    }
    
    //Barrieren zeichen & auf Collision prüfen
    barrierListe.toFirst();
      while(barrierListe.hasAccess()){
        fill(255,0,255);
        barrierListe.getContent().apfel_zeichnen();
        if(kopf.xpos == barrierListe.getContent().xpos && kopf.ypos == barrierListe.getContent().ypos){
          gameOver();
        }
        barrierListe.next();
      }

    if(bitSlef()){
      gameOver();
    }
}

void keyPressed() {
  if(keypressdOkay){
    if(keyCode == 37 && dx != 1){ //Pfeil-Links
        dx = -1;
        dy = 0;
        keypressdOkay = false;
    }
    if(keyCode == 38 && dy != 1){ //Pfeil-Hoch
        dx = 0;
        dy = -1;
        keypressdOkay = false;
    }
    if(keyCode == 39 && dx != -1){ //Pfeil-Rechts
        dx = 1;
        dy = 0;
        keypressdOkay = false;
    }
    if(keyCode == 40 && dy != -1){ // Pfeil-Runter
        dx = 0;
        dy = 1;
        keypressdOkay = false;
    }
  }
    if(keyCode == 32){
      println("Restart");
        restart();
    }
}


public void apfelEssen(){
    sEat.play();
    apfel = new Apfel();
    score++;
    if((score % 5 == 0) &&  score != 0){
      spawnBarrier();
      println("neue Wand!");
    }
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

public void spawnBarrier(){
  Apfel barrier = new Apfel();
  barrierListe.append(barrier);
}
