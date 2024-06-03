# Project Title : Facial Expression Recognition using Gabor wavelet and neural network

## Abstract
In this research, a new approach is proposed to extract facial features with a remarkable precision and performance. In the feature extraction step in the proposed system, the Gabor filter is used. The Gabor filter is one of the best descriptors that can be used in the feature extraction step. These functions are that some of the frequencies can be eliminated and the extraction of the feature in a less voluminous space, thus reducing the volume of the calculations. In this research, we apply the Gabor filter to 4 facial areas. We then apply the neural network cluster on the face feature vector to detect facial expressions. In this study, we use the PCA algorithm in order to select useful features and reduce the dimensions of the feature vector. In this thesis, six basic modes, including: angry, surprise, fear, happy, disgust and sadness, are selected for face recognition system. Experiments were performed on the JAFFE database. The results of the experiments show that the proposed system has a high facial recognition rate compared to the Gabor filter on the face. Also, in the testing section, two probable neural networks and the RBF neural network were used to categorize and detect facial expressions. The probable neural network compared to the RBF neural network has more acceptable results. Also, the proposed method was more efficient and more accurate than other methods on that time.


## Proposed Method

1. Pre-processing and segmentation
   
   •	Resizing to 250×250

   •	Convert image to gray scale

   •	Dividing image to 4 areas

2-	Feature extraction using Gabor Wavelet

3-	Feature selection using principal component analysis (PCA)

4-	Feature classification and expression recognition using Neural Network

## Dataset
•	Dataset: JAFFE ( https://zenodo.org/records/3451524 )


## Results
The probable neural network compared to the RBF neural network has more acceptable results. Also, the proposed method was more efficient and more accurate than other methods on that time.

## How to run:

•	Open run.m file and click run button

•	First click train dataset JAFFE button

•	Then click open image for test button

•	Finally click facial expression recognition button

Finally, you can see expression of test data that you have selected.



## Project History
This project was originally completed in 2014. The commit history has been adjusted to reflect the original dates of the work.
