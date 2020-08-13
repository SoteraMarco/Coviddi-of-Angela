class Angela{
  float posx,posy;
  int health;
  PImage angela;
  int dim;
  int time;
  float centerx,centery;
  SoundFile asettembre,buonagiornata,buongiorno,certo,dammilamascherina,
            doveilmio,efinitotutto,marzia,miomarito,noncecoviddi,noncecoviddifull,
            oggimare,ok,si,sisicerto;
  boolean checkAmuchina=false;
  int score;
  Angela(float posx,float posy){
    dim=130;
    this.posx=posx;
    this.posy=posy;
    angela=loadImage("angela.png");
    
    time=millis();

    this.health=10;
    score=0;
    
    asettembre=new SoundFile(coviddi.this,"data/audio/asettembre.wav"); 
    buonagiornata=new SoundFile(coviddi.this,"data/audio/buonagiornata.wav"); 
    buongiorno=new SoundFile(coviddi.this,"data/audio/buongiorno.wav"); 
    certo=new SoundFile(coviddi.this,"data/audio/certo.wav"); 
    dammilamascherina=new SoundFile(coviddi.this,"data/audio/dammilamascherina.wav"); 
    //doveilmio=new SoundFile(coviddi.this,"data/audio/doveilmio.wav"); 
    efinitotutto=new SoundFile(coviddi.this,"data/audio/efinitotutto.wav"); 
    //marzia=new SoundFile(coviddi.this,"data/audio/marzia.wav"); 
    //miomarito=new SoundFile(coviddi.this,"data/audio/miomarito.wav"); 
    noncecoviddi=new SoundFile(coviddi.this,"data/audio/noncecoviddi.wav"); 
    noncecoviddifull=new SoundFile(coviddi.this,"data/audio/noncecoviddifull.wav"); 
    oggimare=new SoundFile(coviddi.this,"data/audio/oggimare.wav"); 
    ok=new SoundFile(coviddi.this,"data/audio/ok.wav"); 
    sisicerto=new SoundFile(coviddi.this,"data/audio/sisicerto.wav"); 
    si=new SoundFile(coviddi.this,"data/audio/si.wav"); 
  }
 
  void display(){
    pushMatrix();
      noStroke();
      fill(0,0,0,0);
      ellipseMode(CENTER);
      ellipse(posx,posy,dim,dim);
    popMatrix();
    angela.resize(dim,dim);
    pushMatrix();
      imageMode(CENTER);
      image(angela,posx,posy);
    popMatrix();
  }
  
  void move(){
    posx=mouseX;
    posy=mouseY;
  }

  
  
  void checkEdgeVirus(ArrayList <Vairus> virus){
     for(int i=0;i<virus.size();i++){
       if(virus.get(i).posx>1200 || virus.get(i).posy>1000 || virus.get(i).posx<-1200 || virus.get(i).posy<-1000){
         virus.remove(i);
         i--;
       }
  
    }
  }
  
  void checkColVirus(ArrayList <Vairus> virus){
     for(int i=0;i<virus.size();i++){
      if(dist(virus.get(i).posx,virus.get(i).posy,posx,posy)<=((virus.get(i).dim/2)+((dim/2)-10))){
        dim=dim+10;
        virus.remove(i);
        health=health-2;
        if(health>0){
          if(random(0,1)<0.3){
            noncecoviddi.play();
          }
          else if(random(0,1)<0.3)
            efinitotutto.play();
            
        }
        i--;
        
      }
    }
  }
  
  void checkEdgeMask(ArrayList <Mask> mask){
     for(int i=0;i<mask.size();i++){
       if(mask.get(i).posx>1200 || mask.get(i).posy>1000 || mask.get(i).posx<-1200 || mask.get(i).posy<-1000){
         mask.remove(i);
         i--;
       }
  
    }
  }
  
  void checkColMask(ArrayList <Mask> mask){
     for(int i=0;i<mask.size();i++){
      if(dist(mask.get(i).posx,mask.get(i).posy,posx,posy)<=((mask.get(i).dim/2)+((dim/2)-10))){
        mask.remove(i);
        score++;
        
        if(random(0,1)<0.3){
          dammilamascherina.play();
        }
        else if(random(0,1)<0.3){
          certo.play();
        }
        else if(random(0,1)<0.3){
          sisicerto.play();
        }
        else if(random(0,1)<0.3){
          si.play();
        }
        else{
          ok.play();
        }
        i--;
        dim=dim-20;
        if(dim<=130)
          dim=130;
        
        
        health++;
        if(health>=10)
          health=10;
        }
    }
  }
  //void checkColAmuchina(ArrayList <Amuchina> amuchina){
  //  centerx=posx+dim/2;
  //  centery=posy+dim/2;
  //   for(int i=0;i<amuchina.size();i++){
  //     float testX = centerx;
  //     float testY = centery;
  //     if (centerx<amuchina.get(i).cornx)  
  //       testX=amuchina.get(i).cornx;    
         
  //     else if(centerx>amuchina.get(i).cornx+amuchina.get(i).dim1) 
  //       testX=amuchina.get(i).cornx+amuchina.get(i).dim1;  
         
  //     if(centery<amuchina.get(i).corny)         
  //       testY=amuchina.get(i).corny;      
         
  //     else if(centery>amuchina.get(i).corny+amuchina.get(i).dim2) 
  //       testY=amuchina.get(i).corny+amuchina.get(i).dim2; 
        
  //    float distX=centerx-testX;
  //    float distY=centery-testY;
  //    float dist=sqrt((distX*distX)+(distY*distY));
  //    if (dist<=dim/2) {
  //       amuchina.remove(i);
  //       checkAmuchina=true;
  //       i--;
  //      }
  //  }
  //}

 //void delayAmuchina(ArrayList <Amuchina> amuchina){
 //}
 
 // void nuclearize(ArrayList <Amuchina> amuchina,ArrayList <Vairus> virus){
 //   for(int i=0;i<amuchina.size();i++){
 //     if(dist(amuchina.get(i).posx,amuchina.get(i).posy,posx,posy)<=((amuchina.get(i).dim1/2)+((dim/2)-10))){
 //       amuchina.remove(i); 
 //       //for(int j=0;i<mask.size()-1;j++){
 //       //  virus.remove(j);
 //       //}
 //     }
 //   }
 // }

    void score(){
      if (millis() > time + 2000){
          score++;
          time = millis();
         }
    }
    
   void run(ArrayList <Vairus> virus, ArrayList <Mask> mask,ArrayList <Amuchina> amuchina){             
    move();
    checkEdgeVirus(virus);
    checkColVirus(virus);
    checkEdgeMask(mask);
    checkColMask(mask);
    score();
    display();
    //checkColAmuchina(amuchina);
    //nuclearize(amuchina,virus);
    //delayAmuchina(amuchina);
  }
  
}
