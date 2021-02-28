% Programming in Matlab
% Section 6.1 explains relational and logical operators
% Section 6.2 explains conditional statements 
% Section 6.3 explains explains s w i t c h structure
% Section 6.4 explains LOOPs
% Section 6.5 Nested LOOPs 

%clear all; clc; %clf

% Section 6.1
%{
% Relational operator Description
%          <          Less than
%          >          Greater than
%         <=          Less than or equal to
%         >=          Greater than or equal to
%         ==          Equal to 
%         ~=          Not Equal to
% Intersting point
% If a scalar is compared with array, the scalar is compared with every 
% element of the array, and the result is a logical array with 1s and 0s 
% according to the outcome of the comparison of each element.
A = [ 2 9 4; -3 5 2; 6 7 -1]
B = A <= 2

r = [ 8 12 34 1 2 34 65 10]
s = r < 12
t1 = r(s)

% NB Numerical arrays from 0s and 1s are not the same as logical vectors
% The 1st time a logical vector is used in arithmetic operations 
% it is changed to a numerical array

% L o g i c a l operators
% Using logical opearators in a math expression
t2 = 25*((12 & 0) + (~0) + (0|5))

% Interestin points:
% Mathematically Correct, but not in Matlab: -5 < x --> true, but 1<-1 - false 
x = -2
-5 < x < -1 

% Built-in logical functions and Logical Operators:
%   and(A,B)      A&B
%   or(A,B)       A|B
%   not(A)        ~A
%   xor(a,b)      Exclusive OR
%   all(A)        Returns 1 if all elements in A are non - zeros
%   any(A)        Returns 1 if any elements in A are non - zeros
%   find(A)       Returns the indices of non-zero elements of vector A
%   find(A>d)     Returns the adress of the elements that are larger than d   

% Problem 1: Analysis of temperature data
T = [58 73 73 53 50 48 56 73 73 66 69 63 7 82 84];
T_above_75 = T >= 75;
Ndays_T_above5 = sum(T_above_75)

BetweeN_65_and_80 = (T >= 65) & (T <= 80);

Ndays_BetweeN_65_and_80 = sum(BetweeN_65_and_80)
dates_T_BetweeN_65_and_80 = find((T > 50) & (T <= 60))

%}

% Section 6.2
% if - end
% if - else - end
% if - elseif - else - end

% Problem 6 - 2: Calculating worker's pay
%{
t = input ('Please enter the number of hours worked ');
h = input ('Please enter the hourly wage in $ ');
Pay = t*h;
if t > 40
    Pay = Pay + (t - 40) * 0.5 * h;
end
fprintf('The worker''s pay is $ %5.2f', Pay)
%}

% Problem 6 - 3: Water level in water tower
% The program calculates the volume of the water in water tower
%{
h = input ('Please enter the height of the float in meter ');
if h > 33
    disp('ERROR. The height cannot be larger than 33 m.')
elseif h < 0
    disp('ERROR. The height cannot be a negative number')
elseif h <= 19
    v = pi*12.5 ^ 2*h;
    fprintf('The volume of the water is %7.5f cubic meter.\n',v)
else
    rh = 12.5 + 10.5*(h - 19)/14;
    v = pi*12.5^2*19 + pi*(h-19)*(12.5^2 + 12.5*rh + rh^2)/3;
    fprintf('The volume of the water is %7.5f cubic meter.\n',v)
end

%}
    
% Section 6.3
% The s w i t c h - c a s e statement o t h e r w i s e - optional

% Probelm 6 - 4:
% Converting units of energy: joule, ft-lb, cal, eV
%{
Ein = input('Enter the value of the energy (work) to be converted: ');
EinUnits = input('Enter the current units (J, ft-lb, cal, or eV): ','s');
EoutUnits = input('Enter the new units (J, ft-lb, cal, or eV): ','s');

error = 0;
switch EinUnits
    case 'J'
        EJ = Ein;
    case 'ft-lb'
        EJ = Ein/0.738;
    case 'cal'
        EJ = Ein/0.239;
    case 'eV'
        EJ = Ein/6.24e18;
    otherwise
        error = 1;
end   

switch EoutUnits
    case 'J'
        Eout = EJ;
    case 'ft-lb'
        Eout = EJ*0.738;
    case 'cal'
        Eout = EJ*0.239;
    case 'eV'
        Eout = EJ*6.24e18;
    otherwise
        error = 1;
end   

if error
    disp('ERROR current or new units are typed incorrectly.')
else
    fprintf('E = %g %s',Eout ,EoutUnits)
    
end

%}

