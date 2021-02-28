% Chapter 3. Mathematical operations with Arrays
A = [1 4 3; 2 6 1; 5 2 8];
B = [5 4; 1 3; 2 6];
A * B;
I = eye(3);
A * I;
A';
B = inv(A);
A*B;
det(A);
det(B);

% MATLAB has two types of dvision:

% Left Division  \ is used to solve the matrix equation: AX = B
% In this equation X and B - column vectors
% This equation can be solved by multiplying, on the left, both sides by
% the inverse A:
% A^(-1)*A*X = A^(-1)*B, so solution is: X = A^(-1)*B (a)
% In MATLAB last equation can be writen: X = A\B (b)
% NB (a) based on calculation inverse matrix, 
%    (b) based on calculation Gauss elimination (which is more precise)

% Right Division / is used to solve the matrix equation: XC = D
% In this equation X and D - rows vectors
% This equation can be solved by multiplying, on the right, both sides by
% the inverse C:
% X*C*C^(-1) = D*C^(-1)
% X = D* C^(-1)
% X = D/C

% Problem 1. Solving 3 linear equations (array division)
% 4x - 2y + 6z = 8
% 2x + 8y + 2z = 4
% 6x + 10y + 3z = 0

% Solving the form AX=B
A = [4 -2 6; 2 8 2; 6 10 3];
B = [8; 4; 0];
Xa = A\B;
Xb = inv(A)*B;

% Solving the form XC=D
C = [4 2 6; -2 8 10; 6 2 3];
D = [ 8 4 0];
Xc = D/C;
Xd = D*inv(C);

% ELEMENT-BY-ELEMENT OPERATIONS
% .* - Multiplication
% .^ - Exponention
% .\ - Left Division
% ./ - Right Division

% Element-by-element calculations are very useful for calculating the value
% of function at many values of its argument. This is done by first
% defining a vector that contains values of the independent variable, and
% then using this vector in element-by-element computations to create a
% vector in which each element is the corresponding value of the function.
x = [1:8];
y = x.^2 - 4*x;
z = [1:2:11];
y = (z.^3 + 5*z)./(4*z.^2 - 10);

% USING ARRAYS IN MATLAB BUILT_IN MATH FUNCTIONS
x = [0:pi/6:pi];
y = cos(x);
% Vectorization - the feature of MATLAB in which arrays can be used as arguments in functions

% Built-IN-ARRAY Functions:
% mean(A) - if A is a vector, returns the mean value of its elements
% max(A) 
% min(A)
% sum(A)
% sort(A) - sort in ascending order
% median(A) - returns the median value of the elements of the vector
% std(A) -  returns standard deviation of the elements of the vector
% det(A) - returns the determinant of the square matrix A
% dot(a,b) - dot product = SUM (ai * bi) for i in range(0:len(a))
% cross(a,b) - cross product. They have to be three elements each!!!
% inv(A) - returns the inverse of square matrix A
a = [ 1 3 2; 6 12 4];
b = [2 4 1; 6 9 10];
dot(a,b);
cross(a,b);

% MATLAB has three commnads - rand, random, randi - that can be used to
% assign random numbers to veriables
rand; % generate a singl;e random number between 1 and 0

n = 7; m =3; imax = 15 ;
rand(1, n);% generate an n-element row vector of random numbers between 1&0
rand(n); % generate nxn matrix with random numbers b/n 1 & 0
rand(m, n); % generate mxn matrix with random numbers b/n 1&0

randperm(n); % generate a row vector witn n elements that are random permutation of integers 1 through n


% the randi generate uniformally distributed random integer 
randi (imax);
randi (imax, n);
randi (imax, m, n);
randi ([50 90], 3 ,4); % the range b/n any two integers = [min, max]

% randn - generates normally distributed numbers with mean 0 and standard
% deviation of 1.
d = randn(121);

% Problem 2. Equivalent force system. dETERMINE EQUIVALENT FORCE
clear 
F1M = 400; F2M = 500; F3M = 700;
Th1 = -20; Th2 = 30; Th3 = 143;

% Define variables with the angle of each vector
F1 = F1M * [cosd(Th1) sind(Th1)];
F2 = F2M * [cosd(Th2) sind(Th2)];
F3 = F3M * [cosd(Th3) sind(Th3)];

Ftotal = F1 + F2 + F3; % calculation of the total force vector
FtotM = sqrt(Ftotal(1)^2 + Ftotal(2)^2); % calculate the magnitude of the total force vector
Th = atand (Ftotal(2) / Ftotal(1));

% Problem 3. Friction experimnet (element - by - element calculations)
% when F is measured and m is known, the coefficient of friction can be calculated
% by: mu = F / (m * g), where g - 9,81 m/s2

% Enter the values of m is a vector 
m = [2 4 5 10 20 50];
% Enter the values of F in a vector
F = [12.5 23.5 30 61 117 294];
% A value of mu is calculated for each test, using element-by-element calculations
mu = F ./ (m * 9.81);
% The average of the elements in the vector mu is determined by using the function mean
mu_ave = mean (mu); 

% Problem 4. Electrical resistive network analysis (solving a system of linear equations)
V1 = 20; V2 = 12; V3 = 40;
R1 = 18; R2 = 10; R3 = 16; R4 = 6; R5 = 15; R6 = 8; R7 = 12; R8 = 14;

A = [ -(R1+R2+R3)         R2            R3       0;
           R2       -(R2+R4+R5+R7)      R4       R7;
           R3             R4       -(R3+R4+R6)   R6;
           0              R7            R6       -(R6+R7+R8)]

B = [-V1; 0; V2; -V3]
I = A\B

% PS Solve 36 and 37 for Electric Circuits
