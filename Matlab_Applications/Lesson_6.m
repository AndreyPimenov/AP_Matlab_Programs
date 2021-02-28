clear all
close all % (n) - close the nth Figure Window 
clc

% Two-Dimensional Plots
% Problem set: 1, 2, 3, 4, 26, 27, 34, 35, 39, 40
%x = input('Enter the X coordintaes in a row vector');
%y = input('Enter the Y coordintaes in a row vector');
%plot(x,y, 'Line Specifier', 'PropertyName', PropertyValue)

% Line Specifiers:
% Line Style:
% solid(default) -
% dashed         --
% dotted         :
% dash-dot       -.
% Line Color:
% red            r
% green          g
% blue           b
% cyan           c
% magenta        m
% yellow         y
% black          k
% white          w
% Marker Type:
% plus sign      +
% circle         o
% asterisk       *
% point          .
% cross          x
% triangle(pointed up) ^
% triangle(pointed down) v
% square         s
% diamond        d
% five-pointed star p
% six-pointed star h
% triangle (pointed left) <
% triangle (pointed right) >

% Property name:
% linewidth         a number in units of points (default 0.5)
% markersize        a number in units of points
% markeredgecolor   color specifiers
% markerfacecolor   color specifiers

% Plot of Function
%x = [-2:0.01:4];
%y = 3.5.^(-0.5*x).*cos(6*x);
%plot(x,y)

% The f p l o t command
% the fplot command plots a function with the form y = f(x) between
% specified limits. The limits argument is a vector with two elements
% that specify the domain of x[xmin, xmax], or a vector with 4 elements 
% that specifies the domain of x and the limits of the y-axis
% [xmin, xmax, ymin, ymax]
%fplot('x^2+4*sin(2*x)-1', [-3 3])

% problem 1.  Plotting a function and its derivatives
% Creates vector x with domain of the function
%{
x = [-2:0.01:4];
y = 3*x.^3-26*x+6;
yd = 9*x.^2-26;
ydd = 18*x;
%}

%Way I:
%plot(x,y,'-b',x,yd,'--r',x,ydd,':k')

