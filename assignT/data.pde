class Data
{
  float year;
  float usage;
  
  
  Data(float year, float usage)
  {
    
    this.usage = usage;
    this.year = year;
  }
 
 Data(String lines)
 {
     String[] line = lines.split(",");
     year = (Float.parseFloat(line[0]));
     usage = (Float.parseFloat(line[1]));
     

 }
}


