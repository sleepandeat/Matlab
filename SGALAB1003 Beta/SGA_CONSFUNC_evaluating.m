function [ constrait_function_value, error_status ] = SGA_CONSFUNC_evaluating ( decimal_space )

% /*M-FILE FUNCTION SGA_CONSFUNC_evaluating MMM SGALAB */ 
% /*==================================================================================================
%    Simple Genetic Algorithm Laboratory Toolbox for Matlab 7.x
% ====================================================================================================
%File description: 
%      SGA_CONSFUNC_evaluating functions Of Simple Genetic Algorithm Program (Version 1.0.0.3 )
%      Support multi-dimesion parameters
%
%      SGA_CONSFUNC_evaluating is to calculating constraint functions' value
%      
%
%Input:
%            decimal_space--           is the constraint functions' input variable array

%Output:
%            constrait_function_value-- is the constraint functions' result
%                                      NaN is in error
%            error_status =    0 -- ok
%                              1 -- invalid parameter
%                              2 -- too many input arguments      

%Appendix comments:
%                     

%Usage:
%[ constrait_function_value, error_status ] = SGA_CONSFUNC_evaluating ( decimal_space )

%

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

% SGA_CONSFUNC_evaluating Begin

 [ population , parameter_numbers ] = size ( decimal_space );
 
% check input parameter          
 if ( ( population <= 0 ) || ( parameter_numbers <= 0) )
 
         error_status = 1 ; 
         
         constrait_function_value = NaN;
        
         disp('Invalid Input function parameter ->''decimal_space'', pls Check the input of SGA_CONSFUNC_evaluating()')
         
         return ;
  
end % end if
%      Normally functions return when the end of the function is reached.
 %     A RETURN statement can be used to force an early return.
   
        
% make a temp cell variable
     decimal_space_cell    =  cell ( population , parameter_numbers );
           
%transfor matrix to cell as the input parameter list

          for ( idx = 1 : 1 : population ) % /* timer for population */
              
               for ( jdx = 1 : 1 : parameter_numbers )%/* timer for parameter numbers*/
                    
                    decimal_space_cell {  idx  ,  jdx  }  =  decimal_space ( idx , jdx );
                
               end
               constrait_function_value( idx  ,  :  ) = SGA_CONSFUNC_function ( decimal_space_cell {  idx , 1 : 1 : parameter_numbers  }  );

         end
         
            error_status = 0 ; 
            
            
% SGA_CONSFUNC_evaluating End
