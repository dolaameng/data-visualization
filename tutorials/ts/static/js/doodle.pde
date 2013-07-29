static class DataPoint {
	/* INSTANCE METHODS */
	// "Tea": "9.6", "Coffee": "21.7", "Milk": "32.2", "Year": "1910"
	float tea;
	float coffee;
	float milk;
	int year;
	DataPoint(int year, float tea, float coffee, float milk) {
		this.year = year;
		this.tea = tea;
		this.coffee = coffee;
		this.milk = milk;
	}
	DataPoint clone() {
		return new DataPoint(this.year, this.tea, this.coffee, this.milk);
	}
	PVector drawTea(float minx, float maxx, float miny, float maxy) {
		int yearPlot = map(this.year, minValue.year, maxValue.year, minx, maxx);
		float teaPlot = maxy - map(this.tea, minValue.tea, maxValue.tea, miny, maxy);
		fill(255, 0, 0);
		ellipse(yearPlot, teaPlot, 10, 10);
		if (dist(mouseX, mouseY, yearPlot, teaPlot) < 7) {
			fill(255, 0, 0);
			text(""+this.year, yearPlot, teaPlot - 7);
			js.displayPointInfor(year, coffee, milk, tea);
		}
		return new PVector(yearPlot, teaPlot);
	}
	/* GROUP BEHAVIOR - STATIC METHODS */
	static ArrayList<DataPoint> data = new ArrayList<DataPoint>();
	static DataPoint minValue = null;
	static DataPoint maxValue = null;
	static void addPoint(DataPoint dpt) {
		data.add(dpt);
		if (minValue == null || maxValue == null) {
			minValue = dpt.clone();
			maxValue = dpt.clone();
		} else {
			minValue.year = min(minValue.year, dpt.year);
			minValue.coffee = min(minValue.coffee, dpt.coffee);
			minValue.tea = min(minValue.tea, dpt.tea);
			minValue.milk = min(minValue.milk, dpt.milk);

			maxValue.year = max(maxValue.year, dpt.year);
			maxValue.coffee = max(maxValue.coffee, dpt.coffee);
			maxValue.tea = max(maxValue.tea, dpt.tea);
			maxValue.milk = max(maxValue.milk, dpt.milk);
		}
	}
	static void drawAllTea(float minx, float maxx, float miny, float maxy) {
		PVector xy0 = data.get(0).drawTea();
		for (i = 1; i < data.size(); ++i) {
			PVector xy = data.get(i).drawTea(minx, maxx, miny, maxy);
			stroke(255);
			line(xy0.x, xy0.y, xy.x, xy.y);
			xy0 = xy;
		}
	}
}

void addPoint(int year, float tea, float coffee, float milk) {
	DataPoint.addPoint(new DataPoint(year, tea, coffee, milk));
}

void setup() {
	size(800, 400);
	background(0);
}

void draw() {
	background(255);
	fill(0);
	stroke(0, 255, 0);
	rect(0, 0, width / 2, height / 2);
	text("Tea Plot", width/4, height/2 + 20);
	if (DataPoint.data.size() > 0) {
		DataPoint.drawAllTea(0, width / 2, 0, height / 2);
	}
}