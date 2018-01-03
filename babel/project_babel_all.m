
close all;
clear; clc;

A = [ 16 -2 15 13; 5 6 8 8; 9 4 11 12; 4 12 10 1 ];

atoms_norm = sqrt( diag(A'*A) );
A_normalized = A / diag(atoms_norm);

d = babel( A_normalized, 1);
fprintf('Babel 1 =  %.4f\n', d );

d = babel( A_normalized, 2);
fprintf('Babel 2 =  %.4f\n', d );

d = babel( A_normalized, 3);
fprintf('Babel 3 =  %.4f\n', d );
 


