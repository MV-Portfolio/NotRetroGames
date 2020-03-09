//base menu
float rot = 0;
float travel =0;
int mode = 0;
int sidemove = 0;
int pastyam =15;
int zoomtro =0;
int page =1;
int actpre=0;
int openx=0;
int openy=10;
int gameMode=0;
boolean backout = false;
char [] head = {'N','O','T',' ','R','E','T','R','O'};
char [] head2 = {' ',' ','G','A','M','E','S',' ',' '};
int [][] pasty = new int [pastyam][2];





//not space invaders
int aliensColI=10;
int aliensRowI=5;
int shieldColI=16;
int shieldRowI=8;
int shipI;
int shipVI;
int alienXI;
int alienYI;
int countI;
int laserXI;
int laserYI;
int laserTimerI;
int sumAliensI;
int levelI;
int livesI;
int startHeightI;
int scoreI;
int timeI;
int aI;
int bI;
int cI;
int dI;
int eI;
int[] rayXI;
int[] rayYI;
int[][] aliensI=new int[aliensColI][aliensRowI];
int[][] shield1I=new int[shieldColI][shieldRowI];
int[][] shield2I=new int[shieldColI][shieldRowI];
int[][] shield3I=new int[shieldColI][shieldRowI];
int[][] shield4I=new int[shieldColI][shieldRowI];
int[] backgroundXI=new int[0];
int[] backgroundYI=new int[0];
boolean pausedI;
boolean laserI;
boolean gameoverI;
boolean countDownI;
boolean titleScreenI;



// not pong
float x = 300;
float y = 200;
float p1 = 200-30;
float p2 = 200-30;
float cpu = 200-30;
int notpongeffect=0;
int gmod = 0;
int pv1 = 0;
int pv2 = 0;
int cpuv = 0;
int speed = 5;
int ballvx = 5;
int ballvy = 0;
int locx = 300;
int locy = 200;
int scorep1 = 0;
int scorep2 = 0;
int tail =15;
int score1 = 0;
int score2 = 0;
int countime=0;
int rester=0;
int winner=0;
int gametimer=0;
int gametimerend=0;
int hits=0;
int solotimer=0;
int soloup=0;
int soloscore=0;
int [][] taily = new int [tail][2];
boolean countdown;
boolean nopause=false;




//not snake
int snakestart = millis()/1000;
int snakeend=0;
int currentmils = 0;
int pastsec = -1;
int snakemode =1;
int direction =0;
int currentD= direction;
int snakelocx =300;
int snakelocy =300;
int sgrid=10;
int snakespeed = 2;
int foodlocx=300;
int foodlocy=50;
int randx=round(random(0,60));
int randy=round(random(0,60));
int sgmod=0;
int snakepoints=0;
int snakeloop=0;
int [] snaketailx = new int[4];
int [] snaketaily = new int[4];



void setup(){
  size(600,400);
  background(0);
  smooth();
  noCursor();
}



void draw(){
  if(gameMode==0){ //main menu
    background(0);
    if (backout==false){
      backeffect(zoomtro);
    } else if (backout==true && zoomtro < (height/2)){
      zoomtro++;
      backeffect(zoomtro);
      intro(zoomtro);
    } else if (backout==true && zoomtro >=(height/2) && mode==0 ){
      mode=2;
    }
    directory();
    mouse();
  }else if(gameMode==1){
    game1(); //not space invaders
  }else if(gameMode==2){
    game2(); //not pong
  }else if(gameMode==3){
    snakelookup(); //not snake
  }
  
}



void directory(){
  if (mode==0){ intro(zoomtro); /*opening page*/ }
  if (mode==1){ setting(); /*alt your game settings*/}
  if (mode==2){ backtwo();  directory2(); /*main menu*/}
  if (mode==3){ other(); /*incause of more games*/}
}



void directory2(){
  if (actpre>=1){
    if (openx<550){
      openx=openx+25;
    } else if (openx>=550 && openy<325){
      openy=openy+15;
    }
    if (openy<=325){
      play();
    }
  }
  if (actpre==0){play(); openx=0; openy=1; /*closed menu*/};
  if (actpre==1){preview1(); /*not space invaders*/ }
  if (actpre==2){preview2(); /*not pong*/}
  if (actpre==3){preview3(); /*not snake*/}
}



void mouse(){
  noCursor();
  strokeWeight(1);
  for (int i=0; i<pastyam-1; i++){
    pasty[pastyam-i-1][0] = pasty[pastyam-i-2][0];
    pasty[pastyam-i-1][1] = pasty[pastyam-i-2][1];
  }
  pasty[0][0] = mouseX;
  pasty[0][1] = mouseY;
  rectMode(CENTER);
  noStroke();
  fill(255);
  for (int i=0; i<pastyam; i++){
    translate(pasty[i][0], pasty[i][1]);
    rotate(rot-(0.05*i));
    stroke(255,255-(255/pastyam)*i);
    noFill();
    rect(0,0,20-(20/pastyam)*i,20-(20/pastyam)*i);
    rotate(-rot+(0.05*i));
    translate(-pasty[i][0], -pasty[i][1]);
  }
  rot = rot +0.05;
}



void backeffect(int zoomtro){
  stroke(255);
  if (sidemove == 100){
    sidemove = 0;
  } else sidemove++;
  for (int i =1; i<width/20; i++){
    stroke(255-(i*12)+(sidemove*0.12),0+(i*12)-(sidemove*0.12),255);
    line(-10,(height/2)-40*(i)-zoomtro,width+10,height/2-40*(i)-zoomtro);
    line(-10,height/2+40*(i)+zoomtro,width+10,height/2+40*(i)+zoomtro);
    //top right then left
    line(width/2+20*i-(sidemove*0.2),height/2-40-zoomtro,width/2+100*i-sidemove,-10);
    line(width/2-20*i+(sidemove*0.2),height/2-40-zoomtro,width/2-100*i+sidemove,-10);
    //bottom right then left
    line(width/2+20*i-(sidemove*0.2),height/2+40+zoomtro,width/2+100*i-sidemove,height+10);
    line(width/2-20*i+(sidemove*0.2),height/2+40+zoomtro,width/2-100*i+sidemove,height+10);
  }
}



void backtwo(){
  fill(255);
  noStroke();
  for (int i = 1; i < 125; i++) {
    fill(float(i)*2,255-float(i)*2,255);
    ellipse(width/2,height/2-50,250-(2*i),250-(2*i));
  }
  rectMode(CENTER);
  fill(0);
  noStroke();
  for (int i=0; i<10; i++){
    rect(width/2,height/2-115+(i*25),600,i*3);
  }
  rectMode(CORNER);
  rect(0,height/2+40,width+10,height/2+40);
  noFill();
  stroke(255,0,255);
  if (travel >= 2){
    travel=0;
  } else travel=travel+0.05;
  for (int i=0; i<100; i++){
    line(-10,height/2+(i*i)+(i*(travel))+40, width+10, height/2+(i*i)+(i*travel)+40);
    line(width/2+20*i,height/2+40,width/2+100*i,height+10);
    line(width/2-20*i,height/2+40,width/2-100*i,height+10);
  }
}



void intro(int zoomtro){
  textSize(11);
  fill(255,255,255,200-zoomtro);
  for (int i = 0; i<head.length; i++){
    text(head[i],25,(height/15)*i+(height/4));
  }
  for (int i = 0; i<head2.length; i++){
    text(head2[i],width-25,(height/15)*i+(height/4));
  }
  textAlign(CENTER, CENTER);
  textSize(60);
  fill(255,0,0,200-zoomtro);
  text("CLICK TO START",width/2-4,height/2+1);
  fill(0,255,0,200-zoomtro);
  text("CLICK TO START",width/2-2,height/2-1);
  fill(0,0,255,200-zoomtro);
  text("CLICK TO START",width/2+3,height/2);
  fill(255,255,255,200-zoomtro);
  text("CLICK TO START",width/2,height/2);
  //music?
}



