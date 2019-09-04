color FG = #111111;
color BG = #f1f1f1;
PImage img;
// import the library
import com.hamoid.*;

// create a new VideoExport-object
VideoExport videoExport;


void setup() {
  size(1240, 460);
  background(BG);
  img = loadImage("cover.jpg");
  img.resize(1240, 260);
  
  videoExport = new VideoExport(this, "myVideo.mp4");
  videoExport.setFrameRate(30);  
  videoExport.startMovie();
}

void draw() {
  background(BG);
  fill(FG);
  noStroke();
  //image(img, 125, 125);

  float ratio = float(height)/float(width);
  float tilesX = map(mouseX, 0, width, 100, 400);
  float tilesY = ratio*tilesX;
  float tileSize = width / tilesX;

  for ( int y=0; y<img.height; y+=tileSize) {
    for (int x=0; x<img.width; x+=tileSize) {
      color c = img.get(x, y);

      float b = map(brightness(c), 0, 255, 1, 0);

      pushMatrix();
      translate(x, y);
      rect(0, 100, b*tileSize, b*tileSize);
      popMatrix();
    }
  }
 
  videoExport.saveFrame();
}


void keyPressed() {
  if (key == 'q') {
    videoExport.endMovie();
    exit();
  }
}               
