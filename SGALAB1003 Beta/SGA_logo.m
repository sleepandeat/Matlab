% /*M-FILE SCRIPT SGA_logo MMM SGALAB */ %
% /*==================================================================================================
%  Simple Genetic Algorithm Laboratory Toolbox for Matlab 7.x
% ====================================================================================================
%File description:
% to load SGALAB Logo for 1 second
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
% SGA_logo Begin 

%% set screen 
home ;
disp('SGALAB Logo load...Done')
close('all')    ;

SGA_LOGO_H=figure('visible','off');
set(SGA_LOGO_H,'NumberTitle','off');
set(SGA_LOGO_H,'name','SGALAB LOGO by Chen Yi (chenyi2005@gmail.com)');
set(SGA_LOGO_H,'MenuBar','none');
set(SGA_LOGO_H,'color',[1 1 1]);
set(SGA_LOGO_H,'visible','on');

% read logo from file to matlab
SGA_work_path =  cd ;

[ SGALAB_LOGO_LOAD ] = imread(strcat(SGA_work_path,'\SGALAB_Start_Logo.jpg'));
 
%display logo in matlab

imshow(SGALAB_LOGO_LOAD)
axis off;
grid off;
%title('SGALAB 1003 Loading...');
pause(1); % pause 1 second , then close logo
close(SGA_LOGO_H);
% SGA_logo End 