void setting(){
  ellipse(10,10,10,10);
  //slider bar for something?
  //save location?
  //sound?
}



void play(){
  backout=true;
  stroke(0,200,200);
  fill(0);
  for (int i = 0; i<3; i++){
    for (int k = 1; k<2; k++){
      if (mouseX>(width/24)+(i*(width/3)) && mouseX<(width/24)+(i*(width/3))+width/4  && mouseY>(height/8)+((height/2)*k) && mouseY<(height/8)+((height/2)*k)+height/4){
        fill(255,0,0);
        rect((width/24)+(i*(width/3)),(height/8)+((height/2)*k),width/4,height/4);
        fill(0);
      } else {
        fill(0);
        rect((width/24)+(i*(width/3)),(height/8)+((height/2)*k),width/4,height/4);
      }
    }
  }
  textAlign(CENTER, CENTER);
  textSize(15);
  fill(255);
  text("NOT",width/6,height/1.38);
  text("SPACE INVADERS",width/6,height/1.29);
  text("NOT PONG",width/2,height/1.33);
  text("NOT SNAKE",width/1.2,height/1.33);
  textSize(60);
  fill(255,0,0);
  text("NOT RETRO GAMES",width/2-4,height/2+1);
  fill(0,255,0);
  text("NOT RETRO GAMES",width/2-2,height/2-1);
  fill(0,0,255);
  text("NOT RETRO GAMES",width/2+3,height/2);
  fill(255,255,255);
  text("NOT RETRO GAMES",width/2,height/2);
  //select what game you want to play
}



void other(){
  text("lol",10,10);
  //scores?
  //info?
  //about?
}



void preview1(){ //preview of not space invaders
  rectMode(CENTER);
  stroke(255,0,255);
  fill(0);
  rect(width/2,height/2,openx,openy);
  if(openy>=325){
    textAlign(CENTER,CENTER);
    textSize(40);
    fill(255,0,0,200);
    text("NOT SPACE INVADERS",width/2-4,80+1);
    fill(0,255,0,200);
    text("NOT SPACE INVADERS",width/2-2,80-1);
    fill(0,0,255,200);
    text("NOT SPACE INVADERS",width/2+3,80);
    fill(255,255,255,200);
    text("NOT SPACE INVADERS",width/2,80);
    fill(255);
    textSize(16);
    text("HOW TO PLAY\nUse the arrow keys or A and D to move the ship.\nPress spacebar to attack the aliens with lasers.\nThe aliens will fight back but the shields can block their death rays.\nStay alive and DON'T let them reach the planet surface.",width/2,height/2);
    stroke(255);
    if(mouseX>=80 && mouseX<=240 && mouseY>=300 && mouseY<=340){ //start button
      fill(255);
      rect(160,320,160,40);
      fill(0);
      text("START",160,320);
    }else{
      fill(0);
      rect(160,320,160,40);
      fill(255);
      text("START",160,320);
    }
    if(mouseX>360 && mouseX<=520 && mouseY>=300 && mouseY<=340){ //return button
      fill(255);
      rect(440,320,160,40);
      fill(0);
      text("RETURN",440,320);
    }else{
      fill(0);
      rect(440,320,160,40);
      fill(255);
      text("RETURN",440,320);
    }
  }
  rectMode(CORNER);
}



void preview2(){ //preview of not pong
  rectMode(CENTER);
  stroke(255,0,255);
  fill(0);
  rect(width/2,height/2,openx,openy);
  if(openy>=325){
    textAlign(CENTER,CENTER);
    textSize(40);
    fill(255,0,0,200);
    text("NOT PONG",width/2-4,80+1);
    fill(0,255,0,200);
    text("NOT PONG",width/2-2,80-1);
    fill(0,0,255,200);
    text("NOT PONG",width/2+3,80);
    fill(255,255,255,200);
    text("NOT PONG",width/2,80);
    fill(255);
    textSize(16);
    text("HOW TO PLAY\nThere are two game modes: Solo & PvP.\nSolo mode is a time trial, with the balls speed slowly increasing.\nPvP is were two player battle it out to be the first to score five point.\nUse the Arrow keys or W & S to move the paddle up and down.\nPress 'P' to Pause.",width/2,height/2);                            /* <-- ADD NOT PONG DESCRIPTION HERE*/
    stroke(255);
    if(mouseX>=80 && mouseX<=240 && mouseY>=300 && mouseY<=340){ //start button
      fill(255);
      rect(160,320,160,40);
      fill(0);
      text("START",160,320);
    } else {
      fill(0);
      rect(160,320,160,40);
      fill(255);
      text("START",160,320);
    }
    if(mouseX>360 && mouseX<=520 && mouseY>=300 && mouseY<=340){ //return button
      fill(255);
      rect(440,320,160,40);
      fill(0);
      text("RETURN",440,320);
    }else{
      fill(0);
      rect(440,320,160,40);
      fill(255);
      text("RETURN",440,320);
    }
  }
  rectMode(CORNER);
}



void preview3(){ //preview of not snake
  rectMode(CENTER);
  stroke(255,0,255);
  fill(0);
  rect(width/2,height/2,openx,openy);
  if(openy>=325){
    textAlign(CENTER,CENTER);
    textSize(40);
    fill(255,0,0,200);
    text("NOT SNAKE",width/2-4,80+1);
    fill(0,255,0,200);
    text("NOT SNAKE",width/2-2,80-1);
    fill(0,0,255,200);
    text("NOT SNAKE",width/2+3,80);
    fill(255,255,255,200);
    text("NOT SNAKE",width/2,80);
    fill(255);
    textSize(16);
    text("HOW TO PLAY\n Use the arrow keys to change direction.\nCollect food to score points and grow longer.\nAvoid the walls and yourself.\nPress 'P' to pause.",width/2,height/2);                            /* <-- ADD NOT PONG DESCRIPTION HERE*/
    stroke(255);
    if(mouseX>=80 && mouseX<=240 && mouseY>=300 && mouseY<=340){ //start button
      fill(255);
      rect(160,320,160,40);
      fill(0);
      text("START",160,320);
    }else{
      fill(0);
      rect(160,320,160,40);
      fill(255);
      text("START",160,320);
    }
    if(mouseX>360 && mouseX<=520 && mouseY>=300 && mouseY<=340){ //return button
      fill(255);
      rect(440,320,160,40);
      fill(0);
      text("RETURN",440,320);
    }else{
      fill(0);
      rect(440,320,160,40);
      fill(255);
      text("RETURN",440,320);
    }
  }
  rectMode(CORNER);
}



