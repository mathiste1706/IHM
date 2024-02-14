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
  color couleurTexte=color(255,255,255);
  color fondOnglet=color(107, 110, 112);
  color fontBtnGrayedOut=color(58, 79, 31);
   
  int tailleBtn=100;
  List<String> selection = new ArrayList<>();
  
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

void affichageTexte(String texte, int xPos, int yPos, List<String> selection){
  if (selection.contains(texte)){
    fill(fondBtn);
  }
  else {
    fill (couleurTexte);
}
    text(texte, xPos, yPos);
}

void ongletsCarte(){
  
  fill(fondOnglet);
  rect(0,40,140, height-100);
  fill(fondBtn);
  
  // Retour
  rect(0,10,80,30);
  fill(couleurTexte);
  textAlign(LEFT,CENTER);
  text("Retour", 10,10,60,20);
  
  fill(fondBtn);
  
  //PlatJ
  rect(0,60,140, tailleBtn);
  fill(couleurTexte);
  textAlign(LEFT,CENTER);
  text("Plat du Jour", 10,60,140,tailleBtn);
  
  fill(fondBtn);
  // Entrees
  rect(0,80+tailleBtn,140, tailleBtn);
  fill(couleurTexte);
  textAlign(LEFT,CENTER);
  text("Entrees", 10,80+tailleBtn,140, tailleBtn);
  
  fill(fondBtn);
  
  //Plats
  rect(0,100+2*tailleBtn,140, tailleBtn);
  fill(couleurTexte);
  textAlign(LEFT,CENTER);
  text("Plats", 10,100+2*tailleBtn,140, tailleBtn);
  
   fill(fondBtn);
  
  // Desserts
  rect(0,120+3*tailleBtn,140, tailleBtn);
  fill(couleurTexte);
  textAlign(LEFT,CENTER);
  text("Dessert", 10,120+3*tailleBtn,140, tailleBtn);
  
  fill(fondBtn);
  
  // Boissons
  rect(0,140+4*tailleBtn,140, tailleBtn);
   fill(fondBtn);
   fill(couleurTexte);
  textAlign(LEFT,CENTER);
  text("Boissons", 10,140+4*tailleBtn,140, tailleBtn);
  
  if (selection.size()!=0){
  fill(fondBtn);
  }
  else {
  fill(fontBtnGrayedOut);
  }
  
   // Valider
  rect(0,height-100,140, tailleBtn);
  fill(couleurTexte);
  textAlign(LEFT,CENTER);
  text("Valider", 10,height-100,140, tailleBtn);
  
  fill(fondBtn);
  
  // Stats
  rect(0,height-120-tailleBtn,140, tailleBtn);
   fill(fondBtn);
   fill(couleurTexte);
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
  fill(couleurTexte);
  textAlign(LEFT,CENTER);
  text("Retour", 10,10,60,20);
  
  fill(fondBtn);
  
  //Tout
  rect(0,60,140, tailleBtn);
  fill(couleurTexte);
  textAlign(LEFT,CENTER);
  text("Tout", 10,60,140,tailleBtn);
  
  fill(fondBtn);
  // PlatsJ
  rect(0,80+tailleBtn,140, tailleBtn);
  fill(couleurTexte);
  textAlign(LEFT,CENTER);
  text("Plats du jour", 10,80+tailleBtn,140, tailleBtn);
  
  fill(fondBtn);
  
  //Entrees
  rect(0,100+2*tailleBtn,140, tailleBtn);
  fill(couleurTexte);
  textAlign(LEFT,CENTER);
  text("Entrees", 10,100+2*tailleBtn,140, tailleBtn);
  
   fill(fondBtn);
  
  // Plats
  rect(0,120+3*tailleBtn,140, tailleBtn);
  fill(couleurTexte);
  textAlign(LEFT,CENTER);
  text("Plats", 10,120+3*tailleBtn,140, tailleBtn);
  
  fill(fondBtn);
  
  // Desserts
  rect(0,140+4*tailleBtn,140, tailleBtn);
   fill(couleurTexte);
  textAlign(LEFT,CENTER);
  text("Desserts", 10,140+4*tailleBtn,140, tailleBtn);
  
  fill(fondBtn);
    
   // Boissons
  rect(0,160+5*tailleBtn,140, tailleBtn);
  fill(couleurTexte);
  textAlign(LEFT,CENTER);
  text("Boissons", 10,140+5*tailleBtn,140, tailleBtn);
  
  
}

