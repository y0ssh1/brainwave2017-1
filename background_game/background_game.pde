//class game_background{
  
   int move;
   float cycle;
   
   PImage groundblock;
   PImage hatenablock;
   PImage kumo;
   PImage mountain;
   PImage player;
   PImage enemy1;
   PVector playerpos=new PVector();
   PVector enemypos=new PVector();
   
   boolean jump;
   float jumptime;
   float playerupper;
   
   boolean play;
   boolean movetogameover;
   
   void setup(){
     play=true;
     movetogameover=true;
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
     player=loadImage("player.png");
     enemy1=loadImage("enemy1.png");
     
     for(int i=0;i<30;i++){
      image(groundblock,i*20,350,20,20); 
      image(groundblock,i*20,370,20,20);
      image(groundblock,i*20,390,20,20);
      image(groundblock,i*20,410,20,20);
      image(groundblock,i*20,430,20,20);
     }      
       fill(135,206,250);
       jumptime=0;
       playerpos.x=50f;
       enemypos.y=330f;
       
   }
   
  void draw(){
  
    if(play){
      move+=2;
      //textSize(20);
      //text(String(int(move/20)),20,20,300,40);
      
      
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
  
       cycle=move%700;
         playerpos.y=330+playerupper;
         enemypos.x=(700-cycle)%700;
       
         image(enemy1,(700-cycle)%700,330,20,20);
         image(player,50,330+playerupper,20,20);
         
         
         if(dist(playerpos.x,playerpos.y,enemypos.x,enemypos.y)<20){
           System.out.println("hit");
           play=false;
           
         }
         
         
         
         
      if(!jump){
        if(keyPressed){
          if(keyCode==UP){
          jump=true;
        }
        }
      }
      
      if(jump){
        jumptime++;
        playerupper=0.1*(sq(30-jumptime)-900);
        if(jumptime>=60){
          jumptime=0;
          jump=false;
        }
      }
      
    }
    if(!play){
        if(movetogameover){
        fill(0,0,0);
        rect(0,0,600,450);
        fill(255,0,0);
        textSize(20);
        text("Game Over",width/2,height/3,300,40);
        text("Push Right to Restart",width/2,height*2/3,300,40);
        movetogameover=false;
        }
        
        if(keyPressed){
          if(keyCode==RIGHT){
          play=true;
          movetogameover=true;
        }
        }
        
    }
    
}

    

//}