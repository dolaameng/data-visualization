from flask import *

app = Flask(__name__)

@app.route('/')
def index():
	return render_template('index.html')

@app.route('/getlocs')
def getlocs():
	return open('static/js/locations.tsv', 'r').read();

if __name__ == "__main__":
	app.run(debug = True)