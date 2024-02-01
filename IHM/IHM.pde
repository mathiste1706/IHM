import processing.video.*;
import java.awt.image.BufferedImage;
Capture cam;
FSM mae;

public enum FSM {
  INITIAL, /* Etat Initial */ 
  PLATJ, 
  ENTREES,
  PLATS,
  DESSERTS,
  BOISSONS,
  STATS,
  VALIDER
}

void setup() {
 size(640, 550);
 background(255,0,0);
 mae=FSM.PLATJ;
 textSize(128);
//cam = new Capture(this, 640, 480);

}

void onglets(){
  
  fill(255);
  rect(0,20,140, height);
  fill(120);
  rect(0,0,60,20);
  text("Retour", 0,0);
  fill(0,0,255);
   fill(120);
  rect(0,40,140, (height-20)/10);
  fill(120);
  rect(0,60+(height-20)/10,140, (height-20)/10);
   fill(120);
  rect(0,80+2*(height-20)/10,140, (height-20)/10);
   fill(120);
  rect(0,100+3*(height-20)/10,140, (height-20)/10);
   fill(120);
  rect(0,120+4*(height-20)/10,140, (height-20)/10);
   fill(120);
  
}

void draw(){
 switch(mae){
   case INITIAL  :
   //TO DO
   break;
   
   case PLATJ:
   onglets();
   break;
   
   case ENTREES:
   
   break;
   
   case PLATS:
   
   break;
   
   case DESSERTS:
   
   break;
   
   case VALIDER:
   
   break;
 }
}
