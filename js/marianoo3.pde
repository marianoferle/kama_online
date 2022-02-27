 PGraphics pg1;
 PFont myFont,myFont2;
 String[] fontList;
 String[] car_ga;
 int[] valor;
 String[] valores;
 int[][] vv;
 String[][] vvs; 
 float[] usX;
 float[] usY;
 float[] usZ;
 float[] gX;
 float[] gY;
 float[] gZ;
 
 int[] L; 
int visual2=0;
 
 PImage[] pose = new PImage[13];
 PImage[] porcen_pos = new PImage[5];
 PImage logo_img,logo_img2;
 PImage pos1;
 PImage sex1,sex2;
 User[] us;
 int[] sex_h; 
 int[] sex_m;
 int[] sex_total;
 int[] casa_h; 
 int[] solte_h;
 int[] casa_m; 
 int[] solte_m; 
 
 int[] hete_h;
 int[] bi_h;
 int[] homo_h;
 int[] hete_m;
 int[] bi_m;
 int[] homo_m;
 
float px, py, px2, py2;
float angle,angle2;
float radius;
int s_h,s_m;

String[] pos_t={"En 4","La 69","El Abrazo","Boca Abajo","Cabalgada","La Fusion","Guarda Espalda","El Jinete","La Flautita","El Misionero","La Mitad mas Uno","El Perrito","El Sorbete"};



void setup() {
  background(360);
  fontList = PFont.list();
  myFont = createFont("FFScala", 10);
  myFont2 = createFont("sans-serif", 10);
  textFont(myFont);
  size(1000,600,P3D);  
  smooth();
  colorMode(HSB, 360, 100, 100);
  frameRate(30);
  

  
  //pg1 = createGraphics (width,height,P3D);
  
   car_ga = loadStrings("query2.php?tipo=cargar");
 
   sex1 = loadImage("images/kama/hombre.png");
   sex2 = loadImage("images/kama/mujer.png");
   
   pose[0] = loadImage("images/kama/4.png");
   pose[1] = loadImage("images/kama/69.png");
   pose[2] = loadImage("images/kama/abrazo.png");
   pose[3] = loadImage("images/kama/boca_abajo.png");
   pose[4] = loadImage("images/kama/cabalgada_espalda.png");
   pose[5] = loadImage("images/kama/fusion.png");
   pose[6] = loadImage("images/kama/guarda_espalda.png");
   pose[7] = loadImage("images/kama/jinete.png");
   pose[8] = loadImage("images/kama/la_flautita.png");
   pose[9] = loadImage("images/kama/misionero.png");
   pose[10] = loadImage("images/kama/mitad_mas_uno.png");
   pose[11] = loadImage("images/kama/perrito.png");
   pose[12] = loadImage("images/kama/sorbete.png");
   
   pos1=pose[0];
   
   porcen_pos[0] = loadImage("images/poses/hombre_100.png");
   porcen_pos[1] = loadImage("images/poses/hombre_25.png");
   porcen_pos[2] = loadImage("images/poses/hombre_50.png");
   porcen_pos[3] = loadImage("images/poses/hombre_75.png");
   porcen_pos[4] = loadImage("images/poses/mujer_100.png");
   
   logo_img = loadImage("images/kama_log3.png");
   logo_img2 = loadImage("images/kama_log2.png");
   
   usX = new float[car_ga.length];
   usY = new float[car_ga.length];
   usZ = new float[car_ga.length];
   gX= new float[13];
   gY= new float[13];
   gZ= new float[13];    
   prep();
}  

void draw() {
noLoop();
cargar_datos();
ver_perfil();
}


void prep(){
  if(visual2==0){
 for(int i=3;i<car_ga.length;i++){
   usX[i]=random(width); 
   usY[i]=random(height);
   usZ[i]=random(-50,50);
 }   
 for(int u=0;u<=12;u++){ 
   gX[u]=random(width); 
   gY[u]=random(height);
   gZ[u]=random(-50,50);
 }  
  }else if(visual2==1){
   for(int i=3;i<car_ga.length;i++){ 
      int xu=-20+20*i;int yu=60; 
      if(xu>=width-20){yu=yu+30;xu=xu-width+60;} 
      usX[i]=xu; usY[i]=yu; 
   }   
   for(int u=0;u<=12;u++){ gX[u]=140+55*u; gY[u]=height-40;}
 }
}

