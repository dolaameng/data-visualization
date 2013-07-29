interface JavaScript {
	void displayPointInfor(int year, float coffee, float milk, float tea);
}

JavaScript js;

void registerJS(JavaScript jsEngine) {
	js = jsEngine;
	console.log("JavaScript Engine Registered!!");
} 