% /*M-FILE SCRIPT SGA_about MMM SGALAB */ %
% /*==================================================================================================
%  Simple Genetic Algorithm Laboratory Toolbox for Matlab 7.x
% ====================================================================================================
%File description:
% to load SGALAB about figure
%
%Appendix comments:

%Usage:

%===================================================================================================
%  See Also:         SGA_ENCODING ,
%                    SGA_DECODING ,
%                    SGA_SELECTION ,
%                    SGA_CROSSOVER,
%                    SGA_MUTATION,
%                    SGA_FITNESS_FUNCTION, 
%                    SGA_FITNESS_EVALUATING, 
%                    SGA_BENCHMARK_FUNCS,
%                    SGALAB		
%
%===================================================================================================


%===================================================================================================
%Revision -
%Date        Name    Description of Change email                 Location
%14-Jan-2005 Chen Yi Initial version       chenyi2005@gmail.com  Shanghai 
%HISTORY$
%==================================================================================================*/
% SGA_about Begin 

%% set screen 
home ;
disp('SGALAB about load...Done')
close('all')    ;
home ;

disp('SGALAB About load...Done')

SGA_ABOUT_H=figure('visible','off');
set(SGA_ABOUT_H,'NumberTitle','off');
set(SGA_ABOUT_H,'name','SGALAB ABOUT');
set(SGA_ABOUT_H,'MenuBar','none');
set(SGA_ABOUT_H,'color',[1 1 1]);
set(SGA_ABOUT_H,'visible','on');
% read logo from file to matlab
SGA_work_path =  cd ;
[ SGALAB_ABOUT_LOAD ] = imread(strcat(SGA_work_path,'\SGALAB_ABOUT.jpg'));
 
%display logo in matlab

%SGA_ABOUT_H = figure('Position',[scrsz(4)/2.5 scrsz(4)/2.5 scrsz(3)/2.5 scrsz(4)/2]);
imshow(SGALAB_ABOUT_LOAD)
axis off;
grid off;

%pause(1); % pause 1 second , then close logo
%close(SGA_ABOUT_H);
% SGA_about End 