//NOT SPACE INVADERS
void game1(){
  if(titleScreenI==true){ //title screen
    background(0);
    backgroundXI=expand(backgroundXI,backgroundXI.length+1);
    backgroundXI[backgroundXI.length-1]=int(random(width));
    backgroundYI=expand(backgroundYI,backgroundYI.length+1);
    backgroundYI[backgroundYI.length-1]=0;
    for(int i=0;i<backgroundXI.length;i++){
      rayI(backgroundXI[i],backgroundYI[i]);
      backgroundYI[i]=backgroundYI[i]+4;
    }
    textAlign(CENTER,CENTER);
    textSize(50);
    fill(255,0,0,200);
    text("NOT SPACE INVADERS",width/2-4,60+1);
    fill(0,255,0,200);
    text("NOT SPACE INVADERS",width/2-2,60-1);
    fill(0,0,255,200);
    text("NOT SPACE INVADERS",width/2+3,60);
    fill(255,255,255,200);
    text("NOT SPACE INVADERS",width/2,60);
    textSize(28);
    fill(255);
    text("CLICK TO PLAY",width/2,140);
    textSize(16);
    text("CONTROLS",width/2,220);
    text("Spacebar to move shoot",width/2,240);
    text("Left arrow / A key to move left",width/2,260);
    text("Right arrow / D key to move right",width/2,280);
    text("Any other key to pause",width/2,300);
    mouse();
  }else if(pausedI==true){ //paused screen
    background(0);
    frameI();
    fill(0,0,0,200);
    rect(width/2,height/2,width,height);
    fill(255);
    textSize(60);
    textAlign(CENTER,TOP);
    text("PAUSED", width/2,20);
    textSize(20);
    text("PRESS ANY KEY TO RESUME",width/2,100);
    stroke(255);
    textAlign(CENTER,CENTER);
    if(mouseX>=width/2-100&&mouseX<=width/2+100&&mouseY>=180&&mouseY<=220){ //restart button
      fill(255);
      rect(width/2,200,200,40);
      fill(0);
      text("RESTART",width/2,200);
    }else{
      fill(0);
      rect(width/2,200,200,40);
      fill(255);
      text("RESTART",width/2,200);
    }
    if(mouseX>=width/2-100&&mouseX<=width/2+100&&mouseY>=260&&mouseY<=300){ //exit button
      fill(255);
      rect(width/2,280,200,40);
      fill(0);
      text("EXIT",width/2,280);
    }else{
      fill(0);
      rect(width/2,280,200,40);
      fill(255);
      text("EXIT",width/2,280);
    }
    noStroke();
    mouse();
  }else if(gameoverI==false&&countDownI==true){ //count down screen
    if(timeI==0){ //display 3
      frameI();
      fill(0,0,0,200);
      rect(width/2,height/2,width,height);
      fill(255);
      textSize(80);
      text("3",width/2,height/2);
    }else if(timeI==60){ //display 2
      frameI();
      fill(0,0,0,200);
      rect(width/2,height/2,width,height);
      fill(255);
      textSize(80);
      text("2",width/2,height/2);
    }else if(timeI==120){ //display 1
      frameI();
      fill(0,0,0,200);
      rect(width/2,height/2,width,height);
      fill(255);
      textSize(80);
      text("1",width/2,height/2);
    }else if(timeI==180){ //game resumes
      shipI=96;
      countDownI=false;
    }
    timeI++;
  }else if(gameoverI==false&&countDownI==false){ //playing screen
    background(0);
    //ship laser
    if(laserYI<=40){
      laserYI=-8;
    }
    if(laserTimerI>10&&laserI==true&&laserYI<=0){
      laserTimerI=0;
      laserXI=shipI;
      laserYI=height-32;
    }
    laserYI=laserYI-4;
    //ship position
    if(shipI>24&&shipVI<0){
      shipI=shipI+shipVI;
    }else if(shipI<width-24&&shipVI>0){
      shipI=shipI+shipVI;
    }
    //alien death rays
    if(random(0,5*sumAliensI)<1){
      cI=int(random(0,10));
      aI=4;
      while(aI!=-1&&aliensI[cI][aI]==0){
        aI--;
      }
      if(aI!=-1){
        rayXI=expand(rayXI,rayXI.length+1);
        rayXI[rayXI.length-1]=cI*40+alienXI;
        rayYI=expand(rayYI,rayYI.length+1);
        rayYI[rayYI.length-1]=32*aI+alienYI*12+startHeightI;
      }
    }
    for(int i=bI;i<rayYI.length;i++){
      rayYI[i]=rayYI[i]+4;
      if(i==bI&&rayYI[i]>height+6){
        bI++;
      }
    }
    //aliens position
    if(countI%(6+sumAliensI)==0){
      dI=9;
      for(int i=9;i>=dI;i--){
        aI=4;
        while(aI!=-1&&aliensI[i][aI]==0){
          aI--;
        }
        if(aI==-1&&dI>0){
          dI--;
        }
      }
      eI=0;
      for(int i=0;i<=eI;i++){
        aI=4;
        while(aI!=-1&&aliensI[i][aI]==0){
          aI--;
        }
        if(aI==-1&&eI<9){
          eI++;
        }
      }
      if(40*dI+alienXI==568||40*eI+alienXI==32){
        alienYI++;
      }
      alienXI=alienXI+4*int(pow(-1,alienYI));
    }
    //display a frame
    frameI();
    //hit boxes
    for(int i=0;i<aliensColI;i++){
      for(int j=0;j<aliensRowI;j++){
        //check if an alien is hit by the ship laser
        if((aliensI[i][j]==1)&&(i*40+alienXI-10<=laserXI)&&(i*40+alienXI+10>=laserXI)&&(j*32+12*alienYI+startHeightI-10<=laserYI)&&(j*32+12*alienYI+startHeightI+10>=laserYI)){
          laserYI=-8;
          aliensI[i][j]=0;
          scoreI++;
        }
        //check if an alien reached the surface
        if((aliensI[i][j]==1)&&(j*32+12*alienYI+startHeightI+10>=370)){
          frameI();
          gameoverI();
        }
      }
    }
    for(int i=0;i<shieldColI;i++){
      for(int j=0;j<shieldRowI;j++){
        //check if shields 1-4 are hit by ship laser
        if((shield1I[i][j]==1)&&(i*4+64<=laserXI)&&(i*4+68>laserXI)&&(j*4+334<=laserYI)&&(j*4+338>laserYI)){
          laserYI=-8;
          shield1I[i][j]=0;
        }
        if((shield2I[i][j]==1)&&(i*4+200<=laserXI)&&(i*4+204>laserXI)&&(j*4+334<=laserYI)&&(j*4+338>laserYI)){
          laserYI=-8;
          shield2I[i][j]=0;
        }
        if((shield3I[i][j]==1)&&(i*4+336<=laserXI)&&(i*4+340>laserXI)&&(j*4+334<=laserYI)&&(j*4+338>laserYI)){
          laserYI=-8;
          shield3I[i][j]=0;
        }
        if((shield4I[i][j]==1)&&(i*4+472<=laserXI)&&(i*4+476>laserXI)&&(j*4+334<=laserYI)&&(j*4+338>laserYI)){
          laserYI=-8;
          shield4I[i][j]=0;
        }
        for(int k=bI;k<rayYI.length;k++){
          //check if shields 1-4 are hit by alien death ray
          if((shield1I[i][j]==1)&&(i*4+64<=rayXI[k])&&(i*4+68>rayXI[k])&&(j*4+334<=rayYI[k])&&(j*4+338>rayYI[k])){
            rayYI[k]=height+6;
            shield1I[i][j]=0;
          }
          if((shield2I[i][j]==1)&&(i*4+200<=rayXI[k])&&(i*4+204>rayXI[k])&&(j*4+334<=rayYI[k])&&(j*4+338>rayYI[k])){
            rayYI[k]=height+6;
            shield2I[i][j]=0;
          }
          if((shield3I[i][j]==1)&&(i*4+336<=rayXI[k])&&(i*4+340>rayXI[k])&&(j*4+334<=rayYI[k])&&(j*4+338>rayYI[k])){
            rayYI[k]=height+6;
            shield3I[i][j]=0;
          }
          if((shield4I[i][j]==1)&&(i*4+472<=rayXI[k])&&(i*4+476>rayXI[k])&&(j*4+334<=rayYI[k])&&(j*4+338>rayYI[k])){
            rayYI[k]=height+6;
            shield4I[i][j]=0;
          }
          //check if the ship is hit by alien death ray
          if((shipI-20<=rayXI[k])&&(shipI+20>=rayXI[k])&&(height-35<=rayYI[k])&&(height-20>=rayYI[k])){
            rayYI[k]=height+6;
            deathI();
          }
        }
        for(int k=0;k<aliensColI;k++){
          for(int l=0;l<aliensRowI;l++){
            if((shield1I[i][j]==1)&&(aliensI[k][l]==1)&&(i*4+64<=k*40+alienXI+10)&&(i*4+68>k*40+alienXI-10)&&(j*4+330<=l*32+12*alienYI+startHeightI+10)&&(j*4+334>l*32+12*alienYI+startHeightI-10)){
              shield1I[i][j]=0;
            }
            if((shield2I[i][j]==1)&&(aliensI[k][l]==1)&&(i*4+200<=k*40+alienXI+10)&&(i*4+204>k*40+alienXI-10)&&(j*4+330<=l*32+12*alienYI+startHeightI+10)&&(j*4+334>l*32+12*alienYI+startHeightI-10)){
              shield2I[i][j]=0;
            }
            if((shield3I[i][j]==1)&&(aliensI[k][l]==1)&&(i*4+336<=k*40+alienXI+10)&&(i*4+340>k*40+alienXI-10)&&(j*4+330<=l*32+12*alienYI+startHeightI+10)&&(j*4+334>l*32+12*alienYI+startHeightI-10)){
              shield3I[i][j]=0;
            }
            if((shield4I[i][j]==1)&&(aliensI[k][l]==1)&&(i*4+472<=k*40+alienXI+10)&&(i*4+476>k*40+alienXI-10)&&(j*4+330<=l*32+12*alienYI+startHeightI+10)&&(j*4+334>l*32+12*alienYI+startHeightI-10)){
              shield4I[i][j]=0;
            }
          }
        }
      }
    }
    //check how many aliens are alive
    sumAliensI=0;
    for(int i=0;i<aliensColI;i++){
      for(int j=0;j<aliensRowI;j++){
        sumAliensI=sumAliensI+aliensI[i][j];
      }
    }
    //check if all aliens are dead and the level should increase
    if(sumAliensI==0){
      levelIncreaseI();
    }
    //counters
    laserTimerI++;
    countI++;
  }
}



