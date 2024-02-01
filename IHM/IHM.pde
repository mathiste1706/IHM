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
 textSize(10);
//cam = new Capture(this, 640, 480);

}

void onglets(){
  
  fill(255);
  rect(0,40,140, height-90);
  fill(120);
  
  // Retour
  rect(0,10,60,30);
  fill(0,0,255);
  textAlign(LEFT,CENTER);
  text("Retour", 10,10,60,20);
  
  fill(120);
  
  //PlatJ
  rect(0,60,140, (height-20)/10);
  fill(0,0,255);
  textAlign(LEFT,CENTER);
  text("Plat du Jour", 10,60,140,(height-20)/10);
  
  fill(120);
  // Entrees
  rect(0,80+(height-20)/10,140, (height-20)/10);
  fill(0,0,255);
  textAlign(LEFT,CENTER);
  text("Entrees", 10,80+(height-20)/10,140, (height-20)/10);
  
  fill(120);
  
  //Plats
  rect(0,100+2*(height-20)/10,140, (height-20)/10);
  fill(0,0,255);
  textAlign(LEFT,CENTER);
  text("Plats", 10,100+2*(height-20)/10,140, (height-20)/10);
  
   fill(120);
  
  // Desserts
  rect(0,120+3*(height-20)/10,140, (height-20)/10);
  fill(0,0,255);
  textAlign(LEFT,CENTER);
  text("Dessert", 10,120+3*(height-20)/10,140, (height-20)/10);
  
  fill(120);
  
  // Boissons
  rect(0,140+4*(height-20)/10,140, (height-20)/10);
   fill(120);
   fill(0,0,255);
  textAlign(LEFT,CENTER);
  text("Boissons", 10,140+4*(height-20)/10,140, (height-20)/10);
  
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

 void mouseClicked() {
   // Retour
   if (mouseY>=10 && mouseX<=60 && mouseY>=30 ){
    mae = FSM.INITIAL;
   }
   
   // PlatJ
   else if (mouseY>=60 && mouseX<=140 && mouseY>=height-20/10){
     mae=FSM.PLATJ;
   }
   
   // Entrees
   else if (mouseY>=80 && mouseX<=140 && mouseY>=height-20/10){
     mae=FSM.ENTREES;
   }
   
    //Plats
    else if (mouseY>=100+2*(height-20)/10 && mouseX<=140 && mouseY>=height-20/10){
      mae=FSM.PLATS;
   }
   
    //Desserts
    else if (mouseY>=120+3*(height-20)/10 && mouseX<=140 && mouseY>=height-20/10){
      mae=FSM.DESSERTS;
   }
   
     else if (mouseY>=140+4*(height-20)/10 && mouseX<=140 && mouseY>=height-20/10){
       mae=FSM.BOISSONS;
   }
}
