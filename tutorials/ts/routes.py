from flask import *
from csv import DictReader
import json

app = Flask(__name__)

@app.route('/')
def index():
	return render_template('index.html')

@app.route('/milkdata')
def milkdata():
	with open('static/data/milk-tea-coffee.tsv') as f:
		r = DictReader(f, delimiter = '\t')
		data = list(r)
	#return jsonify(data)
	return Response(json.dumps(data), mimetype='application/json')

if __name__ == '__main__':
	app.run(debug = True)