void setupI(){ //setup of space invaders
  pausedI=false;
  laserI=false;
  gameoverI=false;
  countDownI=false;
  titleScreenI=true;
  size(600,400);
  background(0);
  noStroke();
  rectMode(CENTER);
  for(int i=0;i<200;i++){
    backgroundXI=expand(backgroundXI,backgroundXI.length+1);
    backgroundXI[backgroundXI.length-1]=int(random(width));
    backgroundYI=expand(backgroundYI,backgroundYI.length+1);
    backgroundYI[backgroundYI.length-1]=0;
    for(int j=0;j<backgroundXI.length;j++){
      backgroundYI[j]=backgroundYI[j]+4;
    }
  }
}



void rayI(int x,int y){ //draw the alien death rays
  strokeWeight(2);
  stroke(255);
  line(x,y-6,x,y+6);
}



void laserI(int x,int y){ //draw the ship laser
  strokeWeight(2);
  stroke(255,0,0);
  line(x,y+6,x,y-6);
}



void shieldsI(){ //draw the shields
  noStroke();
  fill(0,255,255);
  for(int i=0;i<shieldColI;i++){
    for(int j=0;j<shieldRowI;j++){
      if(shield1I[i][j]==1){
        rect(64+i*4,334+j*4,4,4);
      }
      if(shield2I[i][j]==1){
        rect(200+i*4,334+j*4,4,4);
      }
      if(shield3I[i][j]==1){
        rect(336+i*4,334+j*4,4,4);
      }
      if(shield4I[i][j]==1){
        rect(472+i*4,334+j*4,4,4);
      }
    }
  }
}



void aliensI(int x,int y){ //draw the aliens
  noStroke();
  rectMode(CENTER);
  for(int i=0;i<aliensColI;i++){
    for(int j=0;j<aliensRowI;j++){
      if(j<3){
        fill(255,128*j,0);
      }else if(j==3){
        fill(0,255,0);
      }else{
        fill(0,0,255);
      }
      if(aliensI[i][j]==1){
        rect(40*i+x,32*j+y-4,12,12);
        rect(40*i+x-8,32*j+y+2,4,16);
        rect(40*i+x,32*j+y+2,4,16);
        rect(40*i+x+8,32*j+y+2,4,16);
      }
    }
  }
}



void shipI(int x){ //draw the ship
  if(x!=0){
    noStroke();
    fill(255,0,0);
    int y=height-4;
    arc(x,y,40,30,PI,2*PI);
    rect(x,y-12,4,20);
  }
}



void barI(int hearts,int lvl){ //top display bar
  noStroke();
  fill(255,0,0);
  for(int i=0;i<hearts;i++){
    triangle(width-30*i-20,30,width-30*i-10,16,width-30*i-30,16);
    ellipse(width-30*i-25,15,10,10);
    ellipse(width-30*i-15,15,10,10);
  }
  fill(255);
  textSize(20);
  textAlign(LEFT,CENTER);
  text("LEVEL "+lvl,10,15);
  textAlign(CENTER,CENTER);
  text("SCORE "+scoreI,width/2,15);
}



void beginI(){ //start a new game
  for(int i=0;i<shieldColI;i++){
    for(int j=0;j<shieldRowI;j++){
      shield1I[i][j]=1;
      shield2I[i][j]=1;
      shield3I[i][j]=1;
      shield4I[i][j]=1;
    }
  }
  countI=0;
  levelI=1;
  livesI=3;
  scoreI=0;
  newLvlI();
};



void newLvlI(){ //start a new level
  for(int i=0;i<aliensColI;i++){
    for(int j=0;j<aliensRowI;j++){
      aliensI[i][j]=1;
    }
  }
  shipI=96;
  shipVI=0;
  alienXI=32;
  alienYI=-1;
  startHeightI=42+8*levelI;
  laserTimerI=0;
  laserYI=-8;
  rayXI=new int[0];
  rayYI=new int[0];
  sumAliensI=50;
  bI=0;
}



void frameI(){ //draw a frame
  background(0);
  laserI(laserXI,laserYI);
  for(int i=0;i<rayYI.length;i++){
    rayI(rayXI[i],rayYI[i]);
  }
  shipI(shipI);
  aliensI(alienXI,startHeightI+12*alienYI);
  shieldsI();
  barI(livesI,levelI);
}



void deathI(){ //player died
  livesI--;
  if(livesI==0){
    gameoverI();
  }else{
    countDownI=true;
    laserYI=-8;
    shipI=0;
    timeI=0;
    textAlign(CENTER,CENTER);
  }
}



void levelIncreaseI(){ //increase the level
  countI=-1;
  if(livesI<6){
    livesI++;
  }
  levelI++;
  newLvlI();
}



void gameoverI(){ //player died and ran out of lives
  gameoverI=true;
  fill(0,0,0,200);
  rect(width/2,height/2,width,height);
  fill(255);
  textSize(80);
  textAlign(CENTER,BOTTOM);
  text("GAME",width/2,height/2);
  textAlign(CENTER,TOP);
  text("OVER",width/2,height/2);
  textSize(20);
  text("SCORE = "+scoreI,width/2,height-70);
}




//NOT PONG
void game2(){
  rectMode(CORNER);
  background(0);
  gdirect();
}

void gdirect(){
  if (gmod==0){notpongpackground(); lobby(); mouse();}
  if (gmod==1){gmod1();}
  if (gmod==2){gmod2();}
  if (gmod==5){gmod1win(); mouse();}
  if (gmod==6){sololost(); mouse();}
  if (gmod==7){pongpaused(1); mouse();}
}

void notpongpackground(){
  if (notpongeffect>=10){
    notpongeffect=0;
  } else notpongeffect++;
  stroke(255);
  for (int i=0; i<80; i++){
    line(400-(i*10)-notpongeffect,800-(i*10)-notpongeffect,800-(i*10)-notpongeffect,0-(i*10)-notpongeffect);
  }
  
}

