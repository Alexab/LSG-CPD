# LSG-CPD
This repo contains the matlab implementation of CPD with Local Surface Geometry (LSG-CPD).

## Introduction
CPD with Local Surface Geometry is a probabilistic rigid registration method.
Compared to the original CPD (Link to CPD paper), it takes into account the local surface geometry in the construction of the Gaussian mixture models (GMM).
Main codes are contained within __LSGCPD.m__.

## Installation
1. Install Matlab
2. Install the following matlab toolbox
    1. Computer Vision Toolbox
    2. Parallel Computing Toolbox
    3. Statistics and Machine Learning Toolbox

## Usage
1. Outlier Experiment: run  __main_outlier.m__
2. Kitti Experiment: run __main_kitti.m__


## TODO
- [ ] Demo for multi-view object modeling
- [ ] Demo for Stanford Lounge dataset
- [x] Demo for Outlier Experiments
- [x] Demo for Kitti Dataset

We are also working on implementing the method on C++. Stay tuned.
