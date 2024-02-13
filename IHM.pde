import processing.video.*;
import java.awt.image.BufferedImage;
Capture cam;

CARTE_STATS carteStats;
CATEG_CARTE categCarte;
CATEG_STATS categStats;

public enum CARTE_STATS{
  INITIAL,
  CARTE,
  STATS,
  RESUMEE,
  VALIDER
}

public enum CATEG_CARTE {
  PLATJ, 
  ENTREES,
  PLATS,
  DESSERTS,
  BOISSONS
}
public enum CATEG_STATS {
  TOUT,
  PLATJ, 
  ENTREES,
  PLATS,
  DESSERTS,
  BOISSONS,
  RETOUR
}
  color bg=color(34, 38, 41);
  color fondBtn=color(134, 194, 50);
  color texte=color(255,255,255);
  color fondOnglet=color(107, 110, 112);
   
  int tailleBtn=100;
  
  PImage QRCode;

void setup() {
 size(780,1280);
 background(bg);;
 
 carteStats=CARTE_STATS.CARTE;
 categCarte=CATEG_CARTE.PLATJ;
 categStats=CATEG_STATS.TOUT;
 
 textSize(20);
 tailleBtn=(height-20)/10;
//cam = new Capture(this, 640, 480);

}

void ongletsCarte(){
  
  fill(fondOnglet);
  rect(0,40,140, height-100);
  fill(fondBtn);
  
  // Retour
  rect(0,10,80,30);
  fill(texte);
  textAlign(LEFT,CENTER);
  text("Retour", 10,10,60,20);
  
  fill(fondBtn);
  
  //PlatJ
  rect(0,60,140, tailleBtn);
  fill(texte);
  textAlign(LEFT,CENTER);
  text("Plat du Jour", 10,60,140,tailleBtn);
  
  fill(fondBtn);
  // Entrees
  rect(0,80+tailleBtn,140, tailleBtn);
  fill(texte);
  textAlign(LEFT,CENTER);
  text("Entrees", 10,80+tailleBtn,140, tailleBtn);
  
  fill(fondBtn);
  
  //Plats
  rect(0,100+2*tailleBtn,140, tailleBtn);
  fill(texte);
  textAlign(LEFT,CENTER);
  text("Plats", 10,100+2*tailleBtn,140, tailleBtn);
  
   fill(fondBtn);
  
  // Desserts
  rect(0,120+3*tailleBtn,140, tailleBtn);
  fill(texte);
  textAlign(LEFT,CENTER);
  text("Dessert", 10,120+3*tailleBtn,140, tailleBtn);
  
  fill(fondBtn);
  
  // Boissons
  rect(0,140+4*tailleBtn,140, tailleBtn);
   fill(fondBtn);
   fill(texte);
  textAlign(LEFT,CENTER);
  text("Boissons", 10,140+4*tailleBtn,140, tailleBtn);
  
  fill(fondBtn);
  
  
   // Valider
  rect(0,height-100,140, tailleBtn);
  fill(texte);
  textAlign(LEFT,CENTER);
  text("Valider", 10,height-100,140, tailleBtn);
  
  fill(fondBtn);
  
  // Stats
  rect(0,height-120-tailleBtn,140, tailleBtn);
   fill(fondBtn);
   fill(texte);
  textAlign(LEFT,CENTER);
  text("Stats", 10,height-120-tailleBtn,140, tailleBtn);
  
  fill(fondBtn);
  
}


