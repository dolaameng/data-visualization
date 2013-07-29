/* @pjs preload="static/img/map.png" */
PImage usmap;
ArrayList<Location> locations;

// NOT IMPLEMENTED YET - PrintWriter writer = createWriter("hello.txt");

class Location {
	String name;
	PVector xy;
	int radius;
	Location(String name, int x, int y) {
		this.name = name;
		this.xy = new PVector(x, y);
		this.radius = 5;
	}
	void draw() {
		// draw the dot
		noStroke()
		fill(255, 0, 0);
		ellipse(xy.x, xy.y, radius * 2, radius * 2); 
		// mouse interaction
		if (dist(mouseX, mouseY, xy.x, xy.y) < radius + 2) {
			fill(0, 0, 255);
			text(this.name, xy.x, xy.y - radius - 2);
		}
	}
}

void setup() {
	size(640, 400);
	background(0);
	usmap = loadImage("static/img/map.png");
	locations = new ArrayList<Location>();
}

void draw() {
	background(255);
	image(usmap, 0, 0);
	for (Location loc : locations) {
		loc.draw();
	}
}

// loadStrings from local file WORKS
//String loc_texts = loadStrings("static/js/data/locations.tsv");
// loadStrings from remote call WORKS
String loc_texts = loadStrings("getlocs");
println(loc_texts);

void addLocation(String name, int x, int y) {
	locations.add(new Location(name, x, y));
}

void keyTyped() {
	println(int(key));
	if (key == 115) {
		saveStrings("hello.txt", {"hello world", "good morning"});
	}
}


