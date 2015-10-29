function [ fitness_value,error_status ] = SGA_FITNESS_evaluating( decimal_space );

% /* M-FILE FUNCTION SGA_FITNESS_evaluating MMM SGALAB */ 
% /*==================================================================================================
%    Simple Genetic Algorithm Pro Toolbox for Matlab 7.x
% ====================================================================================================
%File description:
%      Fitness Function Of Simple Genetic Algorithm Program (Version 1.0.0.3 )
%      Support multi-dimesion parameters
%
%      This function is to find out  fitness value after decoded from binary_space
%       to decimal_space.
%
%Input:
%            decimal_step-- is the search step in decimal space

%Output:
%            fitness_value-- is fitness value of result
%                            '\0' is in error
%            error_status =    0 -- ok
%                              1 -- invalid parameter
%                              2 -- too many input arguments 


%Appendix comments:

%Usage:
% [ fitness_value ] = SGA_FITNESS_evaluating( decimal_space );

%   this function is based on  SGA_FITNESS_function.m 
%   you need to define your SGA_FITNESS_function.m first!!

%Example1:
%
% function deccripion : f(x)=1./a+sin(b)+exp(c)+log2(d)+10 ,
%                                a,b,c,d belong to [1,7],[2,8],[3,9],[4,10]
%
% [binary_space,bits_sum,bits]=SGA_encoding([1,2,3,4],[7,8,9,10],10,[0.01,0.01,0.01,0.01])
%
% [decimal_space]=SGA_decoding([1,2,3,4],[7,8,9,10],binary_space,bits)
%
% [fitness_value]=SGA_FITNESS_evaluating(decimal_space)
%
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
%Date          Name     Description of Change  email                 Location
%27-Jun-2003   Chen Yi  Initial version        chen_yi2000@sina.com  Chongqing
%14-Jan-2005   Chen Yi  update 1003            chenyi2005@gmail.com  Shanghai 
%HISTORY$
%==================================================================================================*/

% SGA_FITNESS_evaluating Begin     
error_status = 1 ; 

      [ population , parameter_numbers ] = size( decimal_space );
  % check input parameter          
 if ( ( population <= 0 ) || ( parameter_numbers <= 0) )
 
         error_status = 1 ; 
         
         fitness_value = NaN;
        
         disp('Invalid Input function parameter ->''decimal_space'', pls Check the input of SGA_FITNESS_evaluating()')
         
         return ;
         
         
 end % end if
 %     Normally functions return when the end of the function is reached.
 %     A RETURN statement can be used to force an early return.
        decimal_space_cell = cell( population , parameter_numbers );
        
% transfor matrix to cell as the input parameter list
     
          for idx = 1 : 1 : population
          
                for jdx = 1 : 1 : parameter_numbers
             
                    decimal_space_cell{ idx , jdx } = decimal_space( idx , jdx );
                
                end
             
               fitness_value( idx ) = SGA_FITNESS_function( decimal_space_cell{ idx , 1 : 1 : parameter_numbers } ) ;

         end
         
  error_status = 0 ; 
  
%end of SGA_FITNESS_evaluating