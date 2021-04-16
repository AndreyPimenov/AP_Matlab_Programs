% AP_Ch8_Polinomials,Curve_Fitting,_and_Interpolation
% 
% Polynomials are mathematical expression that are frequently used for
% problem solving and modeling in science and engineering. In many cases an
% equation that is written in the process of solving a problem is a
% polynomial, and the solution of the problem is the zero of the
% polynomial. 
%
% Curve fitting is a process of finding a fucntion that can be used to
% model data. The function does not necessarily pass through any of the
% points, but models the data with the smallest possible error. There are
% no limitations to the type of the equations that can be used for curve 
% fitting. Often, however, polynomial, exponential, and power functions 
% are used.    
%
% Interpolation is the process of estimating values between data points. 
% The simplest kind of interpolation is done by drawing a straight line 
% between the points. In a more sophistikated interpolation, data from
% additional points is used. 
% 
% 8.1 Polynomials 
% Polynomilas are functions that have the form:
% f(x) = an*xn + a(n-1)*x(n-1) + ... + a1*x + a0
% an, a(n-1), ... , a1, a0 are real numbers
% in MATLAB, polynomials are represented by a row vector in which the 
% elements are the coefficients an, a(n-1), ..., a1, a0

p = [8 5] % 8*x + 5
x = 2
% The value of a polynomial at a point x can be calculated with the
% fucntion p o l y v a l that has the form:
polyval (p, x)

% Sample Problem 8 - 1: Calculating polynomials with MATLAB
p = [1 -12.1 40.59 -17.015 -71.95 35.88]
x = -1.5 : 0.1: 6.7
y = polyval (p, x)
plot (x,y)

% Roots of a Polynomial
r  = roots(p)
% This is very important function to find the roots of a quadratic
% equation
roots([4 10 -8])

% And vise-verse: when the roots of a polynomial are known, the p o l y 
% command can be used for detecting the coefficients of the polynomial:
r = [6.5 4 2.3 -1.2 0.5]
p = poly(r)

% 8.1.3 Addition, Multiplication and \Division of Polynomials
% by adding (substracting) coefficients.
% the dhorter vector has to be modified to be of the same lenght as
% the longer vector by adding zeros. 
p1 = [3 15 0 -10 -3 15 -40];
p2 = [3 0 -2 -6];
p = p1 +[ 0 0 0 p2];

% Multiplication
pm = conv (p1, p2);

% Division
% A polynomial can be devided by another polynomial with the MATLAB
% built-in function deconv, which has trhe form:
u = [2 9 7 -6];
v = [1 3];
[a b] = deconv (u, v)
[a b] = deconv (p1, p2)

% Derivatives of Polynomials
% The buil-in fucntion p o l y d e r can be used to calculate the
% derivative of a single polynomials, a product of two polynomial
% or a quotient of two polynomials:
% k = polyder(p), where p - polynomial vector; k - derivative vector
% k = polyder(a, b), a*b - product vector, k - derivative product vector 
% [n d] = polyder(u, v), u/v - quatient polynomial, n/d -quatioen derivative

f1 = [3 -2 4]
f2 = [1 0 5]
k = polyder (f1)
d = polyder (f1, f2)
[n d] = polyder (f1, f2)

% 8.2 Curve Fitting
% Curve fitting, also called regression analysis, is a process of fitting a
% fucntion to a set of data points. The function can then be used as a
% matehmatical model of the data. 

% Polynomials can be used to fit data points in two ways. In one the
% polynomial passes through all data points, and the other the polynomial 
% does not necessary pass through any of the points but overall gives a
% good aproximation of the data.

% N.B. polynomials of high degraa might give a large error if they are used
% to estimate values between data points.

% The most common method of finding the best fit to data points is
% the method of least squares.
% ----------------------------
% Least Squares Method:
%
% In this method, the coefficients of the polynomial are determined by
% minimising the sum of the squares of the residuals at all the data
% points. The residual at each point is defined as the difference between
% the value of the polynomial and the value of the data.
% Example:
% (x1, y1); (x2,y2); (x3,y3); (x4,y4);  - data points
% f(x) = a1*x + a0 - 1st aproximation
% The residual at each point Ri: Ri = f(xi) - yi
% R = [f(x1) - y1]^2 + [f(x2) - y2]^2 + [f(x3) - y3]^2 + [f(x4) - y4]^2
% then finding R as fucntion of a1 and a0, by f(x) substracting
% The minimum of R can be find by partial derivatives of R with respect to
% a0 and a1 and equating them to zero:
% dR / da1 = 0  and dR / da0 = 0
% this results in a system of two equations with two unknows:a1 and a0. 
% the solution of these equations gives the values of the coefficients of
% the polynomial that best fits the data. 
% The same procedure can be followed with the more points and 
% high-order polynomials. 
% ------------------------------
% Curve with polynomials is done with p o l y f i t
%
% p = polyfit (x, y, n)
% x - vector with the horizontal coordinates
% y - vector with the vertical coordintaes
% n - is degree of polynomial



