import oscP5.*;
import netP5.*;

//class game_background{

  int move;
  int time;
  float cycle;

  int N_CHANNELS = 4;
  int BUFFER_SIZE = 220;
  float MAX_MICROVOLTS = 1682.815;

  final int PORT = 5000;
  OscP5 oscP5 = new OscP5(this, PORT);

  float[][] buffer = new float[N_CHANNELS][BUFFER_SIZE];
  int pointer = 0;
  float preValue = 0.0;
  float[] offsetX = new float[N_CHANNELS];
  float[] offsetY = new float[N_CHANNELS];

  PImage groundblock;
  PImage hatenablock;
  PImage kumo;
  PImage mountain;
  PImage player;
  PImage enemy1;
  PVector playerpos=new PVector();
  PVector enemypos=new PVector();

  boolean jump;
  boolean gameStart = false;
  float jumptime;
  float playerupper;

  boolean play;
  boolean movetogameover;

  int score;
  int highscore;

  void setup(){
    time = 0;
    highscore=0;
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

    for (int ch = 0; ch < N_CHANNELS; ch++) {
      offsetX[ch] = (width / N_CHANNELS) * ch + 15;
      offsetY[ch] = height / 2;
    }

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
    time += 1;
    if(time > 600){
    float alpha_avg = 0.0;
    for(int ch = 0; ch < N_CHANNELS; ch++){
      for(int t = 0; t < BUFFER_SIZE; t++){
        alpha_avg += buffer[ch][t];
      }
    }
    alpha_avg /= N_CHANNELS * BUFFER_SIZE;

    if(play){
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
      image(groundblock,(1300-cycle)%800-70,250,20,20);
      image(hatenablock,(1300-cycle)%800-50,250,20,20);
      image(groundblock,(1300-cycle)%800-30,250,20,20);

      cycle=(move/2.0)%800;
      image(kumo,(1460-cycle)%800-100,100,80,50);
      image(kumo,(1290-cycle)%800-100,80,80,50);
      image(kumo,(1070-cycle)%800-100,140,80,50);
      image(kumo,(800-cycle)%800-100,90,80,50);

      cycle=move%700;
      playerpos.y=330+playerupper;
      enemypos.x=(700-cycle)%700-50;

      image(enemy1,(700-cycle)%700-50,330,20,20);
      image(player,50,330+playerupper,20,20);


      if(dist(playerpos.x,playerpos.y,enemypos.x,enemypos.y)<20){
        System.out.println("hit");
        score=int(move/20);
        play=false;
      }

    if(alpha_avg - preValue > 0.002 || (keyPressed && keyCode==UP)){
      jump=true;
    }

    if(jump){
      jumptime++;
      playerupper=0.1*(sq(30-jumptime)-900);
      if(jumptime>=60){
        jumptime=0;
        jump=false;
      }
    }
    fill(0,0,0);
    textSize(40);
    text("score: "+str(int(move/20)),20,20,450,60);
  }
  if(!play){
      if(movetogameover){
      if(score>highscore){
        highscore=score;
      }
      fill(0,0,0);
      rect(0,0,600,450);
      fill(255,0,0);
      textSize(20);
      text("Game Over",width/2,height/4,300,40);

      text("score: "+score+"  highscore: "+highscore,width/2,height/2,300,40);

      text("Push Right to Restart",width/2,height*3/4,300,40);
      movetogameover=false;
      }

      if(keyPressed){
        if(keyCode==RIGHT){
        play=true;
        movetogameover=true;
        move=0;
        }
      }

  }
  preValue = alpha_avg;
  }else{
    for(int i = 1; i < 11; i++){
      if(660 - 60 * i >= time && time > 600 - 60 * i){
        fill(135,206,250);
        rect(0,0,600,450);
        fill(255,0,0);
        textSize(50);
        text("Please concentrate on",25,height/2 - 50);
        text(i,width/2 - 25,height/2 + 25);
      }
    }
  }
}

void oscEvent(OscMessage msg) {
  float data;
  if (msg.checkAddrPattern("/muse/elements/alpha_relative")) {
    for (int ch = 0; ch < N_CHANNELS; ch++) {
      data = msg.get(ch).floatValue();
      data = (data - (MAX_MICROVOLTS / 2)) / (MAX_MICROVOLTS / 2); // -1.0 1.0
      buffer[ch][pointer] = data * 1000;
    }
    pointer = (pointer + 1) % BUFFER_SIZE;
  }
}



//}