void ongletsStat(){
  
  fill(fondOnglet);
  rect(0,40,140, height-100);
  fill(fondBtn);
  
  // Retour
  rect(0,10,80,30);
  fill(texte);
  textAlign(LEFT,CENTER);
  text("Retour", 10,10,60,20);
  
  fill(fondBtn);
  
  //Tout
  rect(0,60,140, tailleBtn);
  fill(texte);
  textAlign(LEFT,CENTER);
  text("Tout", 10,60,140,tailleBtn);
  
  fill(fondBtn);
  // PlatsJ
  rect(0,80+tailleBtn,140, tailleBtn);
  fill(texte);
  textAlign(LEFT,CENTER);
  text("Plats du jour", 10,80+tailleBtn,140, tailleBtn);
  
  fill(fondBtn);
  
  //Entrees
  rect(0,100+2*tailleBtn,140, tailleBtn);
  fill(texte);
  textAlign(LEFT,CENTER);
  text("Entrees", 10,100+2*tailleBtn,140, tailleBtn);
  
   fill(fondBtn);
  
  // Plats
  rect(0,120+3*tailleBtn,140, tailleBtn);
  fill(texte);
  textAlign(LEFT,CENTER);
  text("Plats", 10,120+3*tailleBtn,140, tailleBtn);
  
  fill(fondBtn);
  
  // Desserts
  rect(0,140+4*tailleBtn,140, tailleBtn);
   fill(texte);
  textAlign(LEFT,CENTER);
  text("Desserts", 10,140+4*tailleBtn,140, tailleBtn);
  
  fill(fondBtn);
    
   // Boissons
  rect(0,160+5*tailleBtn,140, tailleBtn);
  fill(texte);
  textAlign(LEFT,CENTER);
  text("Boissons", 10,140+5*tailleBtn,140, tailleBtn);
  
  
}

void resumee (String selection){
   fill(fondOnglet);
  rect(0,40,140, height-100);
  fill(fondBtn);
  
  // Retour
  rect(0,10,80,30);
  fill(texte);
  textAlign(LEFT,CENTER);
  text("Retour", 10,10,60,20);
  
  fill(fondBtn);
  
   // Valider
  rect(0,height-100,140, tailleBtn);
  fill(texte);
  textAlign(LEFT,CENTER);
  text("Valider", 10,height-100,140, tailleBtn);
  
  fill(fondBtn);
  
  
  fill(texte);
 textSize(50);
 textAlign(CENTER);
 text("Resumee", 20, 50, width-20, 100);
 textSize(20);
  text(selection, 20, 150, width-20, 250);
}