void resumee (List<String> selection){
   String texteResumee="";
  
  fill(fondOnglet);
  rect(0,40,140, height-100);
  fill(fondBtn);
  
  // Retour
  rect(0,10,80,30);
  fill(couleurTexte);
  textAlign(LEFT,CENTER);
  text("Retour", 10,10,60,20);
  
  fill(fondBtn);
  
   // Valider
  rect(0,height-100,140, tailleBtn);
  fill(couleurTexte);
  textAlign(LEFT,CENTER);
  text("Valider", 10,height-100,140, tailleBtn);
  
  fill(fondBtn);
  
  
  fill(couleurTexte);
 textSize(50);
 textAlign(CENTER);
 text("Resumee", 20, 50, width-20, 100);
 
 textSize(20);
 
 for (int i=0; i<selection.size();i++){
   if (i!=0){
     texteResumee+="\n\n";
   }
    texteResumee+=selection.get(i);
 }
   text(texteResumee, 20, 150, width-20, 250);
   QRCode=writeQR(texteResumee);
   image(QRCode, 380,1150);
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
       affichageTexte("Plat du jour", 200,70, selection);
       
       break;
       
       case ENTREES:
        background(bg);
        ongletsCarte();
       
       affichageTexte("Entree1", 200,70, selection);
       affichageTexte("Entree2", 200,70+70, selection);
       affichageTexte("Entree3", 200,70+70*2, selection);
       affichageTexte("Entree4", 200,70+70*3, selection);
       affichageTexte("Entree5", 200,70+70*4, selection);
       
       /*
       affichageTexte("Entree6", 200,70+70*5, selection);
       affichageTexte("Entree7", 200,70+70*6, selection);
       affichageTexte("Entree8", 200,70+70*7, selection);
       affichageTexte("Entree9", 200,70+70*8, selection);
       affichageTexte("Entree10", 200,70+70*9, selection);
       */
       
       
       break;
       
       case PLATS:
        background(bg);
        ongletsCarte();
        
       affichageTexte("Plat1", 200,70, selection);
       affichageTexte("Plat2", 200,70+70, selection);
       affichageTexte("Plat3", 200,70+70*2, selection);
       affichageTexte("Plat4", 200,70+70*3, selection);
       affichageTexte("Plat5", 200,70+70*4, selection);
        
       
       break;
       
       case DESSERTS:
        background(bg);
        ongletsCarte();
        
       affichageTexte("Dessert1", 200,70, selection);
       affichageTexte("Dessert2", 200,70+70, selection);
       affichageTexte("Dessert3", 200,70+70*2, selection);
       affichageTexte("Dessert4", 200,70+70*3, selection);
       affichageTexte("Dessert5", 200,70+70*4, selection);
       
       break;
       
       case BOISSONS:
       background(bg);
       ongletsCarte();
       
       affichageTexte("Boisson1", 200,70, selection);
       affichageTexte("Boisson2", 200,70+70, selection);
       affichageTexte("Boisson3", 200,70+70*2, selection);
       affichageTexte("Boisson4", 200,70+70*3, selection);
       affichageTexte("Boisson5", 200,70+70*4, selection);
       
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
       
       text("STAT TOUT", 200,70);
       break;
     
       case PLATJ:
        background(bg);
       ongletsStat();
       
       text("STAT PlatJ", 200,70);
       break;
       
       case ENTREES:
        background(bg);
        ongletsStat();
        
       fill(couleurTexte);
       text("STAT1", 200,70);
       text("STATS", 200,70+50);
       
       
       break;
       
       case PLATS:
        background(bg);
        ongletsStat();
        
        text("STAT Plats", 200,70);
        
       
       break;
       
       case DESSERTS:
        background(bg);
        ongletsStat();
        
        text("STAT dessert", 200,70);
       
       break;
       
       case BOISSONS:
       background(bg);
       ongletsStat();
       
       text("STAT boissons", 200,70);
       break;
       
   }
   break;
   
   case RESUMEE:
   background(bg);
   resumee(selection);
   break;
   
   case VALIDER:
   carteStats=CARTE_STATS.INITIAL;
      System.out.println("FIN");
   break;
  }
 
}
void selectionItem(String texteItem){
  int indexElement=selection.indexOf(texteItem);
   if (indexElement!=-1){
       selection.remove(indexElement);
     }
     else{
       selection.add(texteItem);
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
     
      else if (mouseY>=height-100 && mouseX<=140 && mouseY<=height-24 && selection.size()!=0){
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
   // Selection et deselection d'item
   
   if (categCarte==CATEG_CARTE.PLATJ && mouseY>=70-20 && mouseX<=300 && mouseY<=70+20 && mouseX>=200-20){
     selectionItem("Plat du jour");
      }
   
   else if (categCarte==CATEG_CARTE.ENTREES && mouseY>=70-20 && mouseX<=300 && mouseY<=70+20 && mouseX>=200-20){
        selectionItem("Entree1");
      }
      
     else if (categCarte==CATEG_CARTE.ENTREES &&  mouseY>=2*70-20 && mouseX<=300 && mouseY<=2*70+20 && mouseX>=200-20){
       selectionItem("Entree2");
        
      }
      
      else if (categCarte==CATEG_CARTE.ENTREES &&  mouseY>=3*70-20 && mouseX<=300 && mouseY<=3*70+20 && mouseX>=200-20){
       selectionItem("Entree3");
      }
       
     else if (categCarte==CATEG_CARTE.ENTREES &&  mouseY>=4*70-20 && mouseX<=300 && mouseY<=4*70+20 && mouseX>=200-20){
       selectionItem("Entree4");
        
      }
      
      else if (categCarte==CATEG_CARTE.ENTREES &&  mouseY>=5*70-20 && mouseX<=300 && mouseY<=5*70+20 && mouseX>=200-20){
       selectionItem("Entree5");
        
      }
      
      else if (categCarte==CATEG_CARTE.PLATS && mouseY>=70-20 && mouseX<=300 && mouseY<=70+20 && mouseX>=200-20){
       selectionItem("Plat1");
        
      }
      
     else if (categCarte==CATEG_CARTE.PLATS &&  mouseY>=2*70-20 && mouseX<=300 && mouseY<=2*70+20 && mouseX>=200-20){
       selectionItem("Plat2");
        
      }
      
      else if (categCarte==CATEG_CARTE.PLATS &&  mouseY>=3*70-20 && mouseX<=300 && mouseY<=3*70+20 && mouseX>=200-20){
       selectionItem("Plat3");
      }
       
     else if (categCarte==CATEG_CARTE.PLATS &&  mouseY>=4*70-20 && mouseX<=300 && mouseY<=4*70+20 && mouseX>=200-20){
       selectionItem("Plat4");
        
      }
      
      else if (categCarte==CATEG_CARTE.PLATS &&  mouseY>=5*70-20 && mouseX<=300 && mouseY<=5*70+20 && mouseX>=200-20){
      selectionItem("Plat5");
        
      }
      
      else if (categCarte==CATEG_CARTE.DESSERTS && mouseY>=70-20 && mouseX<=300 && mouseY<=70+20 && mouseX>=200-20){
       selectionItem("Dessert1");
        
      }
      
     else if (categCarte==CATEG_CARTE.DESSERTS &&  mouseY>=2*70-20 && mouseX<=300 && mouseY<=2*70+20 && mouseX>=200-20){
       selectionItem("Dessert2");
        
      }
      
      else if (categCarte==CATEG_CARTE.DESSERTS &&  mouseY>=3*70-20 && mouseX<=300 && mouseY<=3*70+20 && mouseX>=200-20){
       selectionItem("Dessert3");
      }
       
     else if (categCarte==CATEG_CARTE.DESSERTS &&  mouseY>=4*70-20 && mouseX<=300 && mouseY<=4*70+20 && mouseX>=200-20){
       selectionItem("Dessert4");
        
      }
      
      else if (categCarte==CATEG_CARTE.DESSERTS &&  mouseY>=5*70-20 && mouseX<=300 && mouseY<=5*70+20 && mouseX>=200-20){
      selectionItem("Dessert5");
        
      }
      
      else if (categCarte==CATEG_CARTE.BOISSONS && mouseY>=70-20 && mouseX<=300 && mouseY<=70+20 && mouseX>=200-20){
       selectionItem("Boisson1");
        
      }
      
     else if (categCarte==CATEG_CARTE.BOISSONS &&  mouseY>=2*70-20 && mouseX<=300 && mouseY<=2*70+20 && mouseX>=200-20){
       selectionItem("Boisson2");
        
      }
      
      else if (categCarte==CATEG_CARTE.BOISSONS &&  mouseY>=3*70-20 && mouseX<=300 && mouseY<=3*70+20 && mouseX>=200-20){
       selectionItem("Boisson3");
      }
       
     else if (categCarte==CATEG_CARTE.BOISSONS &&  mouseY>=4*70-20 && mouseX<=300 && mouseY<=4*70+20 && mouseX>=200-20){
       selectionItem("Boisson4");
        
      }
      
      else if (categCarte==CATEG_CARTE.BOISSONS &&  mouseY>=5*70-20 && mouseX<=300 && mouseY<=5*70+20 && mouseX>=200-20){
      selectionItem("Boisson5");
        
      }
      
}
