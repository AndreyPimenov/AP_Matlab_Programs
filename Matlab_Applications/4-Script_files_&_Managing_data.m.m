% Chapter 4 Using Script Files and Managing Data

% the Command Window and script files share the same memory zone within the
% computer. This implies that once a variable is in the workspace, it is
% recognized and can be used, and it can be reassigned new values, in both
% the Command Window and script files. 

% NB: there is another type of file in MATLAB, called a function file,
% where variables can also be defined. These variables, however, are 
% normally not shared with other parts of the program since they use 
% a separate workspace. 

% INPUT TO A SCRIPT FILE
% When a script file is executed, the variables that are used in the
% calculations within the file must have assigned values. In other words,
% the variables must be in the workspace. The assignment of value to a
% variable can be done in three ways, depending on where and how the
% variable is defined.

% 1. The variable is defined and assigned a value in the script file
% 2. The variable is defined and assigned a value in the Command Window
% 3. The variable is defined in the script file, but a specific value
% is entered in the Command Window when the script file is executed
% Exp of 3rd type is interrface: "please enter the variable"

% OUTPUT COMMANDS
% The commands that generaly used to generate the output are d i s p and
% f p r i n t f. The d i s p command displays the output to the screen, 
% while the f p r i n t f command can be used to display the output on the
% screen ot to save the output to a file. The commands can be used in the 
% Command Window, in script file, and, as will be shown later, in a 
% function file.

% f p r i n t f - formated output
% \n - new line
% \b - backspace
% \t - horizontal tab
% The % sign marks the spot where the number is inserted within the text
% Conversation characters: eE f gG i 

% Writing output to a file requires three steps:
% a) Opening a file using the f o p e n command
% b) Writing the output to the open file using the f p r i n t f command
% c) Closing the file using the f c l o s e command

% it is possible to use the f p r i n t f command to write to several 
% different files. This is done by first opening the files, assigning
% a different f i d to each (eg. fid1, fid2, fid3, etc.) and then using 
% the fid of specific file in the f p r i n t f command to write to that
% file

% Script file in which fprinf is used to write output to files
% two conversation tables are created and saved to two different files
% One converts mi/h to km/h the other converts lb to N
clear all
Vmph = 10:10:100; % creating a vector of velocities in mi/h
Vkmh = Vmph.* 1.609; % converting mph to km/h
TBL1 = [Vmph, Vkmh]; % creating a table (matrix) with 2 rows
Flb = 200:200:2000; % creating a vector of forces in lb 
FN = Flb.*4.448; % converting lb to N
TBL2 = [Flb; FN];
fid1 = fopen('VmphtoVkm.txt', 'w'); 
fid2 = fopen('FlbtoFN.txt', 'w');

% writing a title and empthy line to the file fid1
fprintf(fid1, 'Velocity Conversation Table \n \n');
% writing two column headings to the file fid1
fprintf(fid1, ' mi/h km/h \n'); 
% writing the data from variable TBL1 to the file fid1
fprintf(fid1, ' %8.2f %8.2f\n', TBL1);

% writing the force converation table (data in variable TBL2) to the fid2
fprintf(fid2, 'Force Conversatrion Table \n \n');
fprintf(fid2, '     Pounds Newtons \n');
fprintf(fid2, ' %8.2f %8.2f\n', TBL2); 

% closing the files fid1 and fid2
fclose(fid1);
fclose(fid2);

% The SAVE and LOAD commnads
% DfT=load('FlbtoFN.txt') % Only matrix types

% Importing and Exporting data from Excel:
% variable_name = xlsread('filename', 'sheet_name')
% xlswrite('filename', variable_name)

% USING the Import Wizard - additional big and important topic!
% it is activate by selecting IMPORT DATA in the FILE menu

% Problem 2 Height and surface area of a silo
% A cylindrical silo with radius r has a spherical cap roof with radius R
% H - the height of cylindrical portion
% TO DO: write a program in a script file that determines the height H for
% given values of r and R, and the volume V.
% In addition calculate the surface of the silo

% Idea: 
% step 1: Vsilo = Vcyl + Vcap -> H = (Vsilo - V cap)/(pi*r^2)
% step 2: Ssilo = Scyl + Scap = 2*pi(r*H + R*h)
r =30; R=45; V=200000; 
theta = asin(r/R);
h = R*(1 - cos(theta));
Vcap = pi*h^2*(3*R-h)/3;
H = (V - Vcap)/(pi*r^2);
S = 2*pi*(r*H + R*h);
fprintf('The height H is: %f ft. \n', H)
fprintf('The surface area of the silo is: %f square ft.\n', S)

% Problem 3 Centroid of composite area
% Idea: 
% step 1: Calculte simpolified area (think that there is no holes at all)
% step 2: extract the holes surfaces
clear C xs ys As
C = [100 100 200*200
60-80/pi 200+80/pi pi*60^2/4
60+140/3 220 140*60/2
200/(3*pi) 100 -pi*50^2/2
105 145 -50*50
150 95 -40*150];
%C = input ('Enter a matrix in which each row has three elements.\n In each row enter x and y coordinates of the centroid area of a section\n');

xs = C(:,1)'; % creating row vector for the x coordinte of each section
ys = C(:,2)'; % creating row vector for the y coordinte of each section
As = C(:,3)'; % creating row vector for the AREA of each section

A = sum(As);  % calculate the total area
x = sum(As.*xs)/A;
y = sum(As.*ys)/A;
fprintf('The coordinates of the centroid are: (%f, %f)\n', x, y)

% Problem 4 Voltage divider
% when several resistor in an electircal circuit in series, the voltage 
% across each of them is given by the voltage divider
vs = input('Please enter the source voltage'); %24;
Rn = input('Enter the values of the resistors as elements in a row vector');
% R1 = 20; R2 = 14; R3 = 12; R4 = 18; R5 = 8; R6 = 15; R7 = 10;

Req = sum(Rn);
vn = Rn*vs/Req;

% calculate the power in each resistor
Pn = Rn*vs^2/Req^2;
i = vs/Req;
Ptotal = vs*i;

% Display results
Table = [Rn', vn', Pn'];
disp(' ')
disp(' Resistance Voltage Power ')
disp(' (Ohms) (Volts) (Watts) ')
disp(' ')
disp(Table)
disp(' ')

fprintf ('The current in the circuit is %f Amps.', i)
fprintf ('\nThe total power dissipated in the circuit is %f Watts.', Ptotal); 
