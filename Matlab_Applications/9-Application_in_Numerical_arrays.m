% Chapter 9 Application in numerical analysis

% Section 9.1 Solving an equation wit one unknown
% Section 9.2 Finding a minimum or a maximum of a function
% Section 9.3 Numeriacal integration
% Section 9.4 Solving First-order differential equation
clear all; % clear all variables
clc; % clear console 
clf; % clear figure

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



%}









% 9.3 Numeriacal integration
%{



%}

% 9.4 Solving First-order differential equation
%{



%}
