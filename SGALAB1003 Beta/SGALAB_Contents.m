% /*M-FILE SCRIPT SGALAB_contents MMM SGALAB */ %
% /*==================================================================================================
%  Simple Genetic Algorithm Laboratory Toolbox for Matlab 7.x
% ====================================================================================================
%File description:
% this is the content m file for SGALAB 
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
% SGALAB_contents Begin 
SGALAB_Toolbox_List = list_current_dir_files

% Coding method
%(1)Gray code 
%(2)real code
%%(3)binary code
% SGA__binary_uniformly_encoding --  uniformly distributed random integers  
% SGA__binary_manually_encoding -- binary coding designed or given by user
%(4)messy code
%(5)DNA code

%Selection methods
%(1)roulette wheel selection
%(2)stochastic universal sampling 
%(3)local selection
%(4)truncation selection
%(5)tournament selection

%Crossover methods
%(1) real valued recombination 
% (1-1) discrete recombination
% (1-2) intermediate recombination
% (1-3) linear recombination
% (1-4) extended linear recombination

%(2)binary valued crossover
%(2-1)single-point crossover
%(2-2)multiple-point crossover
%(2-3)uniform crossover
%(2-4)shuffle crossover
%(2-5)crossover with reduced surrogate

%


%Mutation method

%Fitness
% (1) proportional fitness assignment
% (2) rand-based fitness assignment

% SGALAB_contents End 