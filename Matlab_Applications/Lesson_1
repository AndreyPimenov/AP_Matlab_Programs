% This script for AP:
% Chapter 1:
% predefined variables keywords: break, case, catch, classdef,
% continue, else, elseif, end, for, function, global, if, otherwise,
% parfor, persistent, return, spmd, switch, try, while
% 
% predefined variables: ans, pi, eps, inf, i and j, NaN

% problem 1. This program calculates the roots of quadratic equation:
% a*x^2 + b*x + c  = 0
a = 4; b = -9; c = -17.5;
DIS = sqrt(b^2 - 4 * a * c);
x1 = (-b + DIS) / (2*a);
x2 = (-b - DIS) / (2*a);

% problem 2. Trigonometric identity.
% Verify following identity:
% cos^2(x/2) = (tan(x) + sin(x)) / (2 * tan(x)), substitunig x = pi/2
x = pi/2;
LHS = cos(x/2)^2;
RHS = (tan(x) + sin(x)) / (2 * tan(x));
if (LHS == RHS)
    disp('Correct');
else
    disp('Wrong');
end

% problem 3. Geometry and trigonometry
% Four cicles are placed following way: at each point two circles are in
% contact, they are tangent to each other. Determine thr distance between
% C2 and C4:

% In solutioin we look at two triangles: C1C2C3 and C1C3C4
% By this information we calculate the angles C2C1C3 and C4C1C3
% Find the sum of this angles and use cosin theorem again find C2C4

R1 = 16; R2 = 6.5; R3 =12; R4 = 9.5;
C1C2 = R1 + R2;
C1C3 = R1 + R3;
C1C4 = R1 + R4;
C2C3 = R2 + R3;
C3C4 = R3 + R4;

Gama1 = acos((C1C2^2 + C1C3^2 - C2C3^2)/(2*C1C2*C1C3));
Gama2 = acos((C1C4^2 + C1C3^2 - C3C4^2)/(2*C1C4*C1C3));
Gama3 = Gama1 + Gama2;

C2C4 = sqrt(C1C2^2 + C1C4^2 - 2*C1C2*C1C4*cos(Gama3));

% problem 4. Heat transfer
% T = Ts + (T0 - Ts)*exp(-k*t)

Ts = 38; T0 = 120; k = 0.45; t = 3;
T = round(Ts + (T0 - Ts)*exp(-k*t));

% problem 5. Investments
% The balance B of a savings account after t years when a principal P 
% is invested at annual interest rate r and the interest is compounded 
% n times a year is given by:
% B = P* (1 + r/n) ^ (n*t) (1)
% If the interest is compounded yearly, the balance is given by:
% B = P * (1 + r) ^ t       (2)

% Determine how long in years and months it would take for the balance
% in th 2nd account to be same as the balance of the 1st account after 17
% years?

P = 5000; r = 0.085; ta = 17; n = 12;
% calculate B from Eq2:
B = P* (1 + r) ^ ta;
% solve Eq1 for t and calte t:
t = log (B/P) / (n*log(1 +r/n));
%Determine the number of months
years = fix(t);
months =ceil((t - years)*12);

% problem6. The voltage difference Vab between points a and b in 
% Wheatstone bridge circuit is:
% Vab = V* (R1*R3 - R2*R4)/((R1+R2)*(R3+R4))
V =14; R1 = 120.6; R2 = 119.3; R3 = 121.2; R4 = 118.8;
Vab = V* (R1*R3 - R2*R4)/((R1+R2)*(R3+R4));

% problem7. The resonant frequency f (in HZ) for the (R + L)|| C circuit 
% given by:
% f = (1/(2*pi)) * sqrt((1/(L*C) - (R/L)^2)
L = 0.15; R = 14; C=2.6*10^(-6);
f = (1/(2*pi)) * sqrt((1/(L*C)) - (R/L)^2)

