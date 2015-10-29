function [ decimal_space_mutation , binary_space_mutation,istate ] = SGA__binary_singlepoint_mutation( min_confines , max_confines , decimal_space_crossover , binary_space_crossover , bits , probability_mutation )

% /*M-FILE FUNCTION SGA__binary_singlepoint_mutation MMM SGALAB */ 
% /*==================================================================================================
%                               Simple Genetic Algorithm Pro Toolbox for Matlab 7.x
% ====================================================================================================
%File description:
%     Mutation Function Of Simple Genetic Algorithm Program (Version 1.0.0.3 )
%     support multi-input parameters,  mutation of single point method
%
%Input:
%            min_confines--            is the minimum of input value in decimal-space
%            max_confines--            is the maximum of input value in decimal-space
%            decimal_space_crossover-- is  the search step in decimal space from crossover
%            binary_space_crossover--  is  the search step in binary space from crossover
%    
%            bits--                    is the length of every parameter
%            probability_mutation      is probability for mutation,probability_mutation is given by yourself

%Output:
%            decimal_space_mutation--  is  the search step in decimal space from mutation
%            binary_space_mutation--   is  the search step in binary space from mutation

%            istate--       =    0 -- ok
%                                1 -- invalid parameter
%                                2 -- too many input arguments 

%Appendix comments:

%Usage:
%  [ decimal_space_mutation , binary_space_mutation,istate] = SGA__singlepoint_mutation( min_confines , max_confines , decimal_space_crossover , binary_space_crossover , bits , probability_mutation )


%===================================================================================================
%  See Also:        SGA_DECODING ,
%                   SGA_SELECTION ,
%                   SGA_CROSSOVER,
%                   SGA_MUTATION,
%                   SGA_FITNESS_FUNCTION, 
%                   SGA_FITNESS_EVALUATING, 
%                   SGA_BENCHMARK_FUNCS,
%                   SGALAB		
%
%===================================================================================================

%===================================================================================================
%Revision -
%Date        Name    Description of Change email                 Location
%27-Jun-2003 Chen Yi Initial version       chen_yi2000@sina.com  Chongqing
%14-Jan-2005 Chen Yi update 1003           chenyi2005@gmail.com  Shanghai 
%HISTORY$
%==================================================================================================*/

%SGA__binary_singlepoint_mutation begin
istate = 0 ;
if ( nargin ~= 6 )
    
    error ('SGA__binary_singlepoint_mutation() Error: Input Parameters...');
    decimal_space_mutation = NaN;
    binary_space_mutation = NaN;

    istate = 1 ;

else
%%initialize
  [ population , bits_sum ] = size( binary_space_crossover );
  
  [ population , parameter_numbers] = size( decimal_space_crossover );
  
    confines_deta = ( max_confines - min_confines ); 
    
    coded_step = confines_deta./( 2.^bits-1 );
    
    probability_mutation_numbers = ceil( probability_mutation * population );
    
%initialize binary_space_mutation &.decimal_space_mutation

    binary_space_mutation = binary_space_crossover;   
    
    decimal_space_mutation = decimal_space_crossover;
    

%bits_No is important

    bits_No = [ 0 , bits ];
    
% to find out which is the binary parameter

%  i = 0 : 0.1 : population;

        for idx = 1 : 1 : parameter_numbers

        %to avoid that Index exceeds matrix dimensions
           
            bits_No( idx + 1 ) = bits_No( idx + 1 ) + bits_No( idx );
            
        end

%~~~~~~~~~~~~~~~~~~~~~~
%

  if ( probability_mutation_numbers >= 1 )
    
      for idx = 1 : 1 : probability_mutation_numbers ;
          
           mutation_position( idx ) = randint( 1 , 1 , [ 1 , population ] ) ;
           
           for jdx = 1 : 1 : parameter_numbers
              
                mutation_point( jdx ) = randint( 1 , 1 , [ bits_No( jdx ) + 1 , bits_No( jdx + 1 ) ] ) ;            
           
                binary_space_mutation( mutation_position( idx ) , mutation_point( jdx ) ) = 1 - binary_space_crossover( mutation_position( idx ) , mutation_point( jdx ) ) ;   
               
          end
          
      end
      
else
  
   return ;
  
end;
    
    
% binary_space_mutation_sparse = sparse( binary_space_mutation ); 

%Plot data

% SPY Visualize sparsity pattern.
% SPY(S) plots the sparsity pattern of the matrix S.

%  figure(7)
%  spy( binary_space_mutation_sparse , 'g' );
%  title( 'the mutation binary-space in sparsity pattern' );
%  xlabel( 'Non-Zero bits' );
%  ylabel( 'Population' );

%  hold on;
%  idx = 0 : 0.1 : population;
%  for j =1 : 1 : parameter_numbers
%    plot( bits_No( jdx + 1 ) , idx ,'r' );
%  end
%
%decoding binary_space_mutation to  decimal_space_mutation
%different from X=Decimal*coded_step+min_confines

for idx = parameter_numbers : -1 : 1

    for jdx = population : -1 : 1                      
    
        for kdx = bits_No( idx + 1 ) : -1 : ( bits_No( idx ) + 1 )
          
            twos( jdx , kdx ) = pow2( bits_No( idx + 1 ) - kdx ) * binary_space_mutation( jdx , kdx );

        end 

        twos_sum( jdx , idx ) = sum( twos( jdx , : ) , 2 );
        
        decimal_space_mutation( jdx , idx ) = twos_sum( jdx , idx ) * coded_step( idx ) + min_confines( idx );
        
    end  

    twos = zeros( population , bits_sum );%clear twos at present i 
                                                             % X=Decimal*coded_step+min_confines
end   
        
%  figure(8)       
%  idx = population : -1 : 1 ;
%  plot( decimal_space_mutation( idx , : ) , idx , '*' );
%  xlabel( 'mutation decimal-space' );
%  ylabel( 'population' );
%  title('the crosponding deciaml-space of binary-space');
%  grid on;
end

%SGA__binary_singlepoint_mutation end