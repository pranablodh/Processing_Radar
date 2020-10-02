int iAngle = 0;
int iDistance = 0;
float pixsDistance = 0.0;

boolean flag = true;

int angle[] = new int[181];
int distance[] = new int[181];


void setup()
{
  fullScreen();
  orientation(LANDSCAPE);   
}

void draw()
{
  background(0);
  noStroke();
  fill(0,4); 
  rect(0, 0, width, 1010); 
  drawRadar();
  drawLine();
  drawObject();
  drawText();
  
  iDistance = (int)random(0, 100);
  
  if(flag)
  {
    iAngle++;
    angle[iAngle] = iAngle;
    distance[iAngle] = iDistance;
  }
  
  else
  {
    iAngle--;
    
    angle[iAngle] = iAngle;
    distance[iAngle] = iDistance;
  }
  
  if(iAngle >= 180)
  {
    flag = false;
  }
  
  else if(iAngle == 0)
  {
    flag = true;
  }
  
  delay(50);
}

void drawRadar() 
{
  pushMatrix();
  translate(960, 1000); // moves the starting coordinats to new location
  noFill();
  strokeWeight(2);
  stroke(98, 245, 31);
  // draws the arc lines
  arc(0, 0, 1800, 1800, PI, TWO_PI);
  arc(0, 0, 1400, 1400, PI, TWO_PI);
  arc(0, 0, 1000, 1000, PI, TWO_PI);
  arc(0, 0, 600, 600, PI, TWO_PI);
  // draws the angle lines
  line(-960, 0, 960, 0);
  line(0, 0, -960 * cos(radians(30)), -960 * sin(radians(30)));
  line(0, 0, -960 * cos(radians(60)), -960 * sin(radians(60)));
  line(0, 0, -960 * cos(radians(90)), -960 * sin(radians(90)));
  line(0, 0, -960 * cos(radians(120)), -960 * sin(radians(120)));
  line(0, 0, -960 * cos(radians(150)), -960 * sin(radians(150)));
  line(-960 * cos(radians(30)), 0, 960 , 0);
  popMatrix();
}

void drawLine() 
{
  pushMatrix();
  strokeWeight(4);
  stroke(30, 250, 60);
  translate(960, 1000);
  line(0, 0, 950 * cos(radians(iAngle)), -950 * sin(radians(iAngle))); 
  popMatrix();
}

void drawObject() 
{ 
  
  for(int i = 0; i < angle.length; i++)
  {
    pushMatrix();
    strokeWeight(10);
    translate(960, 1000);
    pixsDistance = distance[i] * 22.5; 
    stroke(255, 10, 10);
    textSize(15);
    fill(98, 245, 60);
    if(distance[i] < 40)
    {
      text("(" + angle[i] + "°, " + distance[i] + "cm)", pixsDistance * cos(radians(angle[i])), - pixsDistance * sin(radians(angle[i])) - 15.0);
      point(pixsDistance * cos(radians(angle[i])), - pixsDistance * sin(radians(angle[i])));
    }
    popMatrix();
  }
}

void drawText() 
{   
  pushMatrix();
  fill(0,0,0);
  noStroke();
  rect(0, 1010, width, 1080);
  fill(98,245,31);
  textSize(25);
  text("10cm",1180,990);
  text("20cm",1380,990);
  text("30cm",1580,990);
  text("40cm",1780,990);
  textSize(40);
  text("Angle: " + iAngle +" °", 1050, 1050);
  
  if(iDistance < 40)
  {
    text("Distance: " + iDistance +" cm", 1380, 1050);
    text("Object: Detected" , 240, 1050);
  }
  
  else
  {
    text("Distance: " , 1380, 1050);
    text("Object: Not Detected" , 240, 1050);
  }
  
  textSize(25);
  fill(98,245,60);
  translate(961+960*cos(radians(30)),982-960*sin(radians(30)));
  rotate(-radians(-60));
  text("30°",0,0);
  resetMatrix();
  translate(954+960*cos(radians(60)),984-960*sin(radians(60)));
  rotate(-radians(-30));
  text("60°",0,0);
  resetMatrix();
  translate(945+960*cos(radians(90)),990-960*sin(radians(90)));
  rotate(radians(0));
  text("90°",0,0);
  resetMatrix();
  translate(935+960*cos(radians(120)),1003-960*sin(radians(120)));
  rotate(radians(-30));
  text("120°",0,0);
  resetMatrix();
  translate(940+960*cos(radians(150)),1018-960*sin(radians(150)));
  rotate(radians(-60));
  text("150°",0,0);
  popMatrix(); 
}
