clc
clear all;

Grades = [80 75 91 60 79 89 65 80 95 50 81]; % 7.10
[AveGrade, StanDeviation] = stat(Grades) % Subfucntions
[Avegrade2, StanDeviation2] = statNest(Grades) % Nested Fucntions

Mexico_population = expGD(67,79,6,20) % 7.12
half_life_radioactive = expGD(7, 3.5, 5.8, 30)
Russina_population = expGD(142.856536, 146.267288, 5, 40)

[h d] = trajectory (230, 39)


% A user-defined function ia MATLAB file that is created by user, saved as 
% function file, and then used like a build-in function
% In many cases this is a subprogram.
% Schematically: Input data --> Function File --> Output data
% Simularities and differences b/n Script filae and Function files:
%     Script Files          |        Function files
% --------------------------|-----------------------------
%  saved with extencipn .m  | saved with extencipn .m
% --------------------------|-----------------------------
%            any line       | first line should function definition line
% --------------------------|-----------------------------
%  variables are recognised | variables are local
%   in the Command Window   |
% --------------------------|-----------------------------
%  can use variables that   | can accept data through input arguments 
%  defined in the workspace | and can return data through
%  -------------------------| output arguments
%  contain sequence of      |  
%  MATLAB commands          | 
%  -------------------------|-----------------------------
%                           | The name of the file should be 
%                           | the same as the name of the function
% --------------------------|-----------------------------
% A user-defined function is used in the same way as a built-in function.
% it can be (used) in the Command Window, in a script file, or in 
% another function.
% --------------------------------------------------------
%
% 7.8 Anonymous Fucntions
% User-defined function could be used several times in the complex
% calculations & large copmuter programs.
% An anonymous function is a user-defined function that defined and written
% within the computer code (not in a separate funtion file) and it used in
% the code. 
% N.B.I >>> Anonymous function can be defined in any part of MATLAB (in the
% Command Window, in script files, and inside regular user-defined
% functions). 
% name = @ (arlist) mathematical expression
% arlist - a list of input arguments (independent variables)
% Examples:
cube = @(x) x ^ 3
circle = @(x,y) 16*x^2 + 9*y^2
parabola = @(x) a*x^2 + b*x + c
dstn_btwn_polar_points = @ (rA, thA, rB, thB) sqrt(rA^2 + rB^2 - 2*rA*rB*cos(thA-thB))

% N.B.II >>> MATLAB captures the values of the predefined variables when
% the anonymous function is defined. This means that if new values are 
% subsequently assigned to the predefined variables, the anonymous 
% fucntion is not changed. The anonymous function has to be redefined 
% in order for the new values of the predefined variables to be used in 
% expression.

% --------------------------------------------------------
% Writing a function fucntion that accepts a fucntion handle as an input
% argument. (1st method) Fun(x)
% Passing an anonymous function into a fucntion fucntion:
% 1st step: write an anonympus fucntion
% 2nd step: passed it into the user-defined fucntion

FdemoAnony = @(x) exp(-0.17*x).*x.^3-2*x.^2+0.8*x-3
ydemo = [ 0.5000, -2.9852; 2.2500, -3.5548; 4.0000, 0.6235]
ydemo = funplot(FdemoAnony, 0.5,4)

ydemoS = [ 0.5000, -2.9852; 2.2500, -3.5548; 4.0000, 0.6235]
ydemoS = funplotS('Fdemo',0.5,4)

function y = Fdemo(x)
y = exp(-0.17*x).*x.^3-2*x.^2+0.8*x-3;
end


function xyout = funplot(Fun,a,b)

% funplot makes a plot of the function Fun which is passed in
% when funplot is called in the domain [a,b]
%
% Input arguments are: 
% Fun - Function handle of the function to be plotted
% a - 1st point of the domain
% b - 2nd point of the domain
%  
% Output arguments is:
% xyout: The value of x and y at x = a, x = (a + b)/2, x = b
% listed in a 3 by 2 matrix

x = linspace (a, b, 100);
y = Fun(x);
xyout(1,1)= a; 
xyout(2,1) = (a + b)/2; 
xyout(3,1) = b;

xyout(1,2)= y(1); 
xyout(2,2)= Fun((a + b) / 2);
xyout(3,2)= y(100);

