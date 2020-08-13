class HUD{
  PImage angel;
  int score;
  int health;
  float posx,posy;
  float angle;
  
  HUD(Angela angela){
    angel=loadImage("angela.png");
    this.health=angela.health;
    posx=500;
    posy=500;
    score=0;
   }
  
   void gameover(Angela angela){
    if(angela.health<=0){
      
      if(random(0,1)<0.5){
        fill(255,0,0);
        angela.noncecoviddifull.play();
        delay(2900);
      }
      else{
        angela.asettembre.play();
        delay(2500);
      }
      coviddi.state=0;
      setup();
    }
  }
 
   
  
  
  void run(Angela angela){
     gameover(angela);
   }
}
