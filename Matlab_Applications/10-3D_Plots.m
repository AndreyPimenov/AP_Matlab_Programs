% Three - Dimensional Plots
% Do not hesiate to use: "Plotting and Data Visualization"

% 10.1 Line Plots
% plot3(x,y,z, 'line specifiers', 'PropertyName', property value)
% 'line specifiers' - define the type and color of the line and markers
% property value - specify the line width, and marker's size, and edge and
% fill colors
%
% 1) The 3 vectors with the coordinates of the data points must have the
% same number of elements
% 2) The line specifiers are the same as in 2-D plots.
% Example 1:
t = 0: 0.1 : 6*pi;
x = sqrt(t).*sin(2*t);
y = sqrt(t).*cos(2*t);
z = 0.5*t;
plot3(x,y,z,'k','linewidth',1);
grid on
xlabel('x'); ylabel('y'); zlabel('z');
% ------------------------------------

% 10.2 Mesh and Surface Plots
% Mesh & surface plots are 3-D plots used the plotting functions of the
% form z = f(x,y), where x and y are independent variables, z - dependent
% 1st step create a grid of XY plane that covers the domain of the function
% 2nd step calculate the value of z at each point of the grid
% 3rd step create the plot
% 1st step: creating a grid
x = -1 :0.1: 3; % vector that divides the domain of x
y = 1 :0.1: 4;  % vector that divides the domain of y
[X, Y] = meshgrid(x,y) % X,Y - matrises of x,y coordiunates respectevily

% 2nd step: z values calculations
Z = X.*Y.^2./(X.^2 + Y.^2)

% 3rs step: makinga mesh and surface plots:
mesh(X,Y,Z) % or surf (X,Y,Z)
xlabel('x'); ylabel('y'); zlabel('z');
grid off % usefull for nice pictures for dissertation
box on

% Examples:
x = -3 :0.25 : 3;
y = -3 :0.25 : 3;
[X, Y] = meshgrid(x,y);

Z = 1.8.^(-1.5*sqrt(X.^2 + Y.^2)).*cos(0.5*Y).*sin(X);
% different types of Graphs:
mesh(X,Y,Z)
meshz(X,Y,Z)
meshc(X,Y,Z)

surf(X,Y,Z)
surfc(X,Y,Z)
surfl(X,Y,Z)

waterfall(X,Y,Z)
contour3(X,Y,Z,55) %where n = 55 is the number of countor levels
contour(X,Y,Z,55) %where n = 55 is the number of countor levels
xlabel('x'); ylabel('y'); zlabel('z');
