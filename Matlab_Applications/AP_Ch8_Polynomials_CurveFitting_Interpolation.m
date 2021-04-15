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

% This is very important fucntion to find the roots of a quadratic
% equation

roots([4 10 -8])

% And vise-verse: when the roots of a polynomial are known, the p o l y 
% command can be used for detecting the coefficients of the polynomial:

r = [6.5 4 2.3 -1.2 0.5]
p = poly(r)

% 8.1.3 Addition, Multiplication and \Division of P{olynomials

