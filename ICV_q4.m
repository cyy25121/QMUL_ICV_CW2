%% Read data
% Qurstion4: Motion estimation
% Dataset: DatasetC
disp('Intorduction of Computer Vision Coursework 2 - Q4: Motion estimation');
clc; clear;
%% Background
v = VideoReader('Dataset/DatasetC.mpg');
[bg, outImg, ~] = ICV_Background(v);

%% Run Demo

v = VideoReader('Dataset/DatasetC.mpg');
ICV_q4_demo(v);