void lobby(){
  fill(0);
  stroke(0,255,255);
  rectMode(CORNER);
  textAlign(CENTER, CENTER);
  rect(50,100,200,200);
  rect(width/2+50,100,200,200);
  rect(50,325,width-100,50);
  fill(255);
  textSize(120);
  text("1P",150,185);
  text("2P",450,185);
  textSize(42);
  text("Exit",width/2,345);
  textSize(120);
  if (mouseX>50 && mouseX<250  && mouseY>100 && mouseY<300){
    fill(255);
    rect(50,100,200,200);
    fill(0);
    rect(width/2+50,100,200,200);
    text("1P",150,185);
    fill(255);
    textSize(15);
    text("SOLO GAME",width/2+150,120);
    text("Last as long as you can!",width/2+150,160);
    text("The balls speed increases",width/2+150,180);
    text("every 5 seconds!",width/2+150,200);
    text("UP: W or Up Arrow",width/2+150,240);
    text("Down: S or Down Arrow",width/2+150,260);
    text("CANNOT BE PAUSED",width/2+150,280);
  } else if (mouseX>width/2+50 && mouseX<width/2+250  && mouseY>100 && mouseY<300){
    fill(255);
    rect(width/2+50,100,200,200);
    fill(0);
    text("2P",450,185);
    rect(50,100,200,200);
    fill(255);
    textSize(15);
    text("PLAYER VS PLAYER",150,120);
    text("First to five!",150,140);
    text("Player 1:  left side",150,180);
    text("Controlls: W & S",150,200);
    text("Player 2:  right side",150,240);
    text("Controlls: Arrow Keys",150,260);
    text("Press P to Pause",150,280);
  } else if (mouseX>50 && mouseX<width-50  && mouseY>325 && mouseY<375){
    fill(255);
    rect(50,325,width-100,50);
    fill(0);
    textSize(42);
    text("Exit",width/2,345);
    rect(width/2+50,100,200,200);
    rect(50,100,200,200);
    fill(255);
    textSize(15);
    text("PLAYER VS PLAYER",width/2+150,120);
    text("First to five!",width/2+150,140);
    text("Player 1:  left side",width/2+150,180);
    text("Controlls: W & S",width/2+150,200);
    text("Player 2:  right side",width/2+150,240);
    text("Controlls: Arrow Keys",width/2+150,260);
    text("Press P to Pause",width/2+150,280);
    text("SOLO GAME",150,120);
    text("Last as long as you can!",150,160);
    text("The balls speed increases",150,180);
    text("every 5 seconds!",150,200);
    text("UP: W or Up Arrow",150,240);
    text("Down: S or Down Arrow",150,260);
    text("CANNOT BE PAUSED",150,280);
  }
  textSize(60);
  fill(255,0,0,200);
  text("NOT PONG",width/2-4,40+1);
  fill(0,255,0,200);
  text("NOT PONG",width/2-2,40-1);
  fill(0,0,255,200);
  text("NOT PONG",width/2+3,40);
  fill(255,255,255,200);
  text("NOT PONG",width/2,40);
}



void score(){
  textSize(60);
  fill(255);
  text(score2,200,20);
  text(score1,400,20);
}



void reset(int winner){
  if (countdown==false){
    countime=millis()/1000;
    countdown=true;
    rester=0;
    if (winner==1){
      score1++;
    } else if (winner==2){
      score2++;
    }
  }
  if (countdown==true && rester<4){
    if (countime+rester==millis()/1000){
      rester++;
    }
    textSize(60);
    if (winner==1){
      fill(255,0,0);
      text(4-rester,30,20);
      fill(0,255,0);
      text(4-rester,width-30,height-40);
    } else if (winner==2){
      fill(255,0,0);
      text(4-rester,width-30,height-40);
      fill(0,255,0);
      text(4-rester,30,20);
    }
  } else if (rester==4){
    locx=width/2;
    locy=height/2;
    ballvy=0;
    ballvx=-ballvx;
    countdown=false;
  }
}



void gmod1(){
  //play v play classic
  if (nopause==true){
    fill(150);
    textSize(30);
    textAlign(CENTER, CENTER);
    text("Cannot pause on countdown", width/2,height/2);
  }
  if (locx<=30){
    reset(1);
  }
  if (locx>=width-30){
    reset(2);
  }
  strokeWeight(1);
  player1();
  player2();
  ball();
  noFill();
  stroke(255,255,255);
  for (int i=0; i<20; i++){
    rect(width/2-5,i*50+5,10,40);
  }
  score();
  if (score1>=5){
    winner=1;
    gametimerend=(millis()/1000);
    gmod=5;
  } if (score2>=5){
    gametimerend=(millis()/1000);
    winner=2;
    gmod=5;
  }
}



void gmod1win(){
  textSize(60);
  fill(255);
  textAlign(CENTER, CENTER);
  if (winner==1){
    text("P2 WINS!",width/2,30);
  } else if (winner==2){
    text("P1 WINS!",width/2,30);
  }
  textSize(20);
  textAlign(LEFT, CENTER);
  text("P1 score:  "+score2,10,100);
  text("P2 score:  "+score1,10,150);
  text("Rounds:  "+((score1+score2)),10,200);
  text("Average Round:  "+((gametimerend-gametimer)/(score1+score2))+" seconds",10,250);
  text("Game length:  "+(gametimerend-gametimer)+" seconds",10,300);
  text("Paddle Hits:  "+hits,10,350);
  textAlign(CENTER, CENTER);
  textSize(20);
  rect(350,100,200,50);
  rect(350,200,200,50);
  rect(350,300,200,50);
  fill(0);
  stroke(125);
  text("REPLAY",450,125);
  text("MENU",450,225);
  text("EXIT",450,325);
  if  (mouseX>350 && mouseX<550  && mouseY>100 && mouseY<150){
    fill(0);
    rect(350,100,200,50);
    fill(255);
    text("REPLAY",450,125);
  }else if  (mouseX>350 && mouseX<550  && mouseY>200 && mouseY<250){
    fill(0);
    rect(350,200,200,50);
    fill(255);
    text("MENU",450,225);
  }else if  (mouseX>350 && mouseX<550  && mouseY>300 && mouseY<350){
    fill(0);
    rect(350,300,200,50);
    fill(255);
    text("EXIT",450,325);
  }
}



void gmod2(){
  if (nopause==true){
    fill(150);
    textSize(30);
    textAlign(CENTER, CENTER);
    text("Cannot pause in Solo mode", width/2,height/2+100);
  }
  solotimer = (millis()/1000)-gametimer;
  fill(50);
  textAlign(CENTER, CENTER);
  textSize(64);
  text(solotimer,width/2,height/2);
  if (locx>=width-30){
    gmod=6;
  }
  player1();
  wall();
  ball();
}



void sololost(){
  textSize(20);
  textAlign(LEFT, CENTER);
  fill(255);
  if (solotimer>=soloscore){
    text("NEW HIGH SCORE!!!",10,100);
    soloscore=solotimer;
  } else if (solotimer<soloscore){
    text("LllLLoOo0oO0oSssSSEeERRr",10,100);
  }
  textSize(60);
  fill(255);
  textAlign(CENTER, CENTER);
  text("GAME OVER!",width/2,30);
  textSize(20);
  textAlign(LEFT, CENTER);
  text("High Score:  "+soloscore,10,150);
  text("Your Score:  "+solotimer,10,200);
  text("Paddle Hits:  "+hits,10,250);
  textAlign(CENTER, CENTER);
  rect(350,100,200,50);
  rect(350,200,200,50);
  rect(350,300,200,50);
  fill(0);
  stroke(125);
  text("REPLAY",450,125);
  text("MENU",450,225);
  text("EXIT",450,325);
  if  (mouseX>350 && mouseX<550  && mouseY>100 && mouseY<150){
    fill(0);
    rect(350,100,200,50);
    fill(255);
    text("REPLAY",450,125);
  }else if  (mouseX>350 && mouseX<550  && mouseY>200 && mouseY<250){
    fill(0);
    rect(350,200,200,50);
    fill(255);
    text("MENU",450,225);
  }else if  (mouseX>350 && mouseX<550  && mouseY>300 && mouseY<350){
    fill(0);
    rect(350,300,200,50);
    fill(255);
    text("EXIT",450,325);
  }
}