% Section 6.4 LOOPs
% Each round of execution is called pass
% for - end loops: the number of passes is specified when the loop starts
% while - end loops: the number of passes is not known
% for k = start: step: finish
% end
% NB element-by-element operations (Ch7 & Ch8) are faster than loops (ch6)

% Probolem 6 - 5 Sum of series 
%{
n = input('Enter the number of terms ');
S = 0; 
for k = 1:n
    S = S + (-1)^k*k/2^k;
end
fprintf('The sum of the series is: %f',S)

% Taylor series representation of sin(x) function
% function y = Tsin(x,m)
x = input('Enter the number of dergees');
m = input('Enter the number of terms');

xr = x * pi/180;
y = 0;
for k = 0 : m -1
    y = y + (-1)^k*xr^(2*k+1)/factorial(2*k+1);
end

%}
    
% Problem 6 - 6: Modify vector elements
% A vector V is given. Write a program that doubles positive elements,
% and are divisible by 3 or 5, and raises to the power of 3
% the elements that are negative but greater than -5
%{
V = [5, 17, -3, 8, 0, -7, 12, 15, 20, -6, 6, 4, -2, 16];
n = length(V);
for k = 1 : 1: n
    if V(k)>0 & (rem(V(k),3) == 0 |rem (V(k),5) == 0)
        V(k) = 2*V(k);
    elseif V(k) < 0 & V(k) > -5
        V(k) = V(k)^ 3;
    end
end
V
%}

% NB In case of indefinite while loop use CTRL + C or CTRL + BREAK
% Problem 6 - 7:
% Taylor Seria representation of exp(x)
%{
% User enter x
% stop calculating when absolute value od adding tem is smaller than 0.0001
% but limit of number of passes is 30

x = input('Enter x ');
n = 1; an = 1; S = an;
while abs(an) >= 0.0001 & n <= 200
    an = x^n/factorial(n);
    S = S + an;
    n = n + 1;
end

if n >= 200
    disp('More than 30 terms are needed')
else
    
fprintf('exp(%f) = %f', x,S)
fprintf('\nThe number of terms used is: %i',n)
end
    
    %}

%Problem 6 - 8 Creating a matrix with a loop 
%{
n = input('Enter the number of rows');
m = input ('Enter the number of columns');
A = [];
for k = 1 : n
    for h = 1 : m
        if k == 1
            A(k,h) = h;
        elseif h == 1
            A(k,h) = k;
        else
            A(k,h) = A(k, h-1) + A (k-1, h);
        end
    end
end
A
%}

% NB b r e a k and c o n t i n u e
% break - finishes circle
% continue - finishes current pass and another one
    
% Problem 6 - 9 Withdrawing from a retirement account
%{
% A person in retirement is depositin $300 000 in saving account that pays
% 5% interest per year. The person plans to withdraw money from the account
% once a year. He starts by withdrawing $25 000 after the first year, and
% the future years he increases the amount he withdraws according to the
% inflation rate. For example, if he inflation rate 3%, he withdraws $25750
% after second year. Calculate the number of years the money in the account
% will last assuming a constant yearly inflation rate 2%. Make a plot that 
% shows the yearly withdrawals and the balance of the account over the years.

rate = 0.05; inf = 0.02;
clear W AB year
year(1) = 0;
W (1) = 0;
AB (1) = 300000;
Wnext = 25000;
ABnext = 300000*(1 + rate);
n = 2;
    while ABnext >= Wnext
        year(n) = n - 1;
        W(n) = Wnext;
        AB(n) = ABnext - W(n);
        ABnext = AB(n) * (1 + rate);
        Wnext = W(n) * (1 + inf);
        n = n + 1;
    end
fprintf('The money will last for %f years', year(n-1))
bar(year,[AB' W'], 2.0)
%}

