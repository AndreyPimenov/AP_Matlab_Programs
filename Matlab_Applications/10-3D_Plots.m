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

% Sample - Problem 10-1: 3-D projectile trajectory
v0 = 250; g = 9.81; theta = 65;
x0 = 3000; vx = -30;
v0z = v0*sin(theta*pi/180);
v0y = v0*cos(theta*pi/180);
t = 2*v0z/g;
tplot = linspace(0,t,100);
z = v0z*tplot - 0.5*g*tplot.^2;
y = v0y*tplot;
x = x0 + vx*tplot
xnowind (1:length(y)) = x0; % constant x cooerdinate when npo wind
plot3(x,y,z,'r-',xnowind,y,z,'g--')
grid on
axis([0 6000 0 6000 0 2800])
xlabel('x'); ylabel('y'); zlabel('z');

% Sample - Problem 10-2: Electric potential of 2 point charges
% The electric field of two or more particles is calculated by using
% superposition
% The porblem is solved by following steps:
% a) Grid is created in xy plane with the domain x,y = [-0.2; 0.2] 
% b) The distance from each grid point to each of the charges is calculated
% c) The electric potential at each point is calculated
% d) The electric potential os plotted
eps0 = 8.85e-12; q1 = 2e-10; q2 = 3e-10;
k = 1 / (4*pi*eps0);
x = -0.2: 0.01 : 0.2;
y = -0.2: 0.01 : 0.2;
[X, Y] = meshgrid(x,y);
r1 = sqrt((X+0.25).^2 + Y.^2);
r2 = sqrt((X-0.25).^2 + Y.^2);
V = k*(q1./r1 + q2./r2);
mesh(X,Y,V)
xlabel('x (m)'); ylabel('y (m)'); zlabel('V (V)');

% Sample Problem 10-3: Heat conduction in a square plane
% The temperature distribution T(x,y) in the plate can be determined
% by solving the 2-D heat equation. For the given boundary conditions
% T(x,y) can be expressed analytically by Fourier series.
% (read advanced engineering mathematics)
% a) Create X,Y grid in the domain; a,b = 20,16 segments respectavailly  
% b) Calculate the T at each point of the mesh. Calculations are done
%    point by point using a double loop. At each point the temperature 
%    is determined by adding k terms of the Fourier series.
% c) make a surface plit of T
a = 5; b = 4; na =200; nb =106; k =50; T0 = 80;
clear T
x = linspace(0,a,na);
y = linspace(0,b,nb);
[X,Y] = meshgrid (x,y); % creating a grid in teh x y plane 
for i = 1:nb            % 1st loop is the index of the grid's row 
    for j =1:na         % 2nd loop is the index of the grid's column   
        T(i,j)=0;
        for n=1:k       % 3rd loop is nth term of Fourier series
            ns = 2*n -1; % k is the number of terms
        T(i,j) = T(i,j)+sin(ns*pi*X(i,j)/a).*sinh(ns*pi*Y(i,j)/a)/(sinh(ns*pi*b/a)*ns);
        end
        T(i,j) = T(i,j) * 4 * T0 / pi;
    end
end
mesh(X,Y,T)
xlabel('x (m)'); ylabel('y (m)'); zlabel('T (^oC)');
view(120,130);

