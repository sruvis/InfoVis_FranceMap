class Place
{
  int postalcode;
  String name;
  float x;
  float y;
  float population;
  float density;
  PFont font; //initialize font variable
  float radius;
  boolean dispName = false;
  
  
  Place(String name, float x, float y, float pop){
    this.name = name;
    this.x = x;
    this.y = y;
    this.population = pop;
  }
  
  void setup()
  {
    
    font = loadFont("FreestyleScript-Regular-48.vlw");
    textFont(font,32);
   
  }
  
  void draw()
  {
    //background(50); // clears the background in black  
    String s = "Displaying populations above "+minPopulationToDisplay;
    fill(255);
    text(s, 10, 10, 70, 90); 
    //radius = minPopulation+maxPopulation/2;
    fill(#ff0066);
    //println(population);
    radius = 50 * pow(pow(population / maxPopulation, 0.5), 1 / 0.7);
    ellipse(mapX(x), mapY(y), radius, radius);
    //println(population);
    //ellipse(mapX(x), mapY(y), population*2, population*2);
    
    
    if (mousePressed == true){
    }
  }  
  
  void drawName(){
    radius = 50 * pow(pow(population / maxPopulation, 0.5), 1 / 0.7);
    textSize(10);
    textAlign(CENTER);
   fill(#4000ff);
    text(name, mapX(x), mapY(y) - radius - 6);
    fill(255);
    ellipse(mapX(x), mapY(y), radius, radius);
    
  }

  void mousePressed( ) 
  {
  }
  void mouseDragged( ) 
  {
  }
  void mouseReleased( ) 
  {
  }
  
  boolean contains(float px, float py) {
    radius = 50 * pow(pow(population / maxPopulation, 0.5), 1 / 0.7);
    return dist(mapX(x), mapY(y), px, py) <= radius + 1;
  }
  
  float mapX(float x)
  {
    return map(x,minX,maxX,0,800);
  }
  
  float mapY(float y)
  {
    return map(y,minY,maxY,800,0);
  }
  
}
