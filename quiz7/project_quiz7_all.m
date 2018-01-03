
close all;
clear; clc;

n = 64;
m = 256;

%mutual coherence of
mu = 0.1;

%true support
s = 5;

%noise sigma
sigma = 1;

epsilon_oracle = ( s * sigma * sigma ) / ( 1 - ( s - 1 ) * mu ) ;


 