void mouseMoved(){ ver_perfil();}      //al mover el mouse se detecta si pasa por ensima de algun perfil y asi mostrarlo.
void mouseDragged(){ ver_perfil();} 
void mousePressed(){ if(visual2==1){visual2=0;}else if(visual2==0){visual2=1;} if(mouseButton==RIGHT){ prep(); } }  //al hacer click activa prep, que es random x,y

void keyPressed(){
 if(key=='p'){visual2=1;}
 if(key=='o'){visual2=0;} 
}

//----------CARGAR DATOS------------
void cargar_datos(){
//tint(360,50); image(logo_img,width-75,height-40,75,40);
//tint(360,50);noTint();  

  L = new int[13];
  sex_h = new int[13];
  sex_m = new int[13];
  sex_total = new int[13];
  casa_h=new int[13];
  solte_h=new int[13];
  casa_m=new int[13];
  solte_m=new int[13];
  hete_h=new int[13];
  hete_m=new int[13];
  bi_h=new int[13];
  bi_m=new int[13];
  homo_h=new int[13];
  homo_m=new int[13];
  
  for(int u=0; u<=12; u++){   
    L[u]=0;
    sex_h[u]=0;sex_m[u]=0;
    sex_total[u]=0;
    casa_h[u]=0;casa_m[u]=0;
    solte_h[u]=0;solte_m[u]=0;
    hete_h[u]=0;hete_m[u]=0; 
    bi_h[u]=0;bi_m[u]=0;
    homo_h[u]=0;homo_m[u]=0;
  }
  
  ver_user();
}

//----------------Ver_User-----------
void ver_user(){
  s_h=0;s_m=0; 
  us = new User[car_ga.length];  
for (int i=3; i<car_ga.length; i++){       // -5 en ordenador , -9 en internet    , 7       ............................................    
         valor =int(split(car_ga[i], ","));
         valores =split(car_ga[i], ",");    
         //---------                    
         us[i] = new User(usX[i],usY[i],usZ[i]); 
         us[i].user_ac(valores[1],valor[2]);
         us[i].user_gus(valor[2],valor[3],valor[4],valor[5],valor[6],valor[7],valor[8],valor[9],valor[10],valor[11],valor[12],valor[13],valor[14],valor[15],valor[16],valor[17],valor[18]);
         if(valor[2]==1){s_h+=1;;}else if(valor[2]==2){s_m+=1;}
}//--for--
  image(sex1,0,0,25,25);fill(215,100,100);text(s_h,7,35);
  image(sex2,15,0,25,25);fill(325,100,100);text(s_m,25,35);
  
  
  gustos(); 
}//---ver_user---

//-----------------ver_perfil-------------------


void ver_perfil(){
background(360);
int r_i=25;

cargar_datos();

for (int i=3; i<car_ga.length-1; i++){ 
   valor =int(split(car_ga[i], ","));valores =split(car_ga[i], ",");        
if(mouseX<usX[i]+12 && mouseX>usX[i]-12 && mouseY<usY[i]+12 && mouseY>usY[i]-12){ 
   perfil_user(i,valores[1],valor[2],valor[16],valor[17],valor[18],valor[19]);
}
}

for(int i=0;i<=12;i++){
   if(L[i]>0 && mouseX<gX[i]+r_i && mouseX>gX[i]-r_i && mouseY<gY[i]+r_i && mouseY>gY[i]-r_i){
   String pl=pos_t[i]; 
   perfil(i,pl);
   }
}




}//ver_perfil
 
