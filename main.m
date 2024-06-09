clc; clear all, close all
%% 2021 12 16 robotics
%  by Lee jin woo
%  CP is Center Point of Circle Center; R = Radius N is Point number
%  linkdata is [L1 L2 L3];

CP = [2,1,3]; R=1; N=1000;
linkdata = [1,2,2]; 
soltype = 1;
data = MyCalibration(CP,R,N,linkdata,soltype);
