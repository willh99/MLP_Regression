# Neural Networks are cool

This project contains two different data analysis techniques. 
- A multi layer perceptron (MLP) network
- An SKLearn and StatsModels implementations of multivariate linear regression

The purpose of this project is to predict the power consumption of various applications based on their performance counters, taken at runtime through the operating system (CentOS 6).

The [train.py](train.py) file contains an aptly named function, load_data2(), to conduct extraction and rough normalization of the input data, which has received some ETL (all integer values had commas stripped out, headers removed).


## How to use

Create a python virtual environment using python 2.7 and the requirements file using conda or virtualenv. Here is a helpful tutorial of how to setup a virtual environment: [How to Install Anaconda Python Distribution][1]

To simply see a single training and test of a single neural network, run: `python train.py`

To see some cool graphs playing around with different neural network hyperparameters, run: `python train_cool.py`
**Note for conda users, you may need to run `conda install python.app` and then execute train_cool.py with `pythonw`

[1]: https://www.digitalocean.com/community/tutorials/how-to-install-the-anaconda-python-distribution-on-ubuntu-16-04
