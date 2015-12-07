import controlP5.*;


// arraylists and global variables
ArrayList<Data> dataset = new ArrayList<Data>();
ArrayList<Data2> dataset2 = new ArrayList<Data2>();
PImage bg;
ControlP5 controlP5;
color[] colors = new color[50];

float radius;
int buttonsize=120;
int button = width-buttonsize;
float centX, centY;
int mode =0;
 
void setup()
{
   bg = loadImage("wifilogo.jpg");
   size(800,800);
   loaddata();
   loaddata2();
   for (int i = 0 ; i <40 ; i ++)
   {
      colors[i] = color(random(0, 200), random(0, 200), random(0,200));
   }  
  radius = height/2;
  centX = height * 0.5f;
  centY = height * 0.5f;
  strokeWeight(10);
  

} // end void setup()




void loaddata()
{
  String[] lines = loadStrings("dataset.csv");
  
  for (int i = 0; i<lines.length; i++)
  {  
      Data Data = new Data(lines[i]);
      dataset.add(Data);
       
  }// end for loop
 
  
 
}// end loaddata()

 void loaddata2()
{
  String[] lines = loadStrings("dataset2.csv");
  
  for (int i = 0; i<lines.length; i++)
  {  
      Data2 Data2 = new Data2(lines[i]);
      dataset2.add(Data2);
       
  }//end for loop
    
  
}// end loaddata2()


 void stats()
  {  
    background(0);
  
  float max = dataset.get(0).usage;
  float min = dataset.get(0).usage;
  float sum = 0.00f;
  float avg = 0.00f;
  
  float max2 = dataset.get(0).usage;
  float min2 = dataset.get(0).usage;
  float sum2 = 0.00f;
  float avg2 = 0.00f;
 
 
  float correlation;

  
  for(int i = 0; i<dataset.size(); i++)
  {
    if( dataset.get(i).usage < min)
    {
        min = dataset.get(i).usage;
    
    }//end if
    
    if( dataset.get(i).usage > max)
    {
        max = dataset.get(i).usage;
    
    }//end if
    
    sum +=dataset.get(i).usage;
      
  }//end for
  
  avg = sum/dataset.size();
  
  for(int i = 0; i<dataset2.size(); i++)
  {
    if( dataset2.get(i).usage < min)
    {
        min2 = dataset2.get(i).usage;
    
    }//end if
    
    if( dataset2.get(i).usage > max2)
    {
        max2 = dataset2.get(i).usage;
    
    }//enf if
    
    sum2 +=dataset2.get(i).usage;
      
  }//end for
  
  avg2 = sum2/dataset2.size();
  
  correlation = (avg2/avg)*10;

  
  
    stroke(0);
    fill(0,0,255);
    textSize(20);
    
    
    text ("The average internet usage for Ireland is  " + avg, 30,height*0.09);
    text ("The minimum internet usage for ireland is  " + min, 30,height*0.15);
    text ("The maximum usage for ireland is "+ max, 30,height*0.21);
    
    text ("The average intenet usage for USA is  " + avg2, 30,height*0.3);
    text ("The minimum internet usage for USA is  " + min2, 30,height*0.36);
    text ("The maximum usage for USA is "+ max2, 30,height*0.42);
    textSize(30);
    
    text ("CONCLUSION: ",width*0.35,height/2);
    textSize(20);
    text ("The average Internet usage in USA is " + correlation +"%  ",30,height*0.56);
    text("greater than Ireland's Interent usage.",30,height*0.6);
    text("THANK YOU",width*0.35,height*0.68);
  
    
}// end void stats

 
void menu()
{
    
  //background images
  background (0);  
  smooth();
  frameRate(30);
  
  //control p5 variable
  controlP5 = new ControlP5(this);  
  ControlFont cf1 = new ControlFont(createFont("Arial", 13));

 //creating the buttons
  createButton("MENU", 0,width-buttonsize, 5, color(255, 0, 0), cf1);
  createButton("IRISH BARCHART", 1, width-buttonsize, 55, color(255, 0, 0), cf1);
  createButton("USA BARCHART", 2,  width-buttonsize, 105, color(255, 0, 0), cf1);
  createButton("IRISH PIECHART", 3, width-buttonsize, 155, color(255, 0, 0), cf1);
  createButton("USA PIECHART", 4, width-buttonsize, 205, color(255, 0, 0), cf1);
  createButton("IRISH DONUT", 5, width-buttonsize, 255, color(255, 0, 0), cf1);
  createButton("USA DONUT", 6, width-buttonsize, 305, color(255, 0, 0), cf1);
  createButton("STATS", 7, width-buttonsize, 355, color(255, 0, 0), cf1);
   
 }//end void menu()


// control p5
Button createButton(String theName, int theValue, int theX, int theY, color theColor, ControlFont theFont) 
{
  Button b = controlP5.addButton(theName, theValue, theX, theY, 120, 39);
  b.setColorActive(theColor); // color for mouse-over
  b.setColorBackground(color(900)); // default color
  b.getCaptionLabel().setFont(theFont);
  return b;
}// end Button createbutton()

