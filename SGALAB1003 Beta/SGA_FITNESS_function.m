  function [ fitness ] = SGA_FITNESS_function( x1 , x2, x3 )

% /*M-FILE FUNCTION SGA_FITNESS_function MMM SGALAB */ %
% /*==================================================================================================
%   Simple Genetic Algorithm Pro Toolbox for Matlab 7.x
% ====================================================================================================

%File description:
%
%       Fitness_function Function is an example fitness function 
%       Of Simple Genetic Algorithm Program (Version 1.0.0.3 )
%       Support multi-dimesion parameters

%Input:
%          User define-- in the format ( x1, x2, x3,... )
%Output:
%          fitness--     is the fitness value

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
%27-Jun-2003 Chen Yi Initial version       chen_yi2000@sina.com  Chongqing
%14-Jan-2005 Chen Yi update 1003           chenyi2005@gmail.com  Shanghai 
%HISTORY$
%==================================================================================================*/


%SGA_FITNESS_function begin

%User can design their own fitness function here in Matlab style
      fitness = 0.5 - ( sin( sqrt( x1^2 + x2^2 ) ) ^ 2 - 0.5 ) / ( ( 1 + 0.001 * ( x1^2 + x2^2 )) ^2 )+x3;
%      
%SGA_FITNESS_function end