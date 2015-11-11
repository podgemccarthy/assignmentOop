void setup()
{
  size(500, 500, P3D);  
  centX = width * 0.5f;
  centY = height * 0.5f;
  
  textMode(SHAPE);
  
  for (int i = 0 ; i < rainFall.length ; i ++)
  {
    colors[i] = color(random(100, 255), random(100, 255), 0);
  }  
}

float[] rainFall = {45,37,55,27,38,50,79,48,104,31,100,58}; 
String[] months = {"2004", "2005", "2006", "2007", "2008", "2009", "2010", "2011", "2012", "2013", "2014"};
color[] colors = new color[rainFall.length];

float centX, centY;




color randomColor()
{
  return color(random(0, 255), random(0, 255), random(0, 255));
}

void draw()
{    
  background(0);
  float barWidth = width / (float) months.length;
  float border = width * 0.1f;
  drawAxis(rainFall, months, 15, 150, border);
  stroke(0, 255, 255);

  
}

void drawAxis(float[] data, String[] horizLabels, int verticalIntervals, float vertDataRange, float border)
{
  stroke(200, 200, 200);
  fill(200, 200, 200);  
  
  // Draw the horizontal azis  
  line(border, height - border, width - border, height - border);
  
  float windowRange = (width - (border * 2.0f));  
  float horizInterval =  windowRange / (data.length - 1);
  float tickSize = border * 0.1f;
  
    
  for (int i = 0 ; i < data.length-1 ; i ++)
  {   
   // Draw the ticks
   float x = border + (i * horizInterval);
    line(x, height - (border - tickSize)
      , x, (height - border));
   float textY = height - (border * 0.5f);
   
   // Print the text 
   textAlign(CENTER, CENTER);
   text((int)map(i,0,10,2004,2014),x, textY);
   
  }
  
  // Draw the vertical axis
  line(border, border , border, height - border);
  
  float verticalDataGap = vertDataRange / verticalIntervals;
  float verticalWindowRange = height - (border * 2.0f);
  float verticalWindowGap = verticalWindowRange / verticalIntervals; 
  for (int i = 0 ; i <= verticalIntervals ; i ++)
  {
    float y = (height - border) - (i * verticalWindowGap);
    line(border - tickSize, y, border, y);
    float hAxisLabel = verticalDataGap * i;
        
    textAlign(RIGHT, CENTER);  
    text((int)hAxisLabel, border - (tickSize * 2.0f), y);
  }
  
  
  
}