void draw(){

  switch (carteStats){
    case INITIAL:
    background(bg);
     break;
     
     case CARTE:
     
     switch(categCarte){
       case PLATJ:
        background(bg);
       ongletsCarte();
       break;
       
       case ENTREES:
        background(bg);
        ongletsCarte();
        
       fill(texte);
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
       
       
       break;
       
       case PLATS:
        background(bg);
        ongletsCarte();
        
       
       break;
       
       case DESSERTS:
        background(bg);
        ongletsCarte();
       
       break;
       
       case BOISSONS:
       background(bg);
       ongletsCarte();
       break;
       
   }
   break;
   
   case STATS:
   switch(categStats){
     case RETOUR:
        
       carteStats=CARTE_STATS.CARTE;
       break;
     
     case TOUT:
        background(bg);
       ongletsStat();
       break;
     
       case PLATJ:
        background(bg);
       ongletsStat();
       break;
       
       case ENTREES:
        background(bg);
        ongletsStat();
        
       fill(texte);
       text("STAT1", 200,70);
       text("STATS", 200,70+50);
       
       
       break;
       
       case PLATS:
        background(bg);
        ongletsStat();
        
       
       break;
       
       case DESSERTS:
        background(bg);
        ongletsStat();
       
       break;
       
       case BOISSONS:
       background(bg);
       ongletsStat();
       break;
       
   }
   break;
   
   case RESUMEE:
   background(bg);
   resumee("entree1");
   QRCode=writeQR("entree1");
   break;
   
   case VALIDER:
   carteStats=CARTE_STATS.INITIAL;
      System.out.println("FIN");
   break;
  }
 
}

 void mouseClicked() {
   
   
   switch(carteStats){
     
     case INITIAL:
     break;
     
     case CARTE:
     // Retour
     if (mouseY>=10 && mouseX<=60 && mouseY<=30 ){
      carteStats=CARTE_STATS.INITIAL;
      System.out.println("test retour carte");
     }
     
     // PlatJ
     else if (mouseY>=60 && mouseX<=140 && mouseY<=(tailleBtn+60)){
       categCarte=CATEG_CARTE.PLATJ;
           System.out.println("test platJ carte");
     }
     
     // Entrees
     else if (mouseY>=80+tailleBtn && mouseX<=140 && mouseY<=(2*tailleBtn+80)){
       categCarte=CATEG_CARTE.ENTREES;
           System.out.println("test entrees carte");
     }
     
      //Plats
      else if (mouseY>=100+2*tailleBtn && mouseX<=140 && mouseY<=(3*tailleBtn+100)){
        categCarte=CATEG_CARTE.PLATS;
            System.out.println("test Plat carte");
     }
     
      //Desserts
      else if (mouseY>=120+3*tailleBtn && mouseX<=140 && mouseY<=(4*tailleBtn+120)){
        categCarte=CATEG_CARTE.DESSERTS;
            System.out.println("test Dessert carte");
     }
     
       else if (mouseY>=140+4*tailleBtn && mouseX<=140 && mouseY<=(5*tailleBtn+140)){
         categCarte=CATEG_CARTE.BOISSONS;
             System.out.println("test boissons carte");
     }
     
      else if (mouseY>=height-100 && mouseX<=140 && mouseY<=height-24){
         carteStats=CARTE_STATS.RESUMEE;
             System.out.println("test valider carte");
     }
     
      else if (mouseY>=height-120-tailleBtn && mouseX<=140 && mouseY<=height-120-tailleBtn+126){
         carteStats=CARTE_STATS.STATS;
             System.out.println("test stat");
   }
   break;
   
    case STATS:
     // Retour
     if (mouseY>=10 && mouseX<=60 && mouseY<=30 ){
      categStats=CATEG_STATS.RETOUR;
      System.out.println("test retour stat");
     }
     
     // Tout
     else if (mouseY>=60 && mouseX<=140 && mouseY<=(tailleBtn+60)){
       categStats=CATEG_STATS.TOUT;
           System.out.println("test tout Stats");
     }
     
     // PlatsJ
     else if (mouseY>=80+tailleBtn && mouseX<=140 && mouseY<=(2*tailleBtn+80)){
       categStats=CATEG_STATS.PLATJ;
           System.out.println("test PlatJ stat");
     }
     
      //Entrees
      else if (mouseY>=100+2*tailleBtn && mouseX<=140 && mouseY<=(3*tailleBtn+100)){
        categStats=CATEG_STATS.ENTREES;
            System.out.println("test Entrees stat");
     }
     
      //Plats
      else if (mouseY>=120+3*tailleBtn && mouseX<=140 && mouseY<=(4*tailleBtn+120)){
        categStats=CATEG_STATS.PLATS;
            System.out.println("test Plats stat");
     }
     
       else if (mouseY>=140+4*tailleBtn && mouseX<=140 && mouseY<=(5*tailleBtn+140)){
         categStats=CATEG_STATS.DESSERTS;
             System.out.println("test Desserts stat");
     }
     
     else if (mouseY>=160+5*tailleBtn && mouseX<=140 && mouseY<=(6*tailleBtn+140)){
         categStats=CATEG_STATS.BOISSONS;
             System.out.println("test Boissons stat");
     }
   break;
   
    case RESUMEE:
     // Retour
     if (mouseY>=10 && mouseX<=60 && mouseY<=30 ){
      carteStats=CARTE_STATS.CARTE;
      System.out.println("test retour resumee");
     }
     
      else if (mouseY>=height-100 && mouseX<=140 && mouseY<=height-24){
         carteStats=CARTE_STATS.VALIDER;
             System.out.println("test valider resumee");
              carteStats=CARTE_STATS.VALIDER;
              
     }
     
     
   break;
   
    case VALIDER:
     break;
   }
}