void perfil_user(int i,String user,int va2,int va16,int va17,int va18, int va19){
    int gX1,gY1,gX2,gY2,gX3,gY3,gX4,gY4;
    gX1=0;gY1=0;gX2=0;gY2=0;gX3=0;gY3=0;gX4=0;gY4=0;
    

     pushStyle();
     stroke(0,120);
      strokeWeight(1.5);
      for(int u=0;u<=12;u++){
        int u2=u+3;        
      if(valor[u2]>0){ line(usX[i],usY[i],gX[u],gY[u]); } 
      }
     popStyle();

   
   if(usX[i]+100<=width){ 
    gX1=15;   //fondoX
    gX2=25;   //titulo poses
    gX3=34;   //datosuser
    gX4=26;   //punto
  }
  if(usY[i]+110<=height){ 
    gY1=10;    //fondoY
    gY2=30;    //titulo poses
    gY3=30;    //datosuser   
    gY4=28;    //punto
  }
  if(usX[i]+100>=width){ 
    gX1=-115;   //fondoX
    gX2=-105;   //titulo poses
    gX3=-100;   //datosuser
    gX4=-108;   //punto
  }
  if(usY[i]+110>=height){ 
    gY1=-100;   //fondoY
    gY2=-80;   //titulo poses
    gY3=-80;   //datos user
    gY4=-82;   //punto
  }
  
    pushStyle();
    if(valor[2]==1){ stroke(215,100,100); }else if(valor[2]==2){ stroke(325,100,100);} 
    stroke(200); 
    strokeWeight(0.5);   
    fill(360,340);rect(usX[i]+gX1,usY[i]+gY1,100,90,10);
    
    if(valor[2]==1){ fill(215,100,100);}else if(valor[2]==2){ fill(325,100,100);}    
    noStroke();
    ellipse(usX[i]+gX4,usY[i]+gY4,5,5);ellipse(usX[i]+gX4,usY[i]+gY4+15,5,5);ellipse(usX[i]+gX4,usY[i]+gY4+30,5,5);
    ellipse(usX[i]+gX4,usY[i]+gY4+45,5,5);ellipse(usX[i]+gX4,usY[i]+gY4+60,5,5);   
    
    if(valor[2]==1){ fill(215,100,100); image(sex1,usX[i]+gX2+70,usY[i]+gY2-15,18,18); }else
    if(valor[2]==2){ fill(325,100,100); image(sex2,usX[i]+gX2+70,usY[i]+gY2-15,18,18); }    
    textFont(myFont2,16);
    //text(valores[1],usX[i]+gX2,usY[i]+gY2);
    fill(0);
    textFont(myFont,11);    
    if(valor[2]==1){ text("Hombre",usX[i]+gX3,usY[i]+gY3);}else if(valor[2]==2){ text("Mujer",usX[i]+gX3,usY[i]+gY3);}
    
    text(valor[16]+" años",usX[i]+gX3,usY[i]+gY3+15);
   
    if(valor[17]==1){ text("Heterosexual",usX[i]+gX3,usY[i]+gY3+30);}else 
    if(valor[17]==2){ text("Bisexual",usX[i]+gX3,usY[i]+gY3+30);}else
    if(valor[17]==3){ text("Homosexual",usX[i]+gX3,usY[i]+gY3+30);}
    
    if(valor[18]==0){ text("Soltero/a",usX[i]+gX3,usY[i]+gY3+45);}else 
    if(valor[18]==1){ text("En Pareja",usX[i]+gX3,usY[i]+gY3+45);}

    text(valores[19],usX[i]+gX3,usY[i]+gY3+60);
    popStyle();
      
}