void pongpaused(int magicnumber){
  if (magicnumber==1){
    score();
    player1();
    player2();
    fill(255);
    stroke(0,255,255);
    ellipse(locx,locy,10,10);
    noFill();
    stroke(255,255,255);
    for (int i=0; i<20; i++){
      rect(width/2-5,i*50+5,10,40);
    }
    fill(50,50,50,200);
    rect(-10,-10,1000,1000);
    fill(0,0,0,200);
    stroke(255,255,255,200);
    rectMode(CORNER);
    textAlign(CENTER, CENTER);
    rect(50,100,200,200);
    rect(width/2+50,100,200,200);
    fill(255,255,255,200);
    textSize(30);
    text("RETURN",150,185);
    text("MENU",450,185);
    if (mouseX>50 && mouseX<250  && mouseY>100 && mouseY<300){
      fill(255,255,255,200);
      rect(50,100,200,200);
      fill(0,0,0,255);
      text("RETURN",150,185);
    } else if (mouseX>width/2+50 && mouseX<width/2+250  && mouseY>100 && mouseY<300){
      fill(255,255,255,200);
      rect(width/2+50,100,200,200);
      fill(0,0,0,255);
      text("MENU",450,185);
    }
  }
}



void ball(){
  if (gmod==1){
    if (locx==width-45 && locy>p1 && locy<p1+60 && pv1==0 && ballvy>0){
      ballvx=-ballvx;
      ballvy--;
      hits++;
    } else if (locx==width-45 && locy>p1 && locy<p1+60 && pv1==0 && ballvy<0){
      ballvx=-ballvx;
      ballvy++;
      hits++;
    } else if (locx==width-45 && locy>p1 && locy<p1+60 && pv1==0 && ballvy==0){
      ballvx=-ballvx;
      ballvy=ballvy+round(random(-1,1));
      hits++;
    } else if (locx==width-45 && locy>p1 && locy<p1+60 && pv1>0){
      ballvx=-ballvx;
      ballvy=3;
      hits++;
    } else if (locx==width-45 && locy>p1 && locy<p1+60 && pv1<0){
      ballvx=-ballvx;
      ballvy=-3;
      hits++;
    }
    if (locx==45 && locy>p2 && locy<p2+60 && pv2==0 && ballvy>0){
      ballvx=-ballvx;
      ballvy--;
      hits++;
    } else if (locx==45 && locy>p2 && locy<p2+60 && pv2==0 && ballvy<0){
      ballvx=-ballvx;
      ballvy++;
      hits++;
    } else if (locx==45 && locy>p2 && locy<p2+60 && pv2==0 && ballvy==0){
      ballvx=-ballvx;
      ballvy=ballvy+round(random(-1,1));
      hits++;
    } else if (locx==45 && locy>p2 && locy<p2+60 && pv2>0){
      ballvx=-ballvx;
      ballvy=3;
      hits++;
    } else if (locx==45 && locy>p2 && locy<p2+60 && pv2<0){
      ballvx=-ballvx;
      ballvy=-3;
      hits++;
    }
  }
  if (gmod==2){
    if (locx>=width-45 && locy>p1 && locy<p1+60 && pv1==0 && ballvy>0){
      ballvx=-ballvx;
      ballvy--;
      hits++;
    } else if (locx>=width-45 && locy>p1 && locy<p1+60 && pv1==0 && ballvy<0){
      ballvx=-ballvx;
      ballvy++;
      hits++;
    } else if (locx>=width-45 && locy>p1 && locy<p1+60 && pv1==0 && ballvy==0){
      ballvx=-ballvx;
      ballvy=ballvy+round(random(-1,1));
      hits++;
    } else if (locx>=width-45 && locy>p1 && locy<p1+60 && pv1>0){
      ballvx=-ballvx;
      ballvy=3;
      hits++;
    } else if (locx>=width-45 && locy>p1 && locy<p1+60 && pv1<0){
      ballvx=-ballvx;
      ballvy=-3;
      hits++;
    }
    if (locx<=45 && locy>-10 && locy<height+20){
      ballvx=-ballvx;
      ballvy=ballvy+round(random(-3,3));
    }
    println(solotimer);
    if (soloup<=solotimer){
      println("YES");
      soloup=solotimer+5;
      if (ballvx>0){
        ballvx=ballvx+1;
      } else if (ballvx<0){
        ballvx=ballvx-1;
      }
    }
  }
  if (locy<=5){
    ballvy=-ballvy;
  } else if (locy>=height-5){
    ballvy=-ballvy;
  } 
  locx=locx+ballvx;
  locy=locy+ballvy;
  fill(255);
  stroke(0,255,255);
  ellipse(locx,locy,10,10);
}



void player1(){
  if (p1>=0&&pv1<0){
    p1=p1+pv1;
  } else if (p1<height-60&&pv1>0){
    p1=p1+pv1;
  }
  stroke(0,255,255);
  fill(0);
  rect(width-40,p1,10,60);
}



void player2(){
  if (p2>=0&&pv2<0){
    p2=p2+pv2;
  } else if (p2<height-60&&pv2>0){
    p2=p2+pv2;
  }
  stroke(255,0,255);
  fill(0);
  rect(30,p2,10,60);
}



void wall(){
  stroke(255);
  fill(0);
  rect(30,-10,10,height+20);
}



void cleanup(){
  score1=0;
  score2=0;
  winner=0;
  gametimer=0;
  gametimerend=0;
  hits=0;
  scorep1 = 0;
  scorep2 = 0;
  ballvx = 5;
  ballvy = 0;
  locx = 300;
  locy = 200;
  pv1 = 0;
  pv2 = 0;
  x = 300;
  y = 200;
  p1 = 200-30;
  p2 = 200-30;
  countdown=false;
  nopause=false;
}




//snake
void snakelookup(){
  strokeWeight(1);
  rectMode(CORNER);
  if (sgmod==0){
    snakebackground();
    snakeloby();
    cleansnake();
  }
  if (sgmod==1){
    snake();
    backback();
    food();
    fill(0);
    for (int i=0; i<snaketailx.length; i++){
      rect(snaketailx[i],snaketaily[i],sgrid,sgrid);
    }
  }
  if (sgmod==2){
    snakelose();
  }
  if (sgmod==3){
    snakepause();
  }
}



void snakebackground(){
  background(0);
  noFill();
  stroke(0,255,255);
  strokeWeight(1);
  snakeloop++;
  if (snakeloop==50){
    snakeloop=0;
  }
  for(int i=0; i<100; i++){
    ellipse(305,245,i*50+snakeloop,i*50+snakeloop);
  }
}



void snakeloby(){
  stroke(255,0,255);
  fill(0);
  rect(10,200,175,100);
  rect(215,200,175,100);
  rect(415,200,175,100);
  rect(50,325,width-100,50);
  textSize(40);
  textAlign(CENTER, CENTER);
  fill(255);
  textSize(20);
  text("COLLECT FOOD TO SCORE POINTS!",width/2,90);
  text("LOOK OUT FOR THE WALLS!",width/2,110);
  text("DON'T TRY AND EAT YOURSELF!",width/2,130);
  text("Use the Arrow keys to move",width/2,160);
  text("Press 'P' to Pause",width/2,180);
  textSize(40);
  text("N00B",100,245);
  text("NORMIE",305,245);
  text("1337",505,245);
  text("Exit",width/2,345);
  if (mouseX>10 && mouseX<185  && mouseY>200 && mouseY<300){
    fill(255,0,255);
    rect(10,200,175,100);
    fill(255);
    text("N00B",100,245);
  } else if (mouseX>215 && mouseX<390  && mouseY>200 && mouseY<300){
    fill(255,0,255);
    rect(215,200,175,100);
    fill(255);
    text("NORMIE",305,245);
  } else if (mouseX>415 && mouseX<590  && mouseY>200 && mouseY<300){
    fill(255,0,255);
    rect(415,200,175,100);
    fill(255);
    text("1337",505,245);
  }  else if (mouseX>50 && mouseX<width-50  && mouseY>325 && mouseY<375){
    fill(255,0,255);
    rect(50,325,width-100,50);
    fill(255);
    text("Exit",width/2,345);
  }
  textAlign(CENTER, CENTER);
  textSize(60);
  fill(255,0,0,200);
  text("NOT SNAKE",width/2-4,40+1);
  fill(0,255,0,200);
  text("NOT SNAKE",width/2-2,40-1);
  fill(0,0,255,200);
  text("NOT SNAKE",width/2+3,40);
  fill(255,255,255,200);
  text("NOT SNAKE",width/2,40);
  mouse();
}



