% Chapter 9 Application in numerical analysis

% Section 9.1 Solving an equation wit one unknown
% Section 9.2 Finding a minimum or a maximum of a function
% Section 9.3 Numeriacal integration
% Section 9.4 Solving First-order differential equation
clear all; % clear all variables
clc; % clear console 
%clf; % clear figure


% 9.1 Solving an equation with one unknown
%{ 
% 9 - 1: Solving a nonlinear equation
fplot ('x*exp(-x)-0.2',[0 8])  
x1 = fzero('x*exp(-x) -0.2', 0.7) 
F = @(x)x*exp(-x)-0.2 % creating an anonumous function
x2 = fzero(F, 2.8)

%NB fzero command find zeros of fucntion only where the fucntion crosses
%the x axis. The command does not find a zero at points where function
%touches but does not cross the x axis.

%}


% 9.2 Finding a minimum or a maximum of a function
%{
fplot ('x^3-12*x^2+40.25*x-36.5',[0 8])  
[x fval] = fminbnd('x^3-12*x^2+40.25*x-36.5', 3, 8)
[x fval]=   fminbnd('x^3-12*x^2+40.25*x-36.5', 0, 8)

[x fval] = fminbnd('-x*exp(-x) + 0.2', 0, 8)
%}


% 9.3 Numeriacal integration
%{
In applications of science and engineering the integrand can be a function 
or a set of data points. For example, data points from discrete
measurements of flow velocity can be used to calculate volume.

The following discussion describes how to use three MATLAB built-in
integration functions:
guad, guadl, trapz

In case of guad & guadl integrnd is a function
In case trapz = integrand is given by data points

quad use the adaptive Simpson method of integration
quad use the adaptive Lobatto method of integration

fplot('x.*exp(-x.^0.8)+ 0.2',[0 8])
%1st Method: (finding directly):
k = quad ('x.*exp(-x.^0.8)+ 0.2',0, 8)
%2nd Method: (by user-defined function):
function y = Chap9Sam2(x)
y = x.*exp(-x.^0.8)+ 0.2;
end

The trapz command can be used for integrating a fuinction that is given as
data points. It uses the numerical trapezoidal method of integration. The
form of the command is 

g = trapz (x, y)

where x,y - vectors with equal lenght. 

%}


% 9.4 Solving First-order differential equation
%{
NB Only a limited number of differential equations can be solved
analytically. Numerical methods, on the other hand, can result in an
approximate solution to almost any equation. Obtaining a numerical solution
might not be simple task however. 

This is because a numerical method that can solve any equation does not
exist. Instead there are many methods that are suitable for solving
different types of equations. 

%}

