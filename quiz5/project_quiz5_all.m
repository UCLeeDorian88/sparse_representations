
close all;
clear; clc;

A = [ 
        0.1817  0.5394  -0.1197 0.6404;
        0.6198  0.1994  0.0946  -0.3121;
        -0.7634 -0.8181 0.9883  0.7018;
    ];

b = [ 1.1862;-0.1158; -0.1093 ];

A_normalized = compute_effective_dictionary(A);

x0 = ls_omp(A,b);
x1 = omp(A,b);
x2 = wmp(A,b);
x3 = thr(A,b);


 


