from prediction import Prediction

class DummyModel:
	def predict(self, input):
		return Prediction(input)
