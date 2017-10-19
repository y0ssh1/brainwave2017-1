//class game_background{
  
   int move;
   float cycle;
   
   PImage groundblock;
   PImage hatenablock;
   PImage kumo;
   PImage mountain;
   void setup(){
     frameRate(60);
     move=0;
     cycle=0;
     size(600,450);
     noStroke();
     background(135,206,250);
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
       fill(135,206,250);
   }
   
  void draw(){
    move+=2;
      
     
     fill(135,206,250);
     rect(0,0,600,350);
       
     cycle=(move/3.0)%1000;
     image(mountain,(1600-cycle)%1000-200,200,240,150);
    
    cycle=move%60;
    for(int i=0;i<35;i++){
      image(groundblock,i*20-cycle,350,20,20); 
      image(groundblock,i*20-cycle,370,20,20);
      image(groundblock,i*20-cycle,390,20,20);
      image(groundblock,i*20-cycle,410,20,20);
      image(groundblock,i*20-cycle,430,20,20);
     }
     
     
     cycle=move%700; 
     fill(34,139,34);
       triangle(640-cycle,330,635-cycle,350,645-cycle,350);
       triangle(650-cycle,330,645-cycle,350,655-cycle,350);
       triangle(660-cycle,330,655-cycle,350,665-cycle,350);

     
     cycle=move%800;
       image(groundblock,(900-cycle)%800-70,250,20,20);
       image(hatenablock,(900-cycle)%800-50,250,20,20);
       image(groundblock,(900-cycle)%800-30,250,20,20);
       
       cycle=(move/2.0)%800;
       image(kumo,(1460-cycle)%800-100,100,80,50);
       image(kumo,(1290-cycle)%800-100,80,80,50);
       image(kumo,(1070-cycle)%800-100,140,80,50);
       image(kumo,(800-cycle)%800-100,90,80,50);
    }
  

//}