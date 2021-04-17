% AP_Ch_11_Symbolic_Math

% Many application in science and engineering required symbolic operations,
% which are mathematical opeartions with expressions taht contain symbolic
% variables. The result of such opeartions is also a mathematical
% expression in term of the symbolic variables.
%
% One simple example involves solving an algerbaic equation that containts
% several variables and solving for one variable in terms of the others.
% parametric equations
%
% Symbolic operations can be performed by MATLAB once the Symbolic Math
% Toolbox is installed. It uses MuPAD adn it also can be used as a separaet
% software.
% ---------

% object_name = sym('string'), the string can be:
% 1) a single letter or a combination of several letters withou SPACES
% 2) a combination of letters and digits starting witha  letter
% 3) a  number
% ------------

clear all
clc

a = sym('a')
c = sym('5')
c + 10

e =13

syms y z d 
y = y
z = z
d = 12

% 11.1.2 Creating Symbolic Expressions
syms a b c x y
f = a*x^2 + b*x + c

% Notice that all calculations are carried out exactly, with no numerical
% approximation:
g = 2*a/3 + 4*a/7 -6.5*x + x/3 + 4*5/3 - 1.5

% The different between exact and approximate calculations is demonstrated
% int he following example:
a = sym(3); b =sym(5);
e = b/a + sqrt(2)

c = 3; d =5;
f = d/c + sqrt(2)

% Additional facts about symbolic expressions and symbolic objects:
h = 10/3
k = sym(5); m=sym(7);
p = k/m + h

% The d o u  b l e  command can be used to convert symbolic to numerical
pN = double(p)

% A symbolic object taht is created can also be a symbolic expression
% written in terms of variables that were not first created as symbolic
% objects:
f = sym( a*x^2 + b*x + c)

% Existing symbolic expressionjs can be used to create new symbolic
% expressions. This is done by simply using the name of the existing
% expression
SA = x + y, SB = x - y
F = SA^2/ SB^3 + x^2