void perfil(int c,String poses){
  int gX1,gY1,gX2,gY2,gX3,gY3;
  gX1=100;gY1=100; 
  gX2=120;gY2=240;
  gX3=120;gY3=380;
  
  noStroke();
  fill(360,300);rect(0,0,1000,600);
  strokeWeight(0.5);
  stroke(325,100,100);
  fill(360);rect(gX1,gY1,800,400,10);
  fill(0);textFont(myFont2,18);text(poses,gX1+22,gY1+60);
  image(logo_img,820,105,75,40);

  int casa=casa_h[c]+casa_m[c]; 
  int solte=solte_h[c]+solte_m[c];
  int p_h=sex_h[c]*100; 
  int p_m=sex_m[c]*100;
  int porcen_h=round(p_h/sex_total[c]); 
  int porcen_m=round(p_m/sex_total[c]);
  
  image(sex1,gX2-10,gY2-45,35,35);  
  fill(215,100,100);textFont(myFont,12);text(porcen_h+"%",gX2+30,gY2-20);
  textFont(myFont,11);
  fill(0);
  text("Hombres: ... "+sex_h[c],gX2,gY2);
  fill(215,100,100);
  text("En Pareja: . "+casa_h[c],gX2,gY2+20);
  text("Solteros: ... "+solte_h[c],gX2,gY2+35);
  text("Heterosexuales:. "+hete_h[c],gX2,gY2+55);
  text("Bisexuales:......... "+bi_h[c],gX3,gY2+70);
  text("Homosexuales:... "+homo_h[c],gX2,gY2+85);
  
  image(sex2,gX3-10,gY3-45,35,35); 
  fill(325,100,100); textFont(myFont,12); text(porcen_m+"%",gX3+30,gY3-20);
  textFont(myFont,11); 
  fill(0);
  text("Mujeres: .... "+sex_m[c],gX3,gY3);
  fill(325,100,100);  
  text("En Pareja: . "+casa_m[c],gX3,gY3+20);
  text("Solteras: ... "+solte_m[c],gX3,gY3+35); 
  text("Heterosexuales:. "+hete_m[c],gX3,gY3+55);
  text("Bisexuales:......... "+bi_m[c],gX3,gY3+70);
  text("Homosexuales:... "+homo_m[c],gX3,gY3+85);
  
  
  for(int b=0;b<=12;b++){   
    
    int p_h3=sex_h[b]*210;
    int p_m3=sex_m[b]*210;
    int porcen_h3=round(p_h3/sex_total[b]); 
    int porcen_m3=round(p_m3/sex_total[b]);
    if(pose[b]==pose[c]){
     stroke(0);fill(150,30);ellipse(250+50*b,450,40,40);
     image(pose[c],230+50*b,430,40,40);
    }else{
     image(pose[b],230+50*b,430,40,40);  
    }
    noStroke();
    fill(200,100,100,30);rect(245+50*b,420,5,-210);
    fill(200,100,100);rect(245+50*b,420,5,-porcen_h3);
    fill(325,100,100,30);rect(250+50*b,420,5,-210);
    fill(325,100,100);rect(250+50*b,420,5,-porcen_m3);
  }     
}

// ----GUSTOS-------------
void gustos(){

    smooth();
    strokeWeight(3);
    stroke(0);
    fill(360);
 for(int i=0;i<=12;i++){
   sex_total[i]=sex_m[i]+sex_h[i];
   int r1=60;
   int r2=30;

  if(L[i]>0){      
       
      if(L[i]==sex_h[i]){                                                    // 100% Hombre
          image(porcen_pos[0],gX[i]-r2,gY[i]-r2,r1,r1);
       }else if(L[i]==sex_m[i]){                                             // 100% Mujer
          image(porcen_pos[4],gX[i]-r2,gY[i]-r2,r1,r1);
       }else if(sex_h[i]==sex_m[i]){                                         // 50% Mujer, 50% Hombre
          image(porcen_pos[2],gX[i]-r2,gY[i]-r2,r1,r1);
       }else if(sex_h[i]<sex_m[i]){                                          // 75% Mujer, 25% Hombre
          image(porcen_pos[1],gX[i]-r2,gY[i]-r2,r1,r1);
       }else{                                                                // 25% Mujer, 75% Hombre
          image(porcen_pos[3],gX[i]-r2,gY[i]-r2,r1,r1);
       }

         image(pose[i],gX[i]-20,gY[i]-20,40,40);
         //image(pose[i],mouseX,mouseY+30*i,30,30);
         //fill(0);text("H:",gX[i]-40,gY[i]+40); text(sex_h[i],gX[i]-25,gY[i]+40);
         // text("M:",gX[i]-5,gY[i]+40);text(sex_m[i],gX[i]+10,gY[i]+40);

  
  }// L>0     
 }//i
}//-------/gustos--------



//------------------------------------------------------CLASS User-----------------------------------

class User{
  float usX,usY,usZ; 
 
