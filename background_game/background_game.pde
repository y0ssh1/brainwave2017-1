//class game_background{
  
   float time;
   float groundcycle;
   PImage groundblock;
   PImage hatenablock;
   PImage kumo;
   PImage mountain;
   void setup(){
     frameRate(60);
     time=0;
     groundcycle=0;
     size(600,450);
     noStroke();
     background(135,206,250);
     fill(139,69,19);
     rect(0,350,600,450);
     groundblock=loadImage("groundblock.png");
     hatenablock=loadImage("hatenablock.jpg");
     kumo=loadImage("kumo.png");
     mountain=loadImage("mountain2.png");
     for(int i=0;i<30;i++){
      image(groundblock,i*20,350,20,20); 
      image(groundblock,i*20,370,20,20);
      image(groundblock,i*20,390,20,20);
      image(groundblock,i*20,410,20,20);
      image(groundblock,i*20,430,20,20);
     }
     
     
     for(int i=1;i<10;i++){
       float rand=int(random(600));
       fill(34,139,34);
       triangle(rand-10,330,rand-15,350,rand-5,350);
       triangle(rand,330,rand-5,350,rand+5,350);
       triangle(rand+10,330,rand+5,350,rand+15,350);
     }
     
     for(int i=1;i<=2;i++){
       float rand=random(180);
       image(groundblock,200*i+rand-20,250,20,20);
       image(hatenablock,200*i+rand,250,20,20);
       image(groundblock,200*i+rand+20,250,20,20);
     }
       image(kumo,200,100,80,50);
       image(kumo,500,80,80,50);
       image(kumo,330,140,80,50);
       image(kumo,50,90,80,50);
  //     image(mountain,100,200,240,150);
       
       
       
       //float time;
       //float opponentx;
       //float opponenty;
   }
   
  void draw(){
    time+=1/60f;
    groundcycle=time%1;
    System.out.println(groundcycle);
    for(int i=0;i<35;i++){
      image(groundblock,i*20-groundcycle*60,350,20,20); 
      image(groundblock,i*20-groundcycle*60,370,20,20);
      image(groundblock,i*20-groundcycle*60,390,20,20);
      image(groundblock,i*20-groundcycle*60,410,20,20);
      image(groundblock,i*20-groundcycle*60,430,20,20);
     }
  }
  

//}