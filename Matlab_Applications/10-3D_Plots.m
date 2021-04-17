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
% ------------------------------------

% 10.3 Plots with Special Graphics
% Plot a Sphere:
[X, Y, Z] = sphere (50);
surf (X,Y,Z)

% Plot a Cylinder:
t = linspace (0, pi, 50);
r = 1.5 + sin(t);
[X,Y,Z] = cylinder (r);
surf(X,Y,Z)
axis square

% 3-D Bar plot
Y = [1 6.5 7; 2 6 7; 3 5.5 7; 4 5 7; 3 4 7; 2 3 7; 1 2 7]
bar3(Y)

% 3-D Stem plot
t = 0 : 0.2 :10;
x = t;
y = sin(t);
z = t.^1.5;
stem3(x,y,z,'fill')
grid on
xlabel('x'); ylabel('y'); zlabel('z');
% 3-D Scatter plot
scatter3(x,y,z,'filled')
grid on 
colormap([0.1 0.1 0.1])
xlabel('x'); ylabel('y'); zlabel('z');
axis square

% 3-D Pie Plot
X = [5 9 14 20];
explode = [1 200 5 2];
pie3 (X, explode)
colormap([0.5 0.8 0.3 ])

% Polar coordinates grid in the xy plane:
% 1st step: Create grid of values theta and r with the m e s h g r i d function
% 2nd step: Calculate the value of z at each point of the grid
% 3rd step: Convert the polar coordinates to a gris in Cartesian coordinates with  p o l 2 c a r t function
% 4th step: Make a 3-D plot using the values of z and the Cartesian coordinates
[th, r] = meshgrid ((0:5:360)*pi/180, 0:.1 :2);
Z = r.*th;
[X,Y] = pol2cart(th,r);
mesh(X,Y,Z)
surf(X,Y,Z)
axis square

% 10.4 The v i e w Command
%
% The v i e w command controls the direction from which the plot is viewed.
% This is done by specifying a direction in terms of azimuth and elevation
% angles. To set the viewing angle of the plot, the view command has the
% form: view(az, el) or view([az,el])
% az - azimuth, which is angle (in degrees) un the xy plane measured relative to
%      the negative y axis direction and defined as positive in the
%      counterclockwise direction.
% el - angle of elevation (in degrees) from xy plane. A positive value
%      corresponds to openening an angle in the direction of the z axis
% The default view angles are: az = - 37.5 and el = 30
x = -3 : 0.25 :3;
y = -3 : 0.25 :3;
[X, Y] = meshgrid (x, y);
Z = 1.8.^(-1.5*sqrt(X.^2 + Y.^2)).*cos(0.5*Y).*sin(X);
surf(X,Y,Z)
view(20,35)

% N.B.>> 
% xy top view  az = 0 el = 90
% xz side view az = 0 el = 0
% yz side view az = 90 el = 0
view(0,0)
view(90,0)

% Examples:
t = 0 : 0.1 : 6*pi;
x = sqrt(t).*sin(2*t)
y = sqrt(t).*cos(2*t)
z = 0.5*t;
plot3(x,y,z,'k','linewidth',1)
view(0,90) % is equal view(2)
grid on
xlabel('x'); ylabel('y'); zlabel('z');
view (3) % default

%--------------------------------------
