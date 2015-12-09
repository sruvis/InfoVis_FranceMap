float minX, maxX, minY, maxY, minSurface, maxSurface, minAltitude, maxAltitude, x[], y[], population[];
int totalCount, minPopulation, maxPopulation, minPopulationToDisplay=1000;
color fillVal = color(126);
Place[] p;



void setup()
{
  size(800,800);
   
  readData();
  
}

void draw()
{
  background(0);
  //color black=color(255);
  
  
  for(int i=0;i<totalCount;++i)
  {
    //set((int)mapX(p[i].x),(int)mapY(p[i].y),black);
    if(p[i].population>minPopulationToDisplay){
      p[i].draw();
      if(p[i].dispName){
        p[i].drawName();
      }
    }
  }
  

}

void readData()
{
  
  String[] lines = loadStrings("villes.tsv");
  //println(lines); //debug
  parseInfo(lines[0]); // read the header line
  x=new float[totalCount];
  y=new float[totalCount];
  population=new float[totalCount];
  p = new Place[totalCount];
  for (int i = 0; i < totalCount; i++) {
    String placeData[] = split(lines[i+2], TAB);
    p[i] = new Place(
      placeData[4],
      float(placeData[1]),
      float(placeData[2]),
      float(placeData[5])
    );
  }
}


void parseInfo(String line) 
{
  String infoString = line.substring(2); // remove the #
  String[] infoPieces = split(infoString, ',');
  totalCount = int(infoPieces[0]);
  minX = float(infoPieces[1]);
  maxX = float(infoPieces[2]);
  minY = float(infoPieces[3]);
  maxY = float(infoPieces[4]);
  minPopulation = int(infoPieces[5]);
  maxPopulation = int(infoPieces[6]);
  minSurface = float(infoPieces[7]);
  maxSurface = float(infoPieces[8]);
  minAltitude = float(infoPieces[9]);
  maxAltitude = float(infoPieces[10]);
}

float mapX(float x)
{
  return map(x,minX,maxX,0,800);
}

float mapY(float y)
{
  return map(y,minY,maxY,800,0);
}
  
void keyPressed( ) 
{
  if(keyCode==DOWN){
    minPopulationToDisplay = minPopulationToDisplay - 10000;
  }
  if(keyCode==UP){
    minPopulationToDisplay = minPopulationToDisplay + 10000;
  }
  redraw();
}

void mouseMoved(){
  //println(mouseX +" , "+mouseY);
  for(int i=0;i<totalCount;i++)
  {
    if(p[i].population>100000 && p[i].contains(mouseX, mouseY)){
        //println("true");
        p[i].dispName = true;     
    }
    else{
      p[i].dispName = false;
    }
  }
  redraw();
}
