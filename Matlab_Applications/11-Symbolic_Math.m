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
% ------------------------------

% 11.1.3 The s y m v a r Commnad & the Default Symbolic Variable
%
syms x h w y d t
S = h*x^2 + d*y^2 + t*w^2
symvar(S) % alphabetic order
symvar(S, 1) % default order

% The c o l l e c t command collects the terms in teh expression that have
% the varibale with the same power. In the new wxpression, the terms will
% be ordered in decreasing order of power.
S = (x^2 + x - exp(x))*(x+3)
F = collect(S)
% The user can specify the 1st variable by using the collect(S,variable_name)

% The e x p a n d command expnands expressions in two ways. It carries out
% products of terms that include summation (used with at least one of the
% terms), and it uses trigonometric identities and exponential and
% logarithmic laws to expand corresponding terms that include summation.
syms a x y
S = (x + 5) * (x - a) * (x + 4)
T = expand (S)
Trig = expand(sin(x-y))

% The f a c t o r commnad changes an expression that is a polynomial to a
% product of polynomials of a lower degreee. 
S = x^3 + 4*x^2 - 11*x - 30
F = factor(S)

% The s i m p l f y command is a general tool for simplying the form 
% of an expression.
S = (x^2 + 5*x + 6) / (x + 2)
SA = simplify(S)
simplify((x + y) / (1/ x + 1/y))

% The p r e t t y command displays a symbolic expression in a format
% resembling the mathematical format in which expressions are generaly
% typed. pretty(S)
pretty(S)

%----------------------------------

% 11.3 Solving Algebraic Equations
% h = solve(exp(2*z)-5)

S = x^2 - x - 6
k = solve(S)

T = a*x^2 + 5*b*x + 20
solve(T)
M = solve (T,a)

ts = solve(4*t*h^2 + 20*t -5*g, t)
gs = solve(4*t*h^2 + 20*t -5*g, g)

% Solving the system of equations
% output = solve (eq1, eq2, ..., eqn) 
% output = solve (eq1, eq2, ..., eqn, var1, var2, ... , varn)

syms x y t
S = 10*x + 12*y + 16*t
[xt yt] = solve(S, 5*x - y - 13*t)
[xt yt] = solve(S, 5*x - y - 13*t,t,y) 

S = 10*x + 12*y + 16*t
AN = solve(S, 5*x - y - 13*t)
AN.x
AN.y
% --------------

% 11.4 Differentiation
syms x y t
S = exp(x^4);
diff(S)
diff(S, 2)
diff((1 - 4*x)^3)

% 11.5 Integration
S = 2*cos(x) - 6*x;
int(S)
R = 5*y^2*cos(4*t);
int(R)
int(R,t)
int (sin(y) - 5*y^2, 0, pi)

% 11.6 Solving an ODE
% Can be solved symbolically by d s o l v e commnad.
% General solution: 
dsolve('Dy = 4*t + 2*y')
dsolve('D2x + 2*Dx + x = 0')

dsolve('Ds = a*x^2')
dsolve('Ds = a*x^2','x')
dsolve('Ds = a*x^2','a')

% Particular solution:
dsolve('Dy + 4*y = 60', 'y(0)=5') %1st order ODE
dsolve('D2y - 2*Dy + 2*y = 0', 'y(0)=1', 'Dy(0)=0')
factor(ans)
%---------

% 11.7 Plotting Symbolic Expressions
% In many cases is need to plot a symbolic expression. This can be done
% with the e z p l o t command. 
S = (3*x+2)/(4*x-1)
ezplot(S)

S = 4*x^2 - 18*x + 4*y^2 + 12*y - 11
ezplot(S)

x = cos(2*t)
y = sin(4*t)
ezplot(x,y)

% 11.8 Numerical Calculations with Symbolic expresions
% R = subs(S,var, number)
% R = subs(S, {var1,.. vari,.. varn}, {number1,..numberi,..numbern}
syms A c m x y
S = A*cos(m*x) + c*y
A =10; m = 0.5; c = 3;
subs (S)

x = linspace(0, 2*pi, 4);
T = subs(S)