% Problem 6 - 10 Creating a random list
% This program generate the random order which singers will perform
%{
n = 6;
L(1) = randi(n);
for p = 2 : n
    L(p) = randi (n);
    r = 0;
    while r == 0
        r = 1;
        for k = 1 : p -1
            if L(k) == L(p)
                L(p) = randi(n);
                r = 0;
                break
            end
        end
    end
end

for i = 1 : n
    switch L(i)
        case 1
            disp('John')
        case 2
            disp('Mary')
        case 3
            disp('Tracy')
        case 4
            disp('Mike')   
        case 5
            disp('Katie')
        case 6
            disp('David')
    end
end
    
%}
 
% Problem 6 - 11 Flight of a model rocket
% Write a program that calculates and plots the speed and altitude of the
% rocket as a function of the time during the flight

%{
% In the computer program the nflkight of rocket is dived into 3 segments
% Each of the represented by a    w h i l e loop:
% 1st engine is on
% 2nd the motion from when engine stops untill the parachute opens
% 3rd the motion from when parachute opens until the rocket hits the ground

m = 0.05; g = 9.81; tEngine = 0.15; Force = 16; vChute = -20; Dt = 0.01;
clear t v h
n = 1;
t(n) = 0; v(n) = 0; h(n) = 0; 
%Segment 1
a1 = (Force - m*g)/m;
while t(n) < tEngine & n < 50000
    n = n + 1;
    t(n) = t(n - 1) + Dt;
    v(n) = a1 * t(n);
    h(n) = 0.5*a1*t(n)^2;
end
v1 = v(n); h1 = h(n); t1 = t(n);

%Segment 2
while v(n) >= vChute & n < 50000
    n = n + 1;
    t(n) = t(n-1) + Dt;
    v(n) = v1 - g*(t(n) - t1);
    h(n) = h1 + v1*(t(n) - t1) - 0.5*g*(t(n) - t1)^2;
end
v2 = v(n); h2 = h(n); t2 = t(n);
    
%Segment 3
while h(n) > 0 & n < 50000
    n = n + 1;
    t(n) = t(n-1) + Dt;
    v(n) = vChute;
    h(n) = h2 + vChute*(t(n) - t2);
end

subplot(1, 2, 1)
plot(t, h, t2, h2, 'o')
subplot(1, 2, 2)
plot(t, v, t2, v2, 'o')

% NB If the times are determinted first, it is possible also to use 
% element-by-element calculations instead of loops
    
%}

% Probl6 - 12: AAC to DC converter
% Source than Diod consequently, but C and R in parallel to the source
% The voltage of the source: vs = v0 * sin(w*t)
% w = 2*pi*f
% when the diod is on:
% vr = v0 * sin(w*t)
% ir = v0 * sin(w*t)/R
% ic = w*C* v0 * cos(w*t) - the current in the capacitor
% Whethe diod is off, the voltage across the resistor is given by:
% vr = v0 * sin(w*tA)*exp(-(t-ta))/(RC)
% the times when the diod is switched off are calculated from the condition
% ir = ic. The diod swirched on again when the voltage of the source raches
% the voltage across the resistor

% Write a MATLAB program that plots the voltage across the resistor vr 
% and the voltage of the source vs as function of time 
% for t belong to the interval (0 - 70) ms

% This program calculateds vr: 1st when the diod is on, 2nd when the diod
% is off

V0 = 12; C = 45e-6; R = 1800; f = 60;
Tf = 70e-3; w = 2*pi*f;
clear t VR Vs
t = 0:0.05e-3:Tf;
n = length(t);
state = 'on'
for i = 1 : n
    Vs(i) = V0 * sin(w*t(i)); % Calculate the voltage of the source at time t
    switch state                 
        case 'on'
            VR(i) = Vs(i);
            iR = Vs(i)/R;
            iC = w * C * V0 * cos(w*t(i));
            sumI = iR + iC;
            if sumI <= 0
                state = 'off';
                tA = t(i);
            end
        case 'off'
            VR(i) = V0*sin(w*tA)*exp(-(t(i)-tA)/(R*C));
            if Vs(i) >= VR(i)
                state= 'on';
            end
    end
end
plot(t,Vs,':',t,VR,'k','linewidth',1)
xlabel('Time (s)'); ylabel ('Voltage (V)')



% For Home work: 4, 9, 10, 12, 23, 29, 34
