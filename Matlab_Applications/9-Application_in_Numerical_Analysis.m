% Chapter 9 Application in numerical analysis

% Section 9.1 Solving an equation with one unknown
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

The trapz command can be used for integrating a function that is given as
data points. It uses the numerical trapezoidal method of integration. The
form of the command is 

g = trapz (x, y)

where x,y - vectors with equal lenght. 

%}


% 9.4 Solving First-order differential equation
%{
DIfferential equations paly a crucial role in science and engineering 
since they are int he foundation of virtually ever physical phenomenon that
is involved in engineering applications.

Only a limited number of differential equations can be solved
analytically. Numerical methods, on the other hand, can result in an
approximate solution to almost any equation. Obtaining a numerical solution
might not be simple task however. 

This is because a numerical method that can solve any equation does not
exist. Instead there are many methods that are suitable for solving
different types of equations. 

ODE Solver Name | Description 
----------------|------------
ode45           | For nonstiff problems, one-step solver, best to apply 
                | as a first try to most problems. Based on explicit 
                | Runge - Kutta method.
----------------|----------------------
ode23           | For nonstiff problems, one-step solver. Based on explicit 
                | Runge - Kutta method. Often quicker but less accurate 
                | ode45.
----------------|-------------
ode113          | For nonstiff problems, multistep solver
----------------|-------------
ode15s          | For stiff problems, multistep solver. Use if ode45
                | failed. Uses a variable order method.
----------------|-------------
ode23s          | For stiff problems, one-step solver. Can solve some
                | problems that ode15s cannot.
----------------|-------------
ode23t          | For moderately stiff problems
----------------|-------------
ode23tb         | For stiff problems. Often more effciient than ode15s
----------------|-------------

Stiff problems are ones that include fast and slowly changing components 
and require small steps in their solution. One-step solvers use information
from one point to obtain a solution at the next point. Multistep solvers
use information from several previous points to find the solution at the
next point. 

[t, y] = solver_name (ODEfun, tspan, y0)

solver_name = numerical method that is used to solve equation: ode45,ode113

ODEfun = user-defined function (in a function file) or an anonymous
         function. That calcultaes dy/dt for given values of t and y. 

tspan = a vextor that specifies the interval of the solution.

y0 = initial value of y (the value of y at the first point of the interval)

[t, y] = The output, which is the solution of the ODE. t and y are column
         vectors.


% Sample Problem 9 - 3 The gas equattion ----------------------

global P T n a b R
P = 6; T= 323.2; n = 2; 
a = 3.59; b = 0.047; % specific constants for each gas (in this case CO2)
R = 0.08206; %  L atm/ mol K

Vest = n * R * T / P; % Calculating an estimated value for V

V = fzero(@Waals, Vest)

function fofx = Waals(x)
global P T n a b R
fofx = (P + n^2 * a / x^2 ) * (x - n * b) - n*R*T;
end

% Sample Problem 9 - 5 Water flow in a river ---------------------

w = 8; % width
d = [1 32 60 91 121 152 182 213 244 274 305 335 366]; % measurement days
h = [2 2.1 2.3 2.4 3.0 2.9 2.7 2.6 2.5 2.3 2.2 2.1 2.0];% h in metrs
v = [2 2.2 2.5 2.7 5 4.7 4.1 3.8 3.7 2.8 2.5 2.3 2]; % speed in m/s

Q = v.*2.*h;

Vol = 60*60*24*trapz(d,Q);

fprintf('The estimated amount of water  in a year is %g cubic meters', Vol)
plot (d,Q)
xlabel('Day'), ylabel('Flow Rate (m^3/s)')


%}

% Sample 9 - 6: Car crash into a safety bumper --------------------

% F = K * v^3 (x + 1)^3 % THE FUNCTION OF THE BUMPER
% m*a = -K * v^3 (x + 1)^3 
% a = -K * v^3 (x + 1)^3 / m
% The velocity as function of x can be calculated by substracting the
% acceleration in the equation:
% v * dv = a * dx, which gives 
% dv / dx = -K * v^2 (x + 1)^3 / m
% The last equation if a 1st order ODE that needs to be solved 
% for the interval 0 =< x =< 3 with interval condition v = 90, at x = 0

global k m

k = 30; m = 1500; v0 = 90;
xspan = [0:0.2:3]; % a vector that soecifies the interval of the solution
v0mps = v0*1000/3600; % to m/s
[x v] = ode45(@bumper, xspan,v0mps)
plot(x,v)
xlabel('x (m)'); ylabel('velocity (m/s)')

function dvdx = bumper (x,v)
global k m 
dvdx = (-k * v^2*(x + 1)^3)/ m
end