plot (x,y);
xlabel('x'), ylabel('y')
end
% --------------------------------------

% There is a 2nd method for passing a fucntion into a function fucntion is
% by typing the name of the function that is being imported as a string in  
% the input argumetn of the function function. 
% 
% When user-defined function is imported by using its name, the value of
% the imported function inside the function function has to be calculated 
% with the feval command. This is differnet from the case when fucntion
% handle is used, which means that there is a difference in the way that
% the code in the fucntion fucntion is written that depends on how the
% imported function is passed in. 
%
% The f e v a l (short for "fucntion evaluate") command evaluates the value
% of a function for a given value (or values) of the function's argument
% (or arguments). The format of the command is:
% varible = feval ('function name', argument value)


function xyout = funplotS(Fun,a,b)

% funplotS makes a plot of the function Fun which is passed in
% when funplot is called in the domain [a,b]
%
% Input arguments are: 
% Fun - Function handle of the function to be plotted
% a - 1st point of the domain
% b - 2nd point of the domain
%  
% Output arguments is:
% xyout: The value of x and y at x = a, x = (a + b)/2, x = b
% listed in a 3 by 2 matrix

x = linspace (a, b, 100);
y = feval(Fun,x);
xyout(1,1)= a; 
xyout(2,1) = (a + b)/2; 
xyout(3,1) = b;

xyout(1,2)= y(1); 
xyout(2,2)= feval(Fun, (a + b) / 2);
xyout(3,2)= y(100);

plot (x,y);
xlabel('x2'), ylabel('y2')
end

% ----------------------------------------------------------------------

% SubFucntions

% Average and standard deviation example:
function [me SD] = stat(v)
num = length(v);
me = AVG(v,num);
SD = StanDiv (v, me, num);
end

function xAve = AVG(x, num)
xAve = sum(x)/ num;
end

function Sdiv = StanDiv (x, xAve, num)
    xdif = x - xAve;
    xdif2 = xdif.^2;
    Sdiv = sqrt(sum(xdif2)/(num-1));

end

% Nested functions:

function [me SD] = statNest(v)
n = length(v);
me = AVG(v);

    function av = AVG(x)
    av = sum(x) / n;
    end

    function Sdiv = StandDiv(x)
    xdif = x - me;
    xdif2 = xdif.^2;
    Sdiv = sqrt(sum (xdif2) / (n -1));
    end

SD = StandDiv(v);
end

% ----------------------------------------------------------------------

% 7-5 Exponential growth and decay
% (a) The population of Mexico was 67M in the 1980 and 79M in 1986. 
%     Estimate the population in 2000 
% (b) The half-life of radioactive material is 5.8 years.
%     How much of a 7-gram sample will be left after 30 years?
% (с) The population of Russia was 142856536 in 2010
%                       and became 146267288 in 2015
%     Estimate the population in 2050
%     Which year it achives 500M ?

function At = expGD(A0, At1, t1, t)
% expGD calculates Exponentioal Growth and Decay
% Input arguments are:
% A0: Quantity at time zero
% At1: Quantity at time t1
% t1: The time t1
% t: time t
% Output arguments are:
% At: Quantity at time t
k = log(At1 / A0)/t1;
At = A0 * exp(k*t)
end

% -----------------------------------------------------------

% 7-6: Motion of a projectile
function [hmax, dmax] = trajectory (v0, theta)
% trajectory calculates the max height and distance of a projectile,
% and makes a plot of the trajectory.
% Input arguments are:
% v0: initial velocity in (m/s)
% theta: angle in degrees
% Output arguments are:
% hmax: maximum height in (m)
% dmax: maximum distance in (m)
% The fucntion creates also a plot of the trajectory

g = 9.81;
v0x = v0*cos(theta*pi/180);
v0y = v0*sin(theta*pi/180);
thmax = v0y / g;
hmax = v0y^2 / (2*g);
ttot = 2*thmax;
dmax = v0x*ttot;

% Creating a trajectory plot 
tplot = linspace (0, ttot, 200); % creating a time vector with 200 elements
x = v0x * tplot;
y = v0y * tplot - 0.5*g*tplot.^2;
plot(x,y);
xlabel ('DISTANCE (m)')
ylabel ('HEIGHT (m)')
title ('PROJECVTILE''S TRAJECTORY')

end

