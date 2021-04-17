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
