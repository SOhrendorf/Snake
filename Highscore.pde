public class Highscore{
  String highscoreStorage[];
  int highscore;
  
  public Highscore(){
    highscoreStorage = new String[1];
    highscoreStorage = loadStrings("highscore.txt");
    highscore = Integer.parseInt(highscoreStorage[0]);
  }
  
  public void saveNewHighscore(int pScore){
    highscoreStorage[0] = "" + pScore;
    saveStrings("highscore.txt", highscoreStorage);
    highscore = pScore;
  }
}
