function [ binary_pool ,error_status ] = SGA__binary_uniformly_encoding( population , total_binary_length )

% /*M-FILE FUNCTION SGA__binary_uniformly_encoding MMM SGALAB */ 
% /*==================================================================================================
%  Simple Genetic Algorithm Pro Toolbox for Matlab 7.x
% ====================================================================================================
%File description:
%    SGA__binary_uniformly_encoding() is to generate data for Genetic Algorithms' operators
%       where:        
%       we use randint() to Generate matrix of 
%       uniformly distributed random integers 

%  e.g.                              x1   x2   x3   x4  x...
%      binary_pool  = [ populaton1: 1010|0001|1010|0101|...
%                       populaton2: 1000|0101|1110|1101|...
%                       populaton3: 1011|0011|1011|1101|...
%                        ...                               ]
%Input:
%      population          -- population of each geration
%      total_binary_length -- length of chromosome in binary format

%Output:
%      binary_pool -- binary data matrix of population*total_binary_length

%      error_status =    0 -- ok
%                       !0 -- fail

%Appendix comments:

% see the Description of randint():
% out = randint generates a random scalar that is either 0 or 1,
% in uniformly distributed with equal probability.

% more info see " help randint "

%Usage:
%[ binary_pool ,error_status ] = SGA__binary_uniformly_encoding( population ,
%                                                            total_binary_length )


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
%Date          Name     Description of Change  email                 where
%27-Jun-2003   Chen Yi  Initial version        chen_yi2000@sina.com  CQU
%14-Jun-2005   Chen Yi  update 1003            chenyi2005@gmail.com  UGS 
%HISTORY$
%==================================================================================================*/

%SGA__binary_uniformly_encoding Begin
error_status = 0 ;
 
% input check
if ( nargin ~= 2 | population <=0 | total_binary_length <=0 )

    disp('SGA__binary_uniformly_encoding() input error')
    error_status = 1 ;

    return ;

end

binary_pool = randint( population , total_binary_length );
        
%SGA__binary_uniformly_encoding End