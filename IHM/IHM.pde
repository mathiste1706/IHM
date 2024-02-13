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

boolean firstMousePress = false;
VScrollbar vs1;

void setup() {
 size(640, 550);
 background(255,0,0);
 mae=FSM.PLATJ;
 textSize(10);
//cam = new Capture(this, 640, 480);
noStroke();
 vs1 = new VScrollbar(width-10, 0, 20, height, 3*5+1);

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

if (firstMousePress) {
    firstMousePress = false;
  }
 switch(mae){
   case INITIAL  :
    background(255,0,0);
   //TO DO
   break;
   
   case PLATJ:
    background(255,0,0);
   onglets();
   vs1.update();
   vs1.display();
   break;
   
   case ENTREES:
    background(255,0,0);
    onglets();
    vs1.update();
   vs1.display();
    
   fill(0,0,255);
   text("Entree1", 200,70);
   text("Entree2", 200,70+50);
   text("Entree3", 200,70+50*2);
   text("Entree4", 200,70+50*3);
   text("Entree5", 200,70+50*4);
   text("Entree6", 200,70+50*5);
   text("Entree7", 200,70+50*6);
   text("Entree8", 200,70+50*7);
   text("Entree9", 200,70+50*8);
   text("Entree10", 200,70+50*9);
   
  float leftPos = vs1.getPos()-height+150;
  fill(255);
   text("Entree11", 200,70+50*10);
   text("Entree16", 200,70+50+15);
   
   break;
   
   case PLATS:
    background(255,0,0);
    onglets();
    
   
   break;
   
   case DESSERTS:
    background(255,0,0);
    onglets();
   
   break;
   
   case BOISSONS:
   background(255,0,0);
   onglets();
   break;
   
   case VALIDER:
    background(255,0,0);
    onglets();
   
   break;
   
   case STATS:
   background(255,0,0);
   onglets();
   
   break;
 }
 
}


class VScrollbar{
  int swidth, sheight;    // width and height of bar
  int xpos, ypos;         // x and y position of bar
  float spos, newspos;    // x position of slider
  int sposMin, sposMax;   // max and min values of slider
  int loose;              // how loose/heavy
  boolean over;           // is the mouse over the slider?
  boolean locked;
  float ratio;

  VScrollbar (int xp, int yp, int sw, int sh, int l) {
    swidth = sw;
    sheight = sh;
    int heighttowidth = sh - sw;
    ratio = (float)sh / (float)heighttowidth;
    xpos = xp-swidth/2;
    ypos = yp;
    spos = ypos + sheight/2 - swidth/2;
    newspos = spos;
    sposMin = ypos;
    sposMax = ypos + sheight - swidth;
    loose = l;
  }

  void update() {
    if(over()) {
      over = true;
    } else {
      over = false;
    }
    if(mousePressed && over) {
      locked = true;
    }
    if(!mousePressed) {
      locked = false;
    }
    if(locked) {
      newspos = constrain(mouseY-swidth/2, sposMin, sposMax);
    }
    if(abs(newspos - spos) > 1) {
      spos = spos + (newspos-spos)/loose;
    }
  }

  int constrain(int val, int minv, int maxv) {
    return min(max(val, minv), maxv);
  }

  boolean over() {
    if(mouseX > xpos && mouseX < xpos+swidth &&
    mouseY > ypos && mouseY < ypos+sheight) {
      return true;
    } else {
      return false;
    }
  }
  
  void display() {
    fill(255);
    rect(xpos, ypos, swidth, sheight);
    if(over || locked) {
      fill(255, 255, 0);
    } else {
      fill(255, 0, 0);
    }
    rect(xpos, spos, swidth, swidth);
  }
  
 float getPos() {
    // Convert spos to be values between
    // 0 and the total width of the scrollbar
    return spos * ratio;
  }
}

 void mouseClicked() {
   // Retour
   if (mouseY>=10 && mouseX<=60 && mouseY<=30 ){
    mae = FSM.INITIAL;
    System.out.println("test retour");
   }
   
   // PlatJ
   else if (mouseY>=60 && mouseX<=140 && mouseY<=((height-20)/10+60)){
     mae=FSM.PLATJ;
         System.out.println("test platJ");
   }
   
   // Entrees
   else if (mouseY>=80+(height-20)/10 && mouseX<=140 && mouseY<=(2*(height-20)/10+80)){
     mae=FSM.ENTREES;
         System.out.println("test entrees");
   }
   
    //Plats
    else if (mouseY>=100+2*(height-20)/10 && mouseX<=140 && mouseY<=(3*(height-20)/10+100)){
      mae=FSM.PLATS;
          System.out.println("test Plat");
   }
   
    //Desserts
    else if (mouseY>=120+3*(height-20)/10 && mouseX<=140 && mouseY<=(4*(height-20)/10+120)){
      mae=FSM.DESSERTS;
          System.out.println("test Dessert");
   }
   
     else if (mouseY>=140+4*(height-20)/10 && mouseX<=140 && mouseY<=(5*(height-20)/10+140)){
       mae=FSM.BOISSONS;
           System.out.println("test boissons");
   }
}
