class Vairus{
  PImage virus;
  float speedx,speedy;
  float posx,posy;
  int dim;
  float centerx,centery;
  float angle, jitter;
  
  Vairus(float posx,float posy,int dim){
   
    this.dim=dim;
    virus=loadImage("vairus.png");
    virus.resize(dim,dim);
    speedx=random(-3,3);
    speedy=random(-3,3);
    this.posx=posx+dim/2;
    this.posy=posy+dim/2;
  }
  
  void move(){
    
   
     posx=posx+speedx;
     posy=posy+speedy;
    
    
  }

  
  void display(){
    
      pushMatrix();
      noStroke();
      fill(0,0,0,0);    
      ellipseMode(CENTER);
      ellipse(posx,posy,dim,dim);
      
    popMatrix();
    
    pushMatrix();
        imageMode(CENTER);
        image(virus,posx,posy);
    popMatrix();

  
   
  }
  
  void run(){
    display();
    move();
  }
}
