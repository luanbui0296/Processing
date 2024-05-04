
PImage img;
int D_W = 1000, D_H = 900;
int intLevel=1;
int intLives=3;
int intScores=0;
int speed=0;
int present=0;
startButton btnStart;
refreshButton btnRefresh;
LunchBox ll;
PizzaFactory pp;
CupCakeFactory cc;
BicycleFactory bb;
Lunch lunch;
Pizza pizza;
CupCake cupcake;
Bicycle bicycle;


void setup () {
  size (1000, 900);
 img = loadImage ("grass.jpg");
 ll=new LunchBox();
 pp=new PizzaFactory();
 cc=new CupCakeFactory();
 bb=new BicycleFactory();
 lunch=new Lunch();
 pizza=new Pizza();
 cupcake=new CupCake();
 bicycle=new Bicycle();
 btnStart=new startButton(400,50,50);
 btnRefresh=new refreshButton(500,50,50);
}

void draw () {
  background(180,180,180);
  //image(img,0,0,1000,900);
  ll.x=(millis()-present)/100*speed;
  pp.x=ll.x;
  cc.x=ll.x;
  bb.x=ll.x;
  // mouse event definition
  if ( dist(mouseX, mouseY,  lunch.x+18, lunch.y+18) < 18) { //mouse is inside the circle
    if (mousePressed) {         //mouse is inside the circle and clicked
      lunch.setSelected(true);
    }
  } 
  
  if ( dist(mouseX, mouseY,  pizza.x+18, pizza.y+18) < 18) { //mouse is inside the circle
    if (mousePressed) {         //mouse is inside the circle and clicked
      pizza.setSelected(true);
    }
  } 
  
  if ( dist(mouseX, mouseY,  cupcake.x+18, cupcake.y+18) < 18) { //mouse is inside the circle
    if (mousePressed) {         //mouse is inside the circle and clicked
      cupcake.setSelected(true);
    }
  } 
  
  if ( dist(mouseX, mouseY,  bicycle.x+18, bicycle.y+18) < 18) { //mouse is inside the circle
    if (mousePressed) {         //mouse is inside the circle and clicked
      bicycle.setSelected(true);
    }
  } 
  if(!mousePressed){
    lunch.setSelected(false);
    pizza.setSelected(false);
    cupcake.setSelected(false);
    bicycle.setSelected(false);
  }
  if(lunch.getIncluded()){lunch.setXY(ll.x+50,ll.y+50);}
  if(pizza.getIncluded()){pizza.setXY(pp.x+50,pp.y+50);}
  if(cupcake.getIncluded()){cupcake.setXY(cc.x+50,cc.y+50);}
  if(bicycle.getIncluded()){bicycle.setXY(bb.x+50,bb.y+50);}
  ll.drawImage();
  pp.drawImage();
  cc.drawImage();
  bb.drawImage();
  lunch.drawImage();
  pizza.drawImage();
  cupcake.drawImage();
  bicycle.drawImage();
  if(ll.x>1000){text("Failure! You should try again!",450,500);}
  if(lunch.getIncluded() &&pizza.getIncluded()&&cupcake.getIncluded()&&bicycle.getIncluded()){
    text("Congratualations! You wind the game!",450,500);speed=0;
  }
  text("Level",550,50);text(intLevel,600,50);
  text("Lives",650,50);text(intLives,700,50);
  text("Score",750,50);text(intScores,800,50);
  btnStart.imdraw();
  btnRefresh.imdraw();
  
  
}
void mouseDragged(){
    if(lunch.getSelected()){
      lunch.x=mouseX;
      lunch.y=mouseY;
      if ( dist(mouseX, mouseY,  ll.x+50, ll.y+50) < 50) { //mouse is inside the circle
        lunch.setIncluded(true);
        lunch.setSelected(false);
      }
    }
      
    if(pizza.getSelected()){
      pizza.x=mouseX;
      pizza.y=mouseY;
      if ( dist(mouseX, mouseY,  pp.x+50, pp.y+50) < 50) { //mouse is inside the circle
        pizza.setIncluded(true);
        pizza.setSelected(false);
      }
    }
    if(cupcake.getSelected()){
      cupcake.x=mouseX;
      cupcake.y=mouseY;
      if ( dist(mouseX, mouseY,  cc.x+50, cc.y+50) < 50) { //mouse is inside the circle
        cupcake.setIncluded(true);
        cupcake.setSelected(false);
      }
    }
    if(bicycle.getSelected()){
      bicycle.x=mouseX;
      bicycle.y=mouseY;
      if ( dist(mouseX, mouseY,  bb.x+50, bb.y+50) < 50) { //mouse is inside the circle
        bicycle.setIncluded(true);
        bicycle.setSelected(false);
      }
    }
  }
