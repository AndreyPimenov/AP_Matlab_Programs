clc
clear all;

x = 3;

% A user-defined function ia MATLAB file that is created by user, saved as 
% function file, and then used like a build-in function
% In many cases this is a subprogram.
% Schematically: Input data --> Function File --> Output data
% Simularities and differences b/n Script filae and Function files:
%     Script Files          |        Function files
% --------------------------|-----------------------------
%  saved with extencipn .m  | saved with extencipn .m
% --------------------------|-----------------------------
%            any line       | first line should function definition line
% --------------------------|-----------------------------
%  variables are recognised | variables are local
%   in the Command Window   |
% --------------------------|-----------------------------
%  can use variables that   | can accept data through input arguments 
%  defined in the workspace | and can return data through
%  -------------------------| output arguments
%  contain sequence of      |  
%  MATLAB commands          | 
%  -------------------------|-----------------------------
%                           | The name of the file should be 
%                           | the same as the name of the function
% --------------------------|-----------------------------
% A user-defined function is used in the same way as a built-in function.
% it can be (used) in the Command Window, in a script file, or in 
% another function.
% --------------------------------------------------------
%
% 7.8 Anonymous Fucntions
% User-defined function could be used several times in the complex
% calculations & large copmuter programs.
% An anonymous function is a user-defined function that defined and written
% within the computer code (not in a separate funtion file) and it used in
% the code. 
% N.B. >>> Anonymous function can be defined in any part of MATLAB (in the
% Command Window, in script files, and inside regular user-defined
% functions). 
% name = @ (arlist) mathematical expression
% arlist - a list of input arguments (independent variables)
% Examples:


cube = @(x) x ^ 3
circle = @(x,y) 16*x^2 + 9*y^2
parabola = @(x) a*x^2 + b*x + c





