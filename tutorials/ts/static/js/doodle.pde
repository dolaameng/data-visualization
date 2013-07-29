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
	void draw() {
		int yearPlot = map(this.year, minValue.year, maxValue.year, 0, width);
		float teaPlot = map(this.tea, minValue.tea, maxValue.tea, 0, height);
		//println("minTea="+minValue.tea+", maxTea="+maxValue.tea);
		//println("yearPlot="+yearPlot+",teaPlot="+teaPlot+", this.tea="+this.tea);
		fill(255, 0, 0);
		ellipse(yearPlot, teaPlot, 10, 10);
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
		//println("minTea="+minValue.tea+",maxTea="+maxValue.tea+",pt.tea="+dpt.tea);
		//println("minTea=" + min(minValue.tea, dpt.tea) + ",maxTea=" + max(maxValue.tea, dpt.tea) + ",pt.tea=" + dpt.tea);
	}
	/*
	static DataPoint getMinValue() {
		DataPoint minValue = data.get(0).clone();
		for (i = 1; i < data.size(); ++i) {
			DataPoint pt = data.get(i);
			if(pt.year < minValue.year) {
				minValue.year = pt.year;
			}
			if (pt.tea < minValue.tea) {
				minValue.tea = pt.tea;
			}
			if (pt.coffee < minValue.coffee) {
				minValue.coffee = pt.coffee;
			}
			if (pt.milk < minValue.milk) {
				minValue.milk = pt.milk;
			}
		}
		return minValue;
	}
	static DataPoint getMaxValue() {
		DataPoint maxValue = data.get(0).clone();
		for (i = 1; i < data.size(); ++i) {
			DataPoint pt = data.get(i);
			if(pt.year < maxValue.year) {
				maxValue.year = pt.year;
			}
			if (pt.tea < maxValue.tea) {
				maxValue.tea = pt.tea;
			}
			if (pt.coffee < maxValue.coffee) {
				maxValue.coffee = pt.coffee;
			}
			if (pt.milk < maxValue.milk) {
				maxValue.milk = pt.milk;
			}
		}
		return maxValue;
	}
	*/
}

void addPoint(int year, float tea, float coffee, float milk) {
	DataPoint.addPoint(new DataPoint(year, tea, coffee, milk));
}

void setup() {
	size(600, 600);
	background(0);
}

void draw() {
	background(0);
	for (DataPoint pt : DataPoint.data) {
		pt.draw();
	}
}