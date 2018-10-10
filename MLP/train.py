from neural_networ import MLP_NeuralNetwork
import numpy as np
import matplotlib as plt

myNetwork = MLP_NeuralNetwork(7, 12, 1, iterations = 50, learning_rate = 0.1, momentum = 0.5, rate_decay = 0.001)

# Load data from file
def load_data2():	
	data = np.loadtxt('elastic_multi1_no_heads.txt')
		
	out = []

	data_normed = data / data.max(axis=0)
	y_max = data.max(axis=0)[-1]
	for i in range(data_normed.shape[0]):
		RItem = list((data_normed[i,0:-1].tolist(), [data_normed[i,-1]]))
		out.append(RItem)

	return out, y_max

my_data, y_max = load_data2()

# Train the network
myNetwork.train(my_data[500:])

# Get error margin in test
errors = myNetwork.test(my_data[:100], y_max)

average_error = sum(errors) / len(errors)
print("Average Test Set Error: {}".format(average_error))


