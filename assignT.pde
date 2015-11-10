void setup()
{
   size(500,500);
   loaddata();
    drawdata();
}  
ArrayList<data> dataset = new ArrayList<data>();

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
// 
void drawdata()
{
  float scalefactor = height/79.69;//this should be max
  float min = 39.00;//this should be min
  float barwidth;
  barwidth = width/dataset.size();
    for (int i = 0; i<dataset.size(); i++)
        {
            color colour = color(random(0, 200), random(0, 200), random(0, 200));
            data info = dataset.get(i);
            stroke(0);
            fill(colour);
            rect(barwidth*i,height ,barwidth,-(float)dataset.get(i).usage*scalefactor);
            stroke(255);
            fill(255);
            textSize(15);
            text((int)dataset.get(i).year, (barwidth*i)+10, height-30 );
            text(dataset.get(i).usage, (barwidth*i), height -70 );
            
            //need to figyre out the y in my rect
        }
       
     text("usage per 100",0,height-90);
     text("years",10,height-50);

}
void draw()
{
 
}


  