  User(float ussX, float ussY, float ussZ){
  usX=ussX;
  usY=ussY;
  usZ=ussZ;
  }
  
//-----------------

  void user_ac(String user,int sex){
     if(sex==1){
        image(sex1,usX-12,usY-12,25,25);
     }else if(sex==2){
        image(sex2,usX-12,usY-12,25,25);
     }
  }
  
//------------------

void user_gus(int sex,int lit1, int lit2, int lit3, int lit4, int lit5,int lit6,int lit7,int lit8,int lit9,int lit10,int lit11,int lit12,int lit13,int edad, int gusto,int pareja){
  stroke(0,90); 
  strokeWeight(0.7);
  int[] nombre = {lit1,lit2,lit3,lit4,lit5,lit6,lit7,lit8,lit9,lit10,lit11,lit12,lit13};
    
  for(int u=0; u<=12; u++){ 
      if(nombre[u]==1){ L[u]++; 
          if(sex==1){
            sex_h[u]++;stroke(215,100,100,190);
            if(pareja==1){casa_h[u]++;}else if(pareja==0){solte_h[u]++;} 
            if(gusto==1){hete_h[u]++;}else if(gusto==2){bi_h[u]++;}else if(gusto==3){homo_h[u]++;}   
          }else if(sex==2){
            sex_m[u]++;stroke(325,100,100,190);
            if(pareja==1){casa_m[u]++;}else if(pareja==0){solte_m[u]++;}
            if(gusto==1){hete_m[u]++;}else if(gusto==2){bi_m[u]++;}else if(gusto==3){homo_m[u]++;}
          }  

          line(usX,usY,gX[u],gY[u]);  

 
      }
      
  }
  


}//--/user_gus--



}//--------------------------------------------CLASS Perfil----------------------------------------------














/*if(L[0]>0 && mouseX<gX[0]+r_i && mouseX>gX[0]-r_i && mouseY<gY[0]+r_i && mouseY>gY[0]-r_i){ perfil(0,"En 4");}
else if(L[1]>0 && mouseX<gX[1]+r_i && mouseX>gX[1]-r_i && mouseY<gY[1]+r_i && mouseY>gY[1]-r_i){ perfil(1,"La 69");}
else if(L[2]>0 && mouseX<gX[2]+r_i && mouseX>gX[2]-r_i && mouseY<gY[2]+r_i && mouseY>gY[2]-r_i){ perfil(2,"El Abrazo");}
else if(L[3]>0 && mouseX<gX[3]+r_i && mouseX>gX[3]-r_i && mouseY<gY[3]+r_i && mouseY>gY[3]-r_i){ perfil(3,"Boca Abajo");}
else if(L[4]>0 && mouseX<gX[4]+r_i && mouseX>gX[4]-r_i && mouseY<gY[4]+r_i && mouseY>gY[4]-r_i){ perfil(4,"Cabalgada");}
else if(L[5]>0 && mouseX<gX[5]+r_i && mouseX>gX[5]-r_i && mouseY<gY[5]+r_i && mouseY>gY[5]-r_i){ perfil(5,"La Fusion");}
else if(L[6]>0 && mouseX<gX[6]+r_i && mouseX>gX[6]-r_i && mouseY<gY[6]+r_i && mouseY>gY[6]-r_i){ perfil(6,"Guarda Espalda");}
else if(L[7]>0 && mouseX<gX[7]+r_i && mouseX>gX[7]-r_i && mouseY<gY[7]+r_i && mouseY>gY[7]-r_i){ perfil(7,"El Jinete");}
else if(L[8]>0 && mouseX<gX[8]+r_i && mouseX>gX[8]-r_i && mouseY<gY[8]+r_i && mouseY>gY[8]-r_i){ perfil(8,"La Flautita");}
else if(L[9]>0 && mouseX<gX[9]+r_i && mouseX>gX[9]-r_i && mouseY<gY[9]+r_i && mouseY>gY[9]-r_i){ perfil(9,"El Misionero");}
else if(L[10]>0 && mouseX<gX[10]+r_i && mouseX>gX[10]-r_i && mouseY<gY[10]+r_i && mouseY>gY[10]-r_i){ perfil(10,"La Mitad mas Uno");}
else if(L[11]>0 && mouseX<gX[11]+r_i && mouseX>gX[11]-r_i && mouseY<gY[11]+r_i && mouseY>gY[11]-r_i){ perfil(11,"El Perrito");}
else if(L[12]>0 && mouseX<gX[12]+r_i && mouseX>gX[12]-r_i && mouseY<gY[12]+r_i && mouseY>gY[12]-r_i){ perfil(12,"El Sorbete");}
else{cargar_datos(); }*/





