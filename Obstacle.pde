public class Obstacle {
  int xpos; 
  int ypos; 
  int step = 20;

  public Obstacle() {
    xpos = (int)random(0, 32);
    ypos = (int)random(0, 32);
    rect(xpos*25, ypos*25, 25, 25);
  }

  public void apfel_zeichnen() {
    if (step>0) {
      step--;
    }
    if (step % 2==0) {
      fill(255, 0, 255);
    } else {
      fill(255, 255, 0);
    }
    rect(xpos*25, ypos*25, 25, 25);
  }

  public boolean collision(int x, int y) {
    if (step>0)
      return false;
    else return x==xpos && y==ypos;
  }
}
