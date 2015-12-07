public class Data2
{
  float year;
  float usage;
 
   Data2(float year, float usage)
  {
    
    this.usage = usage;
    this.year = year;
  }
 
 Data2(String lines)
 {
     String[] line = lines.split(",");
     year = (Float.parseFloat(line[0]));
     usage = (Float.parseFloat(line[1]));
     
 }
     
}