void Refresh(){
    ll.x=0;pp.x=0;cc.x=0;bb.x=0;
    speed=0;present=millis();
    lunch.setIncluded(false);
    bicycle.setIncluded(false);
    pizza.setIncluded(false);
    cupcake.setIncluded(false);
    lunch.setSelected(false);
    bicycle.setSelected(false);
    pizza.setSelected(false);
    cupcake.setSelected(false);
    
    lunch.setXY(400, 100);
    pizza.setXY(400, 300);
    cupcake.setXY(400, 500);
    bicycle.setXY(400, 700);
}


void Start(){
  speed=intLevel;
  present=millis();
}
class LunchBox 
{

        PImage img;
        int x = 0;       
        int y = 200;
        
        public LunchBox() {
          this.img=loadImage("lunchbox.jpg");
        }
        
        void drawImage() {
            image(this.img,this.x,this.y,100,100);
        }
        void setXY(int xx, int yy){
          this.x=xx;
          this.y=yy;
        }
}
class PizzaFactory 
{
        PImage img;
        int x = 0;       
        int y = 400;
        
        public PizzaFactory() {
          this.img=loadImage("pizzafactory.jpg");
        }
        
        void drawImage() {
            image(this.img,this.x,this.y,100,100);
        }
        void setXY(int xx, int yy){
          this.x=xx;
          this.y=yy;
        }
}
class CupCakeFactory 
{
        PImage img;
        int x = 0;       
        int y = 600;
        
        public CupCakeFactory() {
          this.img=loadImage("cupcakefactory.jpg");
        }
        
        void drawImage() {
            image(this.img,this.x,this.y,100,100);
        }
        void setXY(int xx, int yy){
          this.x=xx;
          this.y=yy;
        }
}

class BicycleFactory 
{
        PImage img;
        int x = 0;       
        int y = 800;
        
        public BicycleFactory() {
          this.img=loadImage("bicyclefactory.jpg");
        }
        
        void drawImage() {
            image(this.img,this.x,this.y,100,100);
        }
        void setXY(int xx, int yy){
          this.x=xx;
          this.y=yy;
        }
}

class Lunch {
        PImage img;
        int x = 400;       
        int y = 100;
        boolean selected=false;
        boolean included=false;

        public Lunch() {
          img=loadImage("lunch.jpg");
        }

        public void drawImage() {
            image(img,this.x,this.y,35,35);
        }
        
        public void setXY(int xx, int yy) {
          x=xx;
          y=yy;
        }
        public boolean getSelected() {
          return selected;
        }
        public void setSelected(boolean value) {
          selected=value;
        }
        public boolean getIncluded() {
          return included;
        }
        public void setIncluded(boolean value) {
          included=value;
        }
    }

class Pizza {
        PImage img;
        int x = 400;       
        int y = 300;
        boolean selected=false;
        boolean included=false;

        public Pizza() {
          img=loadImage("pizza.png");
        }

        public void drawImage() {
            image(img,this.x,this.y,35,35);
        }
                
