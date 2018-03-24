from neural_networ import MLP_NeuralNetwork
import numpy as np
import matplotlib.pyplot as plt
import pickle

def load_data2():
    data = np.loadtxt('elastic_multi1_no_heads.txt')

    out = []

    data_normed = data / data.max(axis=0)
    y_max = data.max(axis=0)[-1]
    for i in range(data_normed.shape[0]):
        fart = list((data_normed[i,0:-1].tolist(), [data_normed[i,-1]])) # don't mind this variable name
        out.append(fart)

    return out, y_max

out, y = load_data2()
with(open('elastic_multi1_no_heads.txt', 'rb')) as f:
    datalines = f.readlines()

data_dict = []
for data in datalines:
    split_data = data.split()
    x_vals = split_data[0:-1]
    data_dict.append({"y": split_data[-1], "x_values": x_vals})

print data_dict