color randomColor()
{
  return color(random(0, 255), random(0, 255), random(0, 255));
}// end color randomcolor()

void drawdata()
{
  
  background (255);
  float scalefactor = height/79.69;//this should be max
  float min = 39.00;//this should be min
  float barwidth;
  
  barwidth = (width-buttonsize)/dataset.size();
    for (int i = 0; i<dataset.size(); i++)
        {
            //color colour = color(random(0, 200), random(0, 200), random(0, 200));
            //Data Data = dataset.get(i).usage;
            stroke(0);
            fill(colors[i]);
            rect(barwidth*i,height ,barwidth,-(float)dataset.get(i).usage*scalefactor);
            stroke(0);
            fill(255);
            textSize(15);
            text((int)dataset.get(i).year, (barwidth*i), height-30 );
            text((int)dataset.get(i).usage, (barwidth*i)+10, height -70 );
            
           
        }// end for
       fill(0,0,255);
       
     textSize(40);
     text ("Ireland", 10,height*0.09); 
     textSize(15);
     fill(255);
     text("usage per 100",0,height-90);
     text("years",10,height-50);

}//end drawdata
void drawdata2()
{
  background (255);
  float scalefactor = height/87.4;//this should be max
  float min = 39.00;//this should be min
  float barwidth;
  barwidth = (width-buttonsize)/dataset2.size();
    for (int i = 0; i<dataset2.size(); i++)
        {
            //color colour = color(random(0, 200), random(0, 200), random(0, 200));
            //Data2 info = dataset2.get(i);
            stroke(0);
            fill(colors[i+5]);
            rect(barwidth*i,height ,barwidth,-(float)dataset2.get(i).usage*scalefactor);
            stroke(0,0,255);
            fill(255);
            textSize(15);
            text((int)dataset2.get(i).year, (barwidth*i), height-30 );
            text((int)dataset2.get(i).usage, (barwidth*i)+10, height -70 );
            
            
        }// end for
     fill(0,0,255);
     textSize(40);
     text ("USA", 10,height*0.09);
     
     textSize(15);
     fill(255);
     text("usage per 100",0,height-90);
     text("years",10,height-50);

}// end void drawdata2

void piechart()
{
  background(255);
  float sum = 0.0f;
  for (int i =0; i<dataset.size(); i++)
  {
    sum+=dataset.get(i).usage;
    
  }// end for
   float toMouseX = mouseX - radius;
  float toMouseY = mouseY - radius;  
  float angle = atan2(toMouseY, toMouseX);
  if (angle < 0)
  {
    angle = map(angle, -PI, 0, PI, TWO_PI);
  }//end if
  println(angle);
  // The last angle
  float last = 0;
  
  float cumulative = 0;
  float thetaPrev = 0;
  
 
  for(int i = 0 ; i < dataset.size() ; i ++)
  {
    cumulative += dataset.get(i).usage;
    // Calculate the surrent angle
    float current = map(cumulative, 0, sum, 0, TWO_PI);
    // Draw the pie segment
    stroke(255);
    fill(colors[i]);
 
     float x = 55;
     textSize(20);
   
    text("Years",0,height-150);
    text((int)dataset2.get(i).year, x*i, height-100);
    text("usage per 100",0,height-60);
    text((int)dataset2.get(i).usage, x*i, height-20);
    
    float r = radius;
    // If the mouse angle is inside the pie segment
   
    if (angle > last && angle < current)
    {
      r = radius * 1.5f;
    }//end if
    
    // Draw the arc
    arc(
       radius
       ,radius
       ,r
       ,r
       , last
       , current
       );
    last = current;       
  }//end for
  fill(0,0,255);
  textSize(45);
  text ("Ireland", 10,height*0.09); 
  textSize(20);
  stroke(255);
  line(radius, radius, mouseX, mouseY);
   
}

void piechart2()
{
  background(255);
  float sum = 0.0f;
  for (int i =0; i<dataset2.size(); i++)
  {
    sum+=dataset2.get(i).usage;
   
  }// end for
   float toMouseX = mouseX - radius;
  float toMouseY = mouseY - radius;  
  float angle = atan2(toMouseY, toMouseX);
  if (angle < 0)
  {
    angle = map(angle, -PI, 0, PI, TWO_PI);
  }//end if
  println(angle);
  // The last angle
  float last = 0;
  // The cumulative sum of the dataset 
  float cumulative = 0;
  
  for(int i = 0 ; i < dataset2.size() ; i ++)
  {
    cumulative += dataset2.get(i).usage;
    // Calculate the surrent angle
    float current = map(cumulative, 0, sum, 0, TWO_PI);
    // Draw the pie segment
    stroke(255);
    fill(colors[i]);
    
    float x = 55;
    textSize(20);
   
    text("Years",0,height-150);
    text((int)dataset.get(i).year, x*i, height-100);
    text("usage per 100",0,height-60);
    text((int)dataset.get(i).usage, x*i, height-20);
    float r = radius;
    // If the mouse angle is inside the pie segment
    if (angle > last && angle < current)
    {
      r = radius * 1.5f;
    }//end if
    
    // Draw the arc
    arc(
       radius
       ,radius
       ,r
       ,r
       , last
       , current
       );
    last = current; 
    
  }//end for
     
     fill(0,0,255);
     textSize(45);
     text ("USA", 10,height*0.09);
     stroke(255);
     line(radius, radius, mouseX, mouseY);
}// end piechart 2

void donut()
{
  background(255);
  float sum = 0.0f;
  for (int i =0; i<dataset.size(); i++)
  {
    sum+=dataset.get(i).usage;
    
  }// end for
   float toMouseX = mouseX - radius;
  float toMouseY = mouseY - radius;  
  float angle = atan2(toMouseY, toMouseX);
  if (angle < 0)
  {
    angle = map(angle, -PI, 0, PI, TWO_PI);
  }//end if
  println(angle);
  // The last angle
  float last = 0;
  
  float cumulative = 0;
  float thetaPrev = 0;
  
 
  for(int i = 0 ; i < dataset.size() ; i ++)
  {
    cumulative += dataset.get(i).usage;
    // Calculate the surrent angle
    float current = map(cumulative, 0, sum, 0, TWO_PI);
    // Draw the pie segment
    stroke(255);
    fill(colors[i]);
 
     float x = 55;
     textSize(20);
   
    text("Years",0,height-150);
    text((int)dataset2.get(i).year, x*i, height-100);
    text("usage per 100",0,height-60);
    text((int)dataset2.get(i).usage, x*i, height-20);
    
    float r = radius;
    // If the mouse angle is inside the pie segment
   
    if (angle > last && angle < current)
    {
      r = radius * 1.5f;
    }//end if
    
    // Draw the arc
    arc(
       radius
       ,radius
       ,r
       ,r
       , last
       , current
       );
    last = current;       
  }//end for
  
  fill(255);
  ellipse(radius,radius,radius/2,radius/2);
  fill(0,0,255);
  textSize(45);
  text ("Ireland", 10,height*0.09); 
  textSize(20);
  stroke(255);
  line(radius, radius, mouseX, mouseY);
}
void donut2()
{

  background(255);
  float sum = 0.0f;
  for (int i =0; i<dataset2.size(); i++)
  {
    sum+=dataset2.get(i).usage;
   
  }// end for
   float toMouseX = mouseX - radius;
  float toMouseY = mouseY - radius;  
  float angle = atan2(toMouseY, toMouseX);
  if (angle < 0)
  {
    angle = map(angle, -PI, 0, PI, TWO_PI);
  }//end if
  println(angle);
  // The last angle
  float last = 0;
  // The cumulative sum of the dataset 
  float cumulative = 0;
  
  for(int i = 0 ; i < dataset2.size() ; i ++)
  {
    cumulative += dataset2.get(i).usage;
    // Calculate the surrent angle
    float current = map(cumulative, 0, sum, 0, TWO_PI);
    // Draw the pie segment
    stroke(255);
    fill(colors[i]);
    
    float x = 55;
    textSize(20);
   
    text("Years",0,height-150);
    text((int)dataset.get(i).year, x*i, height-100);
    text("usage per 100",0,height-60);
    text((int)dataset.get(i).usage, x*i, height-20);
    float r = radius;
    // If the mouse angle is inside the pie segment
    if (angle > last && angle < current)
    {
      r = radius * 1.5f;
    }//end if
    
    // Draw the arc
    arc(
       radius
       ,radius
       ,r
       ,r
       , last
       , current
       );
    last = current; 
    
  }//end for
  
  
     fill(255);
     ellipse(radius,radius,radius/2,radius/2);   
     textSize(45);
     fill(0,0,255);
     text ("USA", 10,height*0.09);
     stroke(255);
     line(radius, radius, mouseX, mouseY);
}// end donut2





void draw()
{
  switch (mode)
  {    
    case 0:
    {
        menu() ;    
    }
    break;
    case 1:
    {
        drawdata();   
    }
    break;
    case 2:
    {
        drawdata2(); 
    }
    break;
     case 3:
    {
        piechart();    
    }
    break;
  
  case 4:
    {
        piechart2();    
    }
    break;
    case 5:
    {
        donut();    
    }
    break;
    
    case 6:
    {
        donut2();    
    }
    break; 
   
   case 7:
    {
      stats();
    }
    break;       
    
    
  }//end switch
  
}//end draw
void keyPressed()
{
  if (key >= '0' && key <='9')
  {
    mode = key - '0';
  }//end if
  
}//end keyPressed
void controlEvent(ControlEvent theEvent)
{
  mode = (int)theEvent.getValue();

}// end controlEvent()
  
