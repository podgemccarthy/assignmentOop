void setup()
{
  bg = loadImage("backround.jpg");
   size(500,500);
   loaddata();
  // drawdata();
   loaddata2();
    for (int i = 0 ; i <15 ; i ++)
  {
    colors[i] = color(random(0, 200), random(0, 200), random(0,200));
  }  

}  
ArrayList<data> dataset = new ArrayList<data>();
ArrayList<Data2> dataset2 = new ArrayList<Data2>();
PImage bg;
color[] colors = new color[20];
void loaddata()
{
  String[] lines = loadStrings("dataset.csv");
  
  for (String line:lines)
  {
    String[] elements = line.split(",");
    data info = new data();//another class variable
    info.year = Float.parseFloat(elements[0]);
    info.usage =Float.parseFloat(elements[1]);
    dataset.add(info);
    
    
  }
}
 void loaddata2()
{
  String[] lines = loadStrings("dataset2.csv");
  
  for (String line:lines)
  {
    String[] elements = line.split(",");
    Data2 info = new Data2();//another class variable
    info.year = Float.parseFloat(elements[0]);
    info.usage =Float.parseFloat(elements[1]);
    dataset2.add(info);
    
    
  }
}
  
void menu()
{
    background (bg);
    stroke(0);
    fill(0);
    textSize(15);
    text ("Please press 0 for Ireland internet usage bar chart.", 30,height*0.09);
    text ("Please press 1 for USA internet usage bar chart.", 30,height*0.15);
    text ("Please press 2 to return to this menu !!!", 30,height*0.21);

}

color randomColor()
{
  return color(random(0, 255), random(0, 255), random(0, 255));
}

void drawdata()
{
  background (112,112,112);
  float scalefactor = height/79.69;//this should be max
  float min = 39.00;//this should be min
  float barwidth;
  barwidth = width/dataset.size();
    for (int i = 0; i<dataset.size(); i++)
        {
            //color colour = color(random(0, 200), random(0, 200), random(0, 200));
            data info = dataset.get(i);
            stroke(255);
            fill(colors[i]);
            rect(barwidth*i,height ,barwidth,-(float)dataset.get(i).usage*scalefactor);
            stroke(0,0,255);
            fill(0,0,255);
            textSize(15);
            text((int)dataset.get(i).year, (barwidth*i), height-30 );
            text((int)dataset.get(i).usage, (barwidth*i)+10, height -70 );
            
            //need to figyre out the y in my rect
        }
     textSize(45);
     text ("Ireland", 10,height*0.09); 
     textSize(15);
     text("usage per 100",0,height-90);
     text("years",10,height-50);

}
void drawdata2()
{
  background (112,112,112);
  float scalefactor = height/87.4;//this should be max
  float min = 39.00;//this should be min
  float barwidth;
  barwidth = width/dataset2.size();
    for (int i = 0; i<dataset2.size(); i++)
        {
            //color colour = color(random(0, 200), random(0, 200), random(0, 200));
            Data2 info = dataset2.get(i);
            stroke(0);
            fill(colors[i]);
            rect(barwidth*i,height ,barwidth,-(float)dataset2.get(i).usage*scalefactor);
            stroke(0,0,255);
            fill(0,0,255);
            textSize(15);
            text((int)dataset2.get(i).year, (barwidth*i), height-30 );
            text((int)dataset2.get(i).usage, (barwidth*i)+10, height -70 );
            
            //need to figyre out the y in my rect
        }
     textSize(45);
     text ("USA", 10,height*0.09);
     textSize(15);
     text("usage per 100",0,height-90);
     text("years",10,height-50);

}

int mode =2;
 // test1

void draw()
{
  switch (mode)
  {    
    case 0:
    {
        drawdata();    
    }
    break;
    case 1:
    {
        drawdata2();    
    }
    break;
    case 2:
    {
        menu();    
    }
    break;
  }
}
void keyPressed()
{
  if (key >= '0' && key <='9')
  {
    mode = key - '0';
  }
  println(mode);
}

  