        public void setXY(int xx, int yy) {
          x=xx;
          y=yy;
        }
        public boolean getSelected() {
          return selected;
        }
        public void setSelected(boolean value) {
          selected=value;
        }
        public boolean getIncluded() {
          return included;
        }
        public void setIncluded(boolean value) {
          included=value;
        }
    }
class CupCake {
        PImage img;
        int x = 400;       
        int y = 500;
        boolean selected=false;
        boolean included=false;

        public CupCake() {
          img=loadImage("cupcake.jpg");
        }

        public void drawImage() {
            image(img,this.x,this.y,35,35);
        }
        
        public void setXY(int xx, int yy) {
          x=xx;
          y=yy;
        }
        public boolean getSelected() {
          return selected;
        }
        public void setSelected(boolean value) {
          selected=value;
        }
        public boolean getIncluded() {
          return included;
        }
        public void setIncluded(boolean value) {
          included=value;
        }
    }

class Bicycle {
        PImage img;
        int x = 400;       
        int y = 700;
        boolean selected=false;
        boolean included=false;

        public Bicycle() {
          img=loadImage("bicycle.jpg");
        }

        public void drawImage() {
            image(img,this.x,this.y,35,35);
        }
        
        public void setXY(int xx, int yy) {
          x=xx;
          y=yy;
        }
        public boolean getSelected() {
          return selected;
        }
        public void setSelected(boolean value) {
          selected=value;
        }
        public boolean getIncluded() {
          return included;
        }
        public void setIncluded(boolean value) {
          included=value;
        }
    }

class startButton{
  float circleX;  //draggable circle position
  float circleY;
  float circleDiameter;
  String caption="button";
  
  public startButton(float cx,float cy,float cd) { 
    
    circleX = cx;  //set circle to be in centre of screen
    circleY = cy;
    circleDiameter = cd;
  }
  
  public void imdraw() {  //repeat this code 60 times a second – animate things on screen
    
    //background(64);
    if ( dist(mouseX, mouseY,  circleX, circleY) < circleDiameter/2) { //mouse is inside the circle
      if (mousePressed) {         //mouse is inside the circle and clicked
        fill(64, 256, 64);        //colour it bright green and move the circle to mouse position
        //circleX = mouseX;    //change circle position to mouse position 
        //circleY = mouseY;
        Start();
      } 
      else {  //mouse is inside the circle but not clicked
        fill(128, 256, 128);  //highlight the circle light green but don't move it
      }
    } 
    else {  //mouse is outside the circle, color it gray
      fill(128);
    }
    ellipse(circleX, circleY,  circleDiameter, circleDiameter);
    fill(0,0,0);
    text("Start",circleX-12,circleY+4);
    //text("Refresh",circleX-18,circleY+4);
  }

}

class refreshButton{
  float circleX;  //draggable circle position
  float circleY;
  float circleDiameter;
  String caption="button";
  
  public refreshButton(float cx,float cy,float cd) { 
    
    circleX = cx;  //set circle to be in centre of screen
    circleY = cy;
    circleDiameter = cd;
  }
  
  public void imdraw() {  //repeat this code 60 times a second – animate things on screen
    
    //background(64);
    if ( dist(mouseX, mouseY,  circleX, circleY) < circleDiameter/2) { //mouse is inside the circle
      if (mousePressed) {         //mouse is inside the circle and clicked
        fill(64, 256, 64);        //colour it bright green and move the circle to mouse position
        //circleX = mouseX;    //change circle position to mouse position 
        //circleY = mouseY;
        Refresh();
      } 
      else {  //mouse is inside the circle but not clicked
        fill(128, 256, 128);  //highlight the circle light green but don't move it
      }
    } 
    else {  //mouse is outside the circle, color it gray
      fill(128);
    }
    ellipse(circleX, circleY,  circleDiameter, circleDiameter);
    fill(0,0,0);
    //text("Start",circleX-12,circleY+4);
    text("Refresh",circleX-18,circleY+4);
  }

}
