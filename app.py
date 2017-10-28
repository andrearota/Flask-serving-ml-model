from flask import Flask
from flask import request
from flask import json
from flask import Response

from model import DummyModel

app = Flask(__name__)
model = DummyModel()

@app.route("/api/v1/predict/", methods = ['POST'])
def predict():
	if request.headers['Content-Type'] == 'application/json':
		input = request.json['x']
		output = model.predict(input)
		return Response(json.dumps(output.__dict__), mimetype='application/json')

	else:
		return "Unsupported Media Type", 415
