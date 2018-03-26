# Data Science and Power Performance
### Using Neural Networks and Regression Models to predict power consumption

This project contains two different data analysis techniques. 
- A multi layer perceptron (MLP) network
- An SKLearn and StatsModels implementations of multivariate linear regression

The purpose of this project is to predict the power consumption of various applications based on their performance counters, taken at runtime through the operating system (CentOS 6).

The [train.py](train.py) file contains an aptly named function, load_data2(), to conduct extraction and rough normalization of the input data, which has received some ETL (all integer values had commas stripped out, headers removed).

## The Benchmarks

Contained within the `benchmarks` directory are a series of scripts used for the collection of performance counters and power data from the operating system.  This data is what is fed to the neural network and the regression models.

* Note that `perf` performance counters, as well as either the `ipmi` or RAPL power statistics are hardware dependent and may not be supported by certain machines.


## How to use

Create a python virtual environment using python 2.7 and install the packages in the requirements file using conda or virtualenv. Here is a helpful tutorial of how to setup a virtual environment: [How to Install Anaconda Python Distribution][1]

The `SKLearn_LinReg` and `Statsmodels_linreg` respectively can be opened, run, and edited from a Jupyter Notebook.

To simply see a single training and test of a single neural network, run: `python train.py`

To see some cool graphs playing around with different neural network hyperparameters, run: `python train_cool.py`
###### ** Note for conda users, you may need to run `conda install python.app` and then execute `train_cool.py` with `pythonw`

##### Contributions
Big thanks to [tangentToNothing][2] for his contributions to the neural network

[1]: https://www.digitalocean.com/community/tutorials/how-to-install-the-anaconda-python-distribution-on-ubuntu-16-04
[2]: https://github.com/tangenttonothing