/*
 fill(0,10);rect(240,gY1+70,630,150);     
    for(int a=4;a<=car_ga.length-1;a++){ 
     valor =int(split(car_ga[a], ","));
     int ed_x=100+150;
     float[] us_x=new int[car_ga.length];
     float[] us_y=new int[car_ga.length];
     us_x[a]=constrain(usX[a],0,620);
     us_y[a]=constrain(usY[a],0,140);

     if(valor[2]==1){
     image(sex1,220+us_x[a],us_y[a]+gY1+50,20,20);
     }else if(valor[2]==2){
     image(sex2,220+us_x[a],us_y[a]+gY1+50,20,20);
     }
   
    }





  if(gX[c]+250<width){ 
    gX1=20;   //fondoX
    gX2=30;  //titulo poses
    gX3=30; 
  }
  if(gY[c]+200<height){ 
    gY1=20;    //fondoY
    gY2=40;   //titulo poses
    gY3=90;
  }
  if(gX[c]+250>width){ 
    gX1=-270;  //fondoX
    gX2=-260;  //titulo poses
    gX3=-260;
  }
  if(gY[c]+200>height){ 
    gY1=-180;  //fondoY
    gY2=-160;  //titulo poses
    gY3=-140;
  }
  
 fill(100);rect(gX[c]+gX1+1,gY[c]+gY1+1,170,200,10);
  fill(360);rect(gX[c]+gX1,gY[c]+gY1,170,200,10);
  fill(0);
  textFont(myFont2,13);
  text(poses,gX[c]+gX2,gY[c]+gY2);textFont(myFont,11);

  int casa=casa_h[c]+casa_m[c];
  int solte=solte_h[c]+solte_m[c];

  int p_h=sex_h[c]*100;
  int p_m=sex_m[c]*100;
  int porcen_h=round(p_h/sex_total[c]);
  int porcen_m=round(p_m/sex_total[c]);
  
  fill(215,100,100);
  image(sex1,gX[c]+gX3-10,gY[c]+gY3-45,35,35);text(porcen_h+"%",gX[c]+gX3+20,gY[c]+gY3-20);
  text("Hombres: .. "+sex_h[c],gX[c]+gX3,gY[c]+gY3);
  text("Casados: .. "+casa_h[c],gX[c]+gX3,gY[c]+gY3+20);
  text("Solteros: ... "+solte_h[c],gX[c]+gX3,gY[c]+gY3+35);
  text("Heterosexuales: "+hete_h[c],gX[c]+gX3,gY[c]+gY3+55);
  text("Bisexuales: "+bi_h[c],gX[c]+gX3,gY[c]+gY3+70);
  text("Homosexuales: "+homo_h[c],gX[c]+gX3,gY[c]+gY3+85);
  
  fill(325,100,100);  
  image(sex2,gX[c]+gX3+90,gY[c]+gY3-45,35,35);text(porcen_m+"%",gX[c]+gX3+120,gY[c]+gY3-20);
  text("Mujeres: .... "+sex_m[c],gX[c]+gX3+100,gY[c]+gY3);
  text("Casadas: .. "+casa_m[c],gX[c]+gX3+100,gY[c]+gY3+20);
  text("Solteras: ... "+solte_m[c],gX[c]+gX3+100,gY[c]+gY3+35); 
  text("Heterosexuales: "+hete_h[c],gX[c]+gX3+100,gY[c]+gY3+55);
  text("Bisexuales: "+bi_h[c],gX[c]+gX3+100,gY[c]+gY3+70);
  text("Homosexuales: "+homo_h[c],gX[c]+gX3+100,gY[c]+gY3+85);






*/

