% Chapter 2 Creating Arrays
yr = [1984 1986 1988 1990 1992 1994 1996];
top = [127; 130; 136; 145; 158; 178; 211];

%creating a vector with constant spacing by specifying the first term,
% the spacing and the last term: 0 - first, 4 - spacing, 244 - last term
x = [0:4:244];

% creating a vector with linear (equal) spacing by specifying the first and
% the last term: 0 - first element, 8 - last element, 6 - number of elements
y = linspace(0, 8, 6);

% Matrix (two-dimensional array)
% MxN means: M - rows, N - columns
A = [5 35 125; 4 16 64; 7 49 127];

% special matrixis creatin:
zr = zeros(3,4);
ne = ones (3,4);
idn = eye(5);

% The Transpose Operator:
B = A';

% For matrix:
% A(:,n) - Refers to the elements in all the rows of column n of the A
% A(n,:) - Refers to the elements in all the columns of row n of the A
% A(:,m:n) - Refers to the elements in all the rows b/n columns m & n
% A(m:n,:) - Refers to the elements in all the columns b/n rows m & n
% A(m:n, p:q) - Refers to the elements in rows m -> n and columns p -> q

% Adding elements to a matrix:
G = [zr ne];

% Eliminating elements from vectors and matrisis:
vctr = [2:12:123];
vctr (4:10) = [];

G (:, 2:6)=[];

% Build-In Function for handling arrays:
% length(A) - returns the number of elements in the vector A
% size(A) - returns a row vector [m,n], where m and n are the size mxn of
% the array A
% reshape (A,m,n) - createes a m by n matrix from elements of A. 
% the elements are column after column. A must have m times n elements
% diag(V) - when v is a vector, creates a square matrix with the elements
% of v in the diagonal
% diag(A) - when A - matrix, creates vector from the diagonal elements of A 

% problem 1. create a matrix
% using the ones and zeros commands, create a 4x5 matrix in which the first
% two rows are 0s and the next two rows are 1s
Ar(1:2, :) = zeros(2,5);
Ar (3:4, :)= ones(2,5);

% problem 2. create a matrix
% create 6x6 matrix in which the middle two rows and middle two columns are
% 1s and rest of the entries are 0s
AR = zeros (6,6);
AR(3:4,:) = ones(2,6);
AR(:,3:4) = ones(6,2);

% problem3
x = 0.85;
y = 12.5;
vectr1 = [y; y^x; log(y/x); x*y; (x+y)];

% problem4
a = 3.5;
b = -6.4;
vectr2 = [a, a^2, a/b, a*b, sqrt(a)];

% problem5
N =[2 10 18 29 41; 4 12 20 32 44; 6 14 23 35 47; 8 16 26 38 50] 
Anew = [N(1,1:4)', N(2,2:5)']
Bnew = [N(:,3)' N(3,:)]
Cnew(3:4,5:6) = N(2:3,4:5)

