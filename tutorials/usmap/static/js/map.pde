/* @pjs preload="http://benfry.com/writing/map/map.png" */
PImage usmap;
ArrayList<Location> locs = new ArrayList<Location>();

class Location {
	PVector xy;
	String name;
	Location(String name, int x, int y) {
		this.xy = new PVector(x, y);
		this.name = name;
	}
}

void addLocation(String name, int x, int y) {
	locs.add(new Location(name, x, y));
}

void setup() {
  size(640, 400);
  usmap = loadImage("http://benfry.com/writing/map/map.png");
}


void draw() {
  background(255);
  image(usmap, 0, 0);
  for (Location loc : locs) {
  	ellipse(loc.xy.x, loc.xy.y, 10, 10);
  }
}