void backback(){
  background(255);
  noFill();
  stroke(0);
  for (int i=0; i<60; i++){
    for (int k=0; k<40; k++){
      if (i==0 || i==59 || k==0 || k==39){
        fill(0);
      } else noFill();
      rect(sgrid*i,sgrid*k,sgrid,sgrid);
    }
  }
}

void snake(){
  if (snakespeed==1){
    currentmils = millis()/100-snakestart;
  } else if (snakespeed==2){
    currentmils = millis()/50-snakestart;
  } else if (snakespeed==3){
    currentmils = millis()/25-snakestart;
  }
  if (currentmils%1==0 && pastsec!=currentmils){
    pastsec=currentmils;
    currentD=direction;
    if (currentD==0){
      snakelocy=snakelocy-sgrid;
    } else if (currentD==1){
      snakelocy=snakelocy+sgrid;
    } else if (currentD==2){
      snakelocx=snakelocx-sgrid;
    } else if (currentD==3){
      snakelocx=snakelocx+sgrid;
    }
    for (int i =snaketailx.length-1; i>0; i--){
      snaketailx[i]=snaketailx[i-1];
      snaketaily[i]=snaketaily[i-1];
    }
    snaketailx[0]=snakelocx;
    snaketaily[0]=snakelocy;
  }
  if (snaketailx[0]==0 || snaketailx[0]==590 || snaketaily[0]==0 || snaketaily[0]==390){
    snakeend=millis()/1000;
    sgmod=2;
  }
  for (int i=1; i<snaketailx.length; i++){
    if (snaketailx[0]==snaketailx[i] && snaketaily[0]==snaketaily[i]){
      snakeend=millis()/1000;
      sgmod=2;
    }
  }
}



void food(){
  fill(255,0,0);
  ellipse(foodlocx+5,foodlocy+5,10,10);
  if (snakelocx==foodlocx && snakelocy==foodlocy){
    snakepoints++;
    snaketailx=expand(snaketailx,snaketailx.length+1);
    snaketaily=expand(snaketaily,snaketaily.length+1);
    for (int k=0; k==0; k++){
      randx=round(random(1,58));
      randy=round(random(1,38));
      for (int i=0; i<snaketailx.length; i++){
        if (randx==snaketailx[i]/10){
          k=0;
        }
        if (randy==snaketaily[i]/10){
          k=0;
        }
      }
    }
    foodlocx=randx*10;
    foodlocy=randy*10;
    //println(foodlocx+"   "+foodlocy);
  }
}



void snakelose(){
  background(0);
  fill(255,0,0);
  textSize(100);
  textAlign(CENTER, CENTER);
  text("GAME OVER!",width/2,60);
  // textAlign(LEFT);
  textSize(30);
  text("Time:   "+(snakeend-snakestart)+"  Seconds!",width/2,170);
  text("Score:  "+(snakepoints),width/2,210);
  stroke(255,0,0);
  fill(0);
  rect(10,275,175,100);
  rect(215,275,175,100);
  rect(415,275,175,100);
  textSize(40);
  fill(255,0,0);
  textAlign(CENTER, CENTER);
  text("RETRY",100,320);
  text("MENU",305,320);
  text("EXIT",505,320);
  if (mouseX>10 && mouseX<185  && mouseY>275 && mouseY<375){
    fill(255,0,0);
    stroke(0);
    rect(10,275,175,100);
    fill(255);
    text("RETRY",100,320);
  } else if (mouseX>215 && mouseX<390  && mouseY>275 && mouseY<375){
    fill(255,0,0);
    stroke(0);
    rect(215,275,175,100);
    fill(255);
    text("MENU",305,320);
  } else if (mouseX>415 && mouseX<590  && mouseY>275 && mouseY<375){
    fill(255,0,0);
    stroke(0);
    rect(415,275,175,100);
    fill(255);
    text("EXIT",505,320);
  }
  mouse(); 
}



void snakepause(){
  backback();
  food();
  fill(0);
  for (int i=0; i<snaketailx.length; i++){
    rect(snaketailx[i],snaketaily[i],sgrid,sgrid);
  }
  fill(50,50,50,200);
  rect(-10,-10,1000,1000);
  fill(0,0,0,200);
  stroke(255,255,255,200);
  rectMode(CORNER);
  textAlign(CENTER, CENTER);
  rect(50,100,200,200);
  rect(width/2+50,100,200,200);
  fill(255,255,255,200);
  textSize(30);
  text("RETURN",150,185);
  text("MENU",450,185);
  if (mouseX>50 && mouseX<250  && mouseY>100 && mouseY<300){
    fill(255,255,255,200);
    rect(50,100,200,200);
    fill(0,0,0,255);
    text("RETURN",150,185);
  } else if (mouseX>width/2+50 && mouseX<width/2+250  && mouseY>100 && mouseY<300){
    fill(255,255,255,200);
    rect(width/2+50,100,200,200);
    fill(0,0,0,255);
    text("MENU",450,185);
  }
  mouse();
}



void cleansnake(){
  snakepoints=0;
  snakestart = millis()/1000;
  currentmils = 0;
  pastsec = -1;
  direction =0;
  currentD= direction;
  snakelocx =300;
  snakelocy =300;
  sgrid=10;
  snaketailx = new int[4];
  snaketaily = new int[4];
  foodlocx=300;
  foodlocy=50;
  randx=round(random(0,60));
  randy=round(random(0,60));
  snakeend=0;
}



void keyPressed(){
  if (gameMode==1){ //not space invaders
    if(gameoverI==false){
      if(pausedI==false&&(keyCode==LEFT||key=='a'||key=='A')){
        shipVI=-4;
      }else if(pausedI==false&&(keyCode==RIGHT||key=='d'||key=='D')){
        shipVI=4;
      }else if(pausedI==false&&(key==' ')){
        laserI=true;
      }else if(key!=' '&&key!='a'&&key!='d'&&key!=CODED&&pausedI==false){
        pausedI=true;
      }else if(pausedI==true){
        pausedI=false;
      }
    }
  }
  if (gameMode==2){ //not pong
    if (gmod==1){
      if (keyCode == UP  ){
        pv1=-speed;
      }  else if (keyCode == DOWN ){
        pv1=speed;
      } if (key == 'w' ||  key == 'W'  ){
        pv2=-speed;
      }  else if (key == 's' ||  key == 'S'){
        pv2=speed;
      } else if ((key=='p' || key == 'P') && countdown==true){
        nopause=true;
      } else if (key=='p' || key == 'P' && countdown==false){
        nopause=false;
        gmod=7;
      }
    } else if (gmod==2){
      if ((keyCode == UP || (key == 'w' ||  key == 'W' ))){
        pv1=-speed;
      }  else if ((keyCode == DOWN || (key == 's' ||  key == 'S' ))){
        pv1=speed;
      } else if (key=='p' || key == 'P'){
        nopause=true;
      }
      
    } else if (gmod==5){
      if ((key=='r' || key == 'R')){
        cleanup();
        gametimer=millis()/1000;
        gametimerend=millis()/1000;
        gmod=1;
      }
    }else if (gmod==6){
      if ((key=='r' || key == 'R')){
        cleanup();
        gametimer=millis()/1000;
        gametimerend=millis()/1000;
        gmod=2;
      }
    }
  } else if (gameMode==3){
    if (sgmod==1){
      if (keyCode == UP && currentD!=1 ){
        direction=0;
      }  else if (keyCode == DOWN && currentD!=0){
        direction=1;
      } else if (keyCode == LEFT && currentD!=3){
        direction=2;
      }  else if (keyCode == RIGHT && currentD!=2){
        direction=3;
      } else if ((key=='p' || key == 'P')){
        sgmod=3;
      }
    } if (sgmod==2){
      if ((key=='r' || key == 'R')){
        cleansnake();
        sgmod=1;
      }
    }
  }
}



