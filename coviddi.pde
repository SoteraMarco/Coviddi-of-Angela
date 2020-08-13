import processing.sound.*;

static PImage background;
static PImage tutorial;

Angela angela;
ArrayList <Vairus> virus;
ArrayList <Mask> mask;
ArrayList <Amuchina> amuchina;
HUD hud;

boolean rectOver = false;
int rectX,rectY;
int rectDimX,rectDimY;
color c;
float r,g,b;

static int state = 0; 
final int MAIN_MENU = 0;
final int GAME = 1;
final int TUTORIAL = 2;

float rand;

void setup(){

  size(1000,800);
  background=loadImage("background.jpeg");
  tutorial=loadImage("tutorial.png");
  background.resize(1000,800);
  image(background,0,0);
  virus=new ArrayList<Vairus>();
  mask=new ArrayList<Mask>();
  amuchina=new ArrayList<Amuchina>();
  angela=new Angela(width/2,height/2);
  hud=new HUD(angela);
  
  
  rectDimX=width/4;
  rectDimY=height/12;
  rectX=width/2;
  rectY=height/2;
  rand=(random(0,10));
  if(rand<5)
    angela.buonagiornata.play();
  if(rand>=5)
    angela.buongiorno.play();
}

void draw(){
  //println("Vita Angela : :"+angela.health);
  switch(state) {
  case MAIN_MENU:
  
    imageMode(CORNER);
    image(background,0,0);
    tutorial.resize(1000,500);
    image(tutorial,0,0);
    
    r=random(0,255);
    g=random(0,255);
    b=random(0,255);
    c=color(r,g,b);
    
    pushMatrix();
      fill(255);
      rectMode(CENTER);
      noStroke();
      rect(rectX, rectY, rectDimX-55, rectDimY);
    popMatrix();
    
    pushMatrix();
      fill(c);
      textAlign(CENTER,CENTER);
      textSize(56);
      text("START",rectX,rectY-5,rectDimX, rectDimY);
   popMatrix();
   
      rectOver=overRect(rectX,rectY,rectDimX,rectDimY);
      fill(0);
      textSize(15);
      text("Created by Marco Sotera",width-97,10);
      break;
  case GAME:
  
   imageMode(CORNER);
   image(background,0,0);
   angela.run(virus,mask,amuchina);
   //if(random(0,1)<0.09)
   // amuchina.add(new Amuchina(random(100,width-100),random(100,height-100)));
   // for(Amuchina a: amuchina){
   //  a.run();
   // //println("N° Amuchina : "+amuchina.size());
   //}
   
   if(random(0,1)<0.05)
    virus.add(new Vairus(random(-50,width+50),-50,int(random(50,100))));
   if(random(0,1)<0.05)
    virus.add(new Vairus(-50,random(50,height+50),int(random(50,100))));
   if(random(0,1)<0.05)
    virus.add(new Vairus(width+50,random(0,height+50),int(random(50,100))));
   if(random(0,1)<0.05)
    virus.add(new Vairus(random(-50,width+50),height+50,int(random(50,100))));
   for(Vairus v: virus){
     v.run();
    //println("N° Vairus : "+virus.size());
   }
   
   if(random(0,1)<0.01)
    mask.add(new Mask(random(-50,width+50),-50,int(random(50,100))));
   if(random(0,1)<0.01)
    mask.add(new Mask(-50,random(50,height+50),int(random(50,100))));
   if(random(0,1)<0.01)
    mask.add(new Mask(width+50,random(0,height+50),int(random(50,100))));
   if(random(0,1)<0.01)
    mask.add(new Mask(random(-50,width+50),height+50,int(random(50,100))));
   for(Mask m: mask){
     m.run();
     //println("N° Mask : "+mask.size());
     //println(" sec");  
    }
    health();
    score();
    hud.run(angela);
    println(second());
  
    break;
  }  
  
  
}

boolean overRect(int x, int y, int width, int height)  {
  if (mouseX >= x-width/2 && mouseX <= x+width/2 && 
      mouseY >= y-height/2 && mouseY <= y+height/2) {
    return true;
  } else {
    return false;
  }
}

void mousePressed() {
  if (rectOver) {
    state=1;
      angela.oggimare.play();
    
  }
}

void health(){
    fill(255);
    rect(0,0,350,80);
    fill(0);
    textAlign(CENTER,CENTER);
    textSize(30);
    text("HEALTH: "+angela.health,85,20);
}

void score(){
    fill(255);
    rect(width,0,350,80);
    fill(0);
    textAlign(CENTER,CENTER);
    textSize(30);
    text("SCORE: "+angela.score,width-80,20);
}