% Way II: (using h o l d _ o n and h o l d _ o f f commands
%{
plot(x,y,'-b')
hold on

plot(x, yd, '--r')
plot(x, ydd, ':k')
hold off
%}

% Way III: (l i n e command)
%{
plot(x,y, 'LineStyle', '-', 'color', 'b')
line(x,yd,'LineStyle', '--', 'color', 'r')
line(x,ydd, 'LineStyle',':','color','k')

% Formating a Plot Using Commands
% The xlabel and ylabel commands:
xlabel('There is a X axis')
ylabel('There is a Y axis')
title('Title is here')
%}

%text(2,2,'any other text as string')
%gtext('text as string')

% The l e g e n d commnad:
% The legend command places a legend on the plot.
%pos = 0;
%legend('string1', 'string2')
% pos = -1 Places the legend outside the axes boundaries on the right side
% pos = 0 Places the legend inside the axes boundaries in a location that
% interferes the least with the graphs
% pos = 1 Places the legend at the upper-right corner of the plot (default)
% pos = 2 Places the legend at the upper-left corner of the plot
% pos = 3 Places the legend at the lower-left corner of the plot
% pos = 4 Places the legend at the lower-right corner of the plot

% String Modifiers:
% \bf bold font 
% \it italic style
% \rm normakl font

% Characters in the string:
% \alpha
% \beta
% \gamma 
% \theta
% \pi
% \sigma
% \Phi
% \Delta
% \Gamma
% \Lambda
% \Omega
% \Sigma

% PropertyName are corresponding possible Property Values:
% Rotation
% FontAngle
% FontName
% FontSize
% FontWeight
% Color
% Background Color
% EdgeColor
% LineWidth

% The a x i s command
% axis([xmin, xmax, ymin, ymax]) 
% axis equal
% axis square
% axis tight

% The g r i d command
% grid on Add grid lines to the plot
% grid off Removes grid lines from the plot

% example 2. 
%{
x = [10:0.01:22];
y = 95000./x.^2;
xd = [10:2:22];
yd = [950 640 460 340 250 180 140];
plot(x,y,'-','LineWidth',1.0)
xlabel('DISTANCE (cm)')
ylabel('INTENSITY (lux)')

% example of formating text inside the t i t l e command
title('\fontname{Arial}Light Intensity as a Function of Distance','FontSize',14)
axis([8 24 0 1200])
text(14,700,'Comparison between theory and experiment.', 'EdgeColor', 'r', 'LineWidth', 2)
hold on
plot (xd, yd, 'ro--', 'linewidth', 1.0, 'markersize', 10)
legend ('Theory', 'Experiment')
hold off
%}

% Formatin plot using the plot editor
% by menu and cliking by mouse

% Plots with Logarithmic Axes
% MATLAB commands for making plots with log axes are:
%semilogy (x,y) % plots y vs x with a log scale for the y axis & linear scale for x
%semilogx (x,y) % plots y vs x with a log scale for the x axis & linear scale for y
%loglog(x,y) % plots y vs x with a locale for both axes

% NB: zero cannot be presented on the log axis
% NB: negative numbers cannot be plotted on log scales

% The error bar command:
%xd = [10:2:22];
%yd = [950 640 460 340 250 180 140];
%ydErr = [30 20 18 35 20 30 10]

%errorbar(xd, yd, ydErr)

%xlabel('DISTANCE (cm)')
%ylabel('INTENSITY (lux)')

% Plots with Special Graphics:
%{
yr = [1988:1994];
sle = [8 12 20 22 18 24 27];
% Vertivcal Bar Plot
% bar(yr, sle, 'r')
% Horisontal bar Plot
% barh(yr,sle)
% Stairs Plot
% stairs(yr,sle)
% Stem Pot
% stem(yr, sle)
xlabel('Year')
ylabel('Sales (Millions)')

grd = [ 18 26 9 5]
pie(grd)
title('Class Grades')

%}

% HISTOGRAMS
%{
% Histograms - are plots that show the distribution of data

% The overall range of given set of data points is divided into subranges
% (bins),and the histogram shows how many data points are in each bin.
% The histogram is a vertical bar plot in which the width of each bar is
% equal to the range of the corresponding bin and the height of the bar
% corresponds to the number of data points in the bin.

% Histograms are created in Matlab with h i s t command

% Polar Plots
% polar(theta, radius, 'line specifiers')
% where theta and radius are vectors whose elements define the
% coordinates of the points to be plotted
t = linspace(0,2*pi,200);
r = 3*cos(0.5*t).^2 + t;
polar (t,r)

% Putting Multiple Plots on the Same Page
% Multiple pots can be created on the same page with subplot command:
% subplot(m, n, p) mxn - sixe, p - current plot. Form lef righ from Hi2Bot
subplot(3,3,4) 

% Multiple figure windows
% It is possible, however, to open additional Figure Window and have
% several of them open (with plots) at the same time. This is done by
% typing the command f i g u r e
fplot('x.*cos(x)', [0, 10])
figure
fplot('exp(-0.2.*x).*cos(x)', [0, 10])

% Plotting using the plots toolstrip
% P L O T S and W o r k s p a c e
% it is possible to swith variable order

%}

% Problem 5 - 2:
% The piston-rod-crank mechanism is used in many enginnering applications
%{
% The crank is rotating at a constant speed of 500 rpm
% Calculate and plot the position, velocity, and aceleration of the piston
% for one revolution of the crank. Make the three plots on the same page.
% Set theta = 0, when t = 0.
THDrpm = 500; r=0.12; c=0.25; % Define theta, r, c
THD=THDrpm*2*pi/60;           % Change the units from rpm to rad/s
tf = 2 * pi/ THD;             % Calculate the time for one revolution of the crank
t = linspace (0, tf, 200);    % Create a vector for time with 200 elements
TH = THD*t;                   % Calculate theta for each t
d2s=c^2-r^2*sin(TH).^2;       % Calculate d2 squared for each theta
x = r * cos(TH) + sqrt(d2s);  % Calculate x for each theta
xd = -r*THD*sin(TH) - (r^2*THD*sin(2*TH))./(2*sqrt(d2s));
xdd= -r*THD^2*cos(TH) - (4*r^2*THD^2*cos(2*TH)).*d2s+(r^2*sin(2*TH)*THD).^2./(4*d2s.^(3/2));
subplot(3,1,1)
plot(t,x)
grid
xlabel('Time(s)')
ylabel('Position(m)')

subplot(3,1,2)
plot(t,xd)
grid
xlabel('Time(s)')
ylabel('Velocity(m/s)')

subplot(3,1,3)
plot(t,xdd)
grid
xlabel('Time(s)')
ylabel('Accelaration(m/s^2)')

%}

% Problem 5 - 3 (1 in the book):
% Plot the function:
x = [-1: 0.01 : 5];
fx = (x.^2 - 3.*x + 7)./(sqrt(2.*x + 5))
plot (x, fx)
grid

% To do:2,3,4,26,27,34,35,39,40