void keyReleased(){
  if (gameMode==1){ //not space invaders
    if(gameoverI==false){
      if(pausedI==false&&(keyCode==LEFT||key=='a'||key=='A'||keyCode==RIGHT||key=='d'||key=='D')){
        shipVI=0;
      }else if(pausedI==false&&(key==' ')){
        laserI=false;
      }
    }
  }
  if (gameMode==2){ //not pong
    if (gmod==1){
      if (keyCode == UP || keyCode == DOWN ){
        pv1=0;
      }
      if (key == 'w' ||  key == 'W'  || key == 's' ||  key == 'S'){
        pv2=0;
      }       if ((key=='p' || key == 'P') && countdown==true){
        nopause=false;
      }
      
    } else if (gmod==2){
      if ((keyCode == UP || (key == 'w' ||  key == 'W' ) || (keyCode == DOWN || (key == 's' ||  key == 'S' )))){
        pv1=0;
      }      if ((key=='p' || key == 'P')){
        nopause=false;
      }
    }
  }
}



void mousePressed(){
  if(gameMode==0){ //main menu
    if (mode==0){ //click to start
      if (mouseX>-10 && mouseX<width+10  && mouseY>-10 && mouseY<height+10){
        backout=true;
      }
    } else if (mode==2 && actpre==0){ //select preview
      if (mouseX>(width/24)+(0*(width/3)) && mouseX<(width/24)+(0*(width/3))+width/4  && mouseY>(height/8)+((height/2)*1) && mouseY<(height/8)+((height/2)*1)+height/4){ //view not space invaders preview
        if (page==1){
          actpre=1;
        }
      } else if (mouseX>(width/24)+(1*(width/3)) && mouseX<(width/24)+(1*(width/3))+width/4  && mouseY>(height/8)+((height/2)*1) && mouseY<(height/8)+((height/2)*1)+height/4){ //view not pong preview
        if (page==1){
          actpre=2;
        }
      } else if (mouseX>(width/24)+(2*(width/3)) && mouseX<(width/24)+(2*(width/3))+width/4  && mouseY>(height/8)+((height/2)*1) && mouseY<(height/8)+((height/2)*1)+height/4){ //view not snake preview
        if (page==1){
          actpre=3;
        }
      }
    }else if (mode==2 && actpre>0){ //preview
      if (mouseX>360 && mouseX<=520 && mouseY>=300 && mouseY<=340){ //return to preview select
        actpre=0;
      }else if(actpre==1 && mouseX>=80 && mouseX<=240 && mouseY>=300 && mouseY<=340){ //play not space invaders
        gameMode=1;
        setupI();
      }else if(actpre==2 && mouseX>=80 && mouseX<=240 && mouseY>=300 && mouseY<=340){ //play not pong
        gameMode=2;
      }else if(actpre==3 && mouseX>=80 && mouseX<=240 && mouseY>=300 && mouseY<=340){ //play not pong
        gameMode=3;
      }
    }
  }else if(gameMode==1){ //not space invaders
    if(titleScreenI==true){
      titleScreenI=false;
      beginI();
    }else if(gameoverI==true){
      gameoverI=false;
      titleScreenI=true;
    }else if(pausedI==true){
      if(mouseX>=width/2-100&&mouseX<=width/2+100&&mouseY>=180&&mouseY<=220){ //restart button
        pausedI=false;
        titleScreenI=true;
      }else if(mouseX>=width/2-100&&mouseX<=width/2+100&&mouseY>=260&&mouseY<=300){ //exit not space invaders button
        actpre=0;
        gameMode=0;
      }
    }
  } else if(gameMode==2){ //not pong
    if (gmod==0){
      if (mouseX>50 && mouseX<250  && mouseY>100 && mouseY<300){
        gmod=2;
        gametimer=millis()/1000;
      } else if (mouseX>width/2+50 && mouseX<width/2+250  && mouseY>100 && mouseY<300){
        gmod=1;
        gametimer=millis()/1000;
      } else if (mouseX>50 && mouseX<width-50  && mouseY>325 && mouseY<375){
        cleanup();
        actpre=0;
        gameMode=0;
      }
    }
    
    if (gmod==5){
      if (mouseX>350 && mouseX<550 && mouseY>100 && mouseY<150){
        //replay
        cleanup();
        gmod=1;
      } else if (mouseX>350 && mouseX<550 && mouseY>200 && mouseY<250){
        //main menu
        cleanup();
        gmod=0;
      } else if (mouseX>350 && mouseX<550 && mouseY>300 && mouseY<350){
        //exit
        cleanup();
        actpre=0;
        gmod=0;
        gameMode=0;
      }
    }
    if (gmod==6){
      if (mouseX>350 && mouseX<550 && mouseY>100 && mouseY<150){
        //replay
        cleanup();
        gametimer=millis()/1000;
        gametimerend=millis()/1000;
        gmod=2;
      } else if (mouseX>350 && mouseX<550 && mouseY>200 && mouseY<250){
        //main menu
        cleanup();
        gametimer=millis()/1000;
        gametimerend=millis()/1000;
        gmod=0;
      } else if (mouseX>350 && mouseX<550 && mouseY>300 && mouseY<350){
        //exit
        println("");
        cleanup();
        actpre=0;
        gmod=0;
        gametimer=millis()/1000;
        gametimerend=millis()/1000;
        gameMode=0;
      }
    }
    if (gmod==7 && mouseX>50 && mouseX<250  && mouseY>100 && mouseY<300){
      gmod=1;
    } if (gmod==7 && mouseX>width/2+50 && mouseX<width/2+250  && mouseY>100 && mouseY<300){
      cleanup();
      gmod=0;
    }
  } else if (gameMode==3){
    if (sgmod==0){
      if (mouseX>10 && mouseX<185  && mouseY>200 && mouseY<300){
        snakespeed = 1;
        snakestart = millis()/1000;
        sgmod=1;
      } else if (mouseX>215 && mouseX<390  && mouseY>200 && mouseY<300){
        snakespeed = 2;
        snakestart = millis()/1000;
        sgmod=1;
      } else if (mouseX>415 && mouseX<590  && mouseY>200 && mouseY<300){
        snakespeed = 3;
        snakestart = millis()/1000;
        sgmod=1;
      }  else if (mouseX>50 && mouseX<width-50  && mouseY>325 && mouseY<375){
        cleansnake();
        sgmod=0;
        gameMode=0;
      }
    }
    if (sgmod==2){
      if (mouseX>10 && mouseX<185  && mouseY>275 && mouseY<375){
        cleansnake();
        sgmod=1;
      } else if (mouseX>215 && mouseX<390  && mouseY>275 && mouseY<375){
        cleansnake();
        sgmod=0;
      } else if (mouseX>415 && mouseX<590  && mouseY>275 && mouseY<375){
        cleansnake();
        sgmod=0;
        gameMode=0;
      }
    }
    if (sgmod==3 && mouseX>50 && mouseX<250  && mouseY>100 && mouseY<300){
      sgmod=1;
    }
    if (sgmod==3 && mouseX>width/2+50 && mouseX<width/2+250  && mouseY>100 && mouseY<300){
      sgmod=0;
    }
  }
}