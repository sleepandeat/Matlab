function [ maxfitness , minfitness , meanfitness , now_generation , now_probability_crossover,best_decimal_space , best_coding_space ,error_status] = SGALAB( options,min_confines,max_confines,probability_crossover,probability_mutation,population,decimal_step,max_generation,convergence_method,max_no_change_probability_crossover_generation,deta_fitness_max,max_probability_crossover,max_no_change_fitness_generation,probability_crossover_step)

% /*M-FILE FUNCTION SGALAB MMM SGALAB */ 
% /*==================================================================================================
%  Simple Genetic Algorithm Laboratory Toolbox for Matlab 7.x
% ===================================================================================================
%File description:

% This is the main workflow function for SGALAB Toolbox, 
% so this function is the main function of  Simple Genetic Algorithm
% we can use SGALAB Toolbox by add this function of SGALAB in our programme

%
%Input(1):
%            options[5]:
%                      options(1)-- en-/de-coding method
%                                   'Binary' ,'b' :  binary encoding method
%                                   'Real'   ,'r' :  real number encoding method
%                                   'Literal','l' :  literal permutation encoding method
%                                   'Gray'   ,'g' :  Gray encoding method
%                                   'DNA'    ,'d' :  DNA encoding method
%                                   'Messy'  ,'m'  :  Messy encoding method
%                                   
%                      options(2)-- selection method
%                                    'Roulettewheel', 'Roulette','Wheel','r' : Roulette wheel selection method
%                                    'Stochastic','s'                        : Stochastic selection method
%                      options(3)-- crossover method
%                                   'singlepoint','single'
%                                   'twopoint','two'
%                                   'N = n','n'
%                                   'random','r'  

%                      options(4)-- mutation  method
%                                   'singlepoint','single'
%                                   'twopoint','two'
%                                   'N = n','n'
%                                   'random','r'
%                      options(5)-- constraint_status
%                                   'with'    ,'1'--have constraint conditions
%                                   'without' ,'0'--have no constraint conditions
%Input(2):
%
%Output:
%            maxfitness--                is the max value for fitness 
%            minfitness--                is the min value for fitness
%            meanfitness--               is the mean value for fitness
%            now_generation--            is the generations when SGALAB calculating terminated                    
%            now_probability_crossover-- is the probability for crossover when SGALAB calculating terminated
%            best_decimal_space--        is the result in decimal format when SGALAB calculating terminated
%            best_coding_space--         is the result in binary format when SGALAB calculating terminated

%            error_status =    0 -- ok
%                              1 -- invalid parameter
%                              2 -- too many input arguments 
               
%Appendix comments:


%Usage:
% 
%
%example :


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
% SGALAB Begin 

error_status = 0;

% delta_fitness_scale = 1000;

if ( nargin~= 14 )
    
disp('SGALAB function nargin error')    

error_status = 1;
return ;    

end


%[ MMM , NNN ] = size( nvarargin );

% nvarargin_cell = cell( MMM , NNN );

% 1:
if ( strcmpi ( 'Binary' , options(1) )&&...
     strcmpi ( 'Roulettewheel',options(2))&&...
     strcmpi ( 'singlepoint',options(3))&&...
     strcmpi ( 'singlepoint',options(4))...
   )

% input :
% (1)
% option(1) -- 'binary' 
% option(2) -- 'singlepoint' 
% option(3) -- 'singlepoint' 
% option(4) -- 'singlepoint

% (2) -- 14 elements matrix 
% [ min_confines ,                                   -- nvarargin(1)
%   max_confines ,                                   -- nvarargin(2)
%   probability_crossover ,                          -- nvarargin(3)
%   probability_mutation ,                           -- nvarargin(4)
%   population ,                                     -- nvarargin(5)
%   decimal_step ,                                   -- nvarargin(6)
%   max_generation ,                                 -- nvarargin(7)
%   convergence_method ,                             -- nvarargin(8)
%   max_probability_crossover ,                      -- nvarargin(9)
%   deta_fitness_max ,                               -- nvarargin(10)
%   max_probability_crossover ,                      -- nvarargin(11)
%   max_no_change_fitness_generation ,               -- nvarargin(12)
%   probability_crossover_step ]                     -- nvarargin(13)
%
%Output :
%            maxfitness--                is the max value for fitness 
%            minfitness--                is the min value for fitness
%            meanfitness--               is the mean value for fitness
%            now_generation--            is the generations when SGALAB calculating terminated                    
%            now_probability_crossover-- is the probability for crossover when SGALAB calculating terminated
%            best_decimal_space--        is the result in decimal format when SGALAB calculating terminated
%            best_coding_space--         is the result in binary format when SGALAB calculating terminated

%            error_status =    0 -- ok
%                              1 -- invalid parameter
%                              2 -- too many input arguments 
   
%%initialize begin
      
%      input parameters number control       
%       SGAencoding_input_num                      = 4 ;  
%       SGAdecoding_input_num                      = 4 ;
       
% min_confines , max_confines , population , decimal_step 
%       encoding_nvargrgin_cell = cell( MMM , SGAencoding_input_num );    
% min_confines , max_confines , binary_space , bits        
%       decoding_nvargrgin_cell = cell( MMM , SGAdecoding_input_num );   
        
       Generation_numbers                         = 1 ;
       no_change_fitness_generation               = 1 ;
       no_change_probability_crossover_generation = 1 ;
       now_generation                             = max_generation; 
       fitness_plot_max                           = zeros(1,now_generation);
       fitness_plot_min                           = zeros(1,now_generation);
       fitness_plot_mean                          = zeros(1,now_generation);
     
       %best_decimal_space=zeros(population,parameter_numbers);

%coding and decoding
% for #001
% for idx =1 : 1 : MMM 
 % for #002
 %  for jdx =1 : 1 : NNN
       
 %  nvarargin_cell{ idx , jdx }= nvarargin( idx ,jdx );
      
 %  end  % end for #002   
   
              % min_confines
%              encoding_nvargrgin_cell( idx , 1 ) = nvarargin(1);
              % max_confines
%              encoding_nvargrgin_cell( idx , 2 ) = nvarargin(2);
              % population
%              encoding_nvargrgin_cell( idx , 3 ) = nvarargin(5);
              % decimal_step
%              encoding_nvargrgin_cell( idx , 4 ) = nvarargin(6);

% encoding_nvargrgin_cell{ idx,1:1:SGAencoding_input_num }   
      [ coding_space , bits , error_status ] = SGA_encoding ( options(1), min_confines , max_confines , population , decimal_step  );

      if ( error_status ~= 0 )  return ;  end % encoding error_status check
      
              % min_confines
%              decoding_nvargrgin_cell( idx , 1 ) = nvarargin(1);
              % max_confines
%              decoding_nvargrgin_cell( idx , 2 ) = nvarargin(2);
              % binary_space
%              decoding_nvargrgin_cell( idx , 3 ) = coding_space ;
              % bits
%              decoding_nvargrgin_cell( idx , 4 ) = bits ;
% decoding_nvargrgin_cell{ idx,1:1:SGAdecoding_input_num }               
      [ decimal_space,error_status ]                  = SGA_decoding(options(1),min_confines , max_confines , coding_space , bits ) ;
      if ( error_status ~= 0 )  return ; end % decoding error_status check
        
     
 %[population,parameter_numbers] = size(nvarargin(6));
     
     switch ( convergence_method )
     
         case 1  , %%if ( convergence_method == 1 )

             SGA_Procedure_h = timebar('Simple Genetic Algorithms Laboratory (SGALAB)','Calculating...');

             disp('convergence_method 1 is Max generation !');

             while ( Generation_numbers <= max_generation )


                 timebar( SGA_Procedure_h , Generation_numbers/max_generation);

                 if (strcmpi(options(5),'with')||strcmpi(options(5),'1') )
                     % Co-evolutionary Genetic Algorithms begin %
                     [ constrait_function_value, error_status ] = SGA_CONSFUNC_evaluating( decimal_space );
                     if ( error_status ~= 0 )  return ;  end % constrait function evaluating error_status check
                     %check constrait function value
                     if ( constrait_function_value == NaN )
                         continue;
                     else
                         [ fitness_value,error_status ] = SGA_FITNESS_evaluating( constrait_function_value );
                         if ( error_status ~= 0 )  return ;  end % fitness function evaluating error_status check
                     end
                 elseif (strcmpi(options(5),'without')||strcmpi(options(5),'0') )
                     [ fitness_value,error_status ] = SGA_FITNESS_evaluating( decimal_space );
                     if ( error_status ~= 0 )  return ;  end
                 else
                     return;
                 end
                 %  Co-evolutionary Genetic Algorithms end %

                 fitness_plot_max ( 1 , Generation_numbers ) = max ( fitness_value );
                 fitness_plot_min ( 1 , Generation_numbers ) = min ( fitness_value );
                 fitness_plot_mean( 1 , Generation_numbers ) = mean( fitness_value );


                 [ max_fitness_temp_position , decimal_space , coding_space , maxfitness ,error_status ] = SGA_selection( options(2),decimal_space , coding_space , fitness_value , bits );
                 if ( error_status ~= 0 )  return ;  end % selection operator error_status check

                 [ decimal_space , coding_space,error_status] = SGA_crossover( options(3),min_confines , max_confines,decimal_space , coding_space , bits , probability_crossover);
                 if ( error_status ~= 0 )  return ;  end % crossover operator error_status check
                 % pay attention to the decimal_space and coding_space from SGA_mutation.m
                 % it can't be  [decimal_space_mutation,binary_space_mutation]

                 [ decimal_space , coding_space,error_status ] = SGA_mutation( options(4),min_confines , max_confines , decimal_space , coding_space , bits , probability_mutation );
                 if ( error_status ~= 0 )  return ;  end % mutation operator error_status check

                 Generation_numbers = ( Generation_numbers + 1 );

                 best_coding_space = coding_space;

             end % end of while

             best_decimal_space = decimal_space ( max_fitness_temp_position( population ) , : );

             [ maxfitness , error_status ] = SGA_FITNESS_evaluating( best_decimal_space );
             if ( error_status ~= 0 )  return ;  end
             % output parameter set

             minfitness                =  min ( fitness_plot_min  );
             meanfitness               =  mean( fitness_plot_mean );
             now_generation            =  Generation_numbers-1;
             now_probability_crossover =  probability_crossover;

             generation_idx = 1 : 1 : now_generation ;

             %plot 2D  generation - fitness

             figure
             hold on
             grid on
             %fitness_plot = plot ( generation_idx , fitness_plot_max , '-r' , generation_idx , fitness_plot_min , ':b' , generation_idx , fitness_plot_mean , '-.k' );
             plot ( generation_idx , fitness_plot_max , '-r' ,'LineWidth',2 );
             plot ( generation_idx , fitness_plot_min , ':b' ,'LineWidth',2 );
             plot ( generation_idx , fitness_plot_mean , '-.k' ,'LineWidth',2 );

             title('Every Fitness--Generation');
             xlabel('Generation');
             ylabel('Every Fitness');
             legend('max','min','mean',4);


             % end of case 1
             close( SGA_Procedure_h );

             error_status = 0 ;

case 2 ,%%elseif convergence_method==2
                 % begin convergence 2
SGA_Procedure_h = timebar('Simple Genetic Algorithms Laboratory (SGALAB)','Calculating...');

disp ( 'convergence_method 2 is no change fitness ... ' )

  
while ( no_change_probability_crossover_generation <= max_no_change_probability_crossover_generation )
    
if ( Generation_numbers <= max_generation ) % if #00001        
    
   timebar( SGA_Procedure_h , Generation_numbers/max_generation);  
   
%    timebar( SGA_Procedure_h , no_change_probability_crossover_generation/max_no_change_probability_crossover_generation);
    
  if (strcmpi(options(5),'with')||strcmpi(options(5),'1') )
      % Co-evolutionary Genetic Algorithms begin %
      [ constrait_function_value, error_status ] = SGA_CONSFUNC_evaluating( decimal_space );
       if ( error_status ~= 0 )  return ;  end % constrait function evaluating error_status check
      %check constrait function value 
       if ( constrait_function_value == NaN )          
            continue; 
        else
         [ fitness_value,error_status ] = SGA_FITNESS_evaluating( constrait_function_value );
           if ( error_status ~= 0 )  return ;  end % fitness function evaluating error_status check
       end   
       % Co-evolutionary Genetic Algorithms  end %
   elseif(strcmpi(options(5),'without')||strcmpi(options(5),'0') )
       
             [ fitness_value,error_status ] = SGA_FITNESS_evaluating( decimal_space );
   else
     return;
   end

       fitness_plot_max ( 1 , Generation_numbers ) = max ( fitness_value );
       fitness_plot_min ( 1 , Generation_numbers ) = min ( fitness_value );
       fitness_plot_mean( 1 , Generation_numbers ) = mean( fitness_value );
          
[ max_fitness_temp_position , decimal_space , coding_space , maxfitness ,error_status ] = SGA_selection( options(2),decimal_space , coding_space , fitness_value , bits );
  if ( error_status ~= 0 )  return ;  end % selection operator error_status check
                           
[ decimal_space , coding_space,error_status] = SGA_crossover( options(3),min_confines , max_confines,decimal_space , coding_space , bits , probability_crossover);
  if ( error_status ~= 0 )  return ;  end % crossover operator error_status check     
% pay attention to the decimal_space and coding_space from SGA_mutation.m 
% it can't be  [decimal_space_mutation,binary_space_mutation]
                  
[ decimal_space , coding_space,error_status ] = SGA_mutation( options(4),min_confines , max_confines , decimal_space , coding_space , bits , probability_mutation );
  if ( error_status ~= 0 )  return ;  end % mutation operator error_status check     
   
   if ( Generation_numbers ~= 1 ) % if # 00003 , to avoid array out of range
                                 % e.g. AA(1,Generation_numbers)
        
      % History data check
       % check max , min , mean fitness value itself series are in no_fitness_value or not
       % Brother data check
       % check max-min fitness value is in no_fitness_value or not  
       % if #0002                                
       if( ( abs( fitness_plot_max (1,Generation_numbers)-fitness_plot_max (1,Generation_numbers-1))>deta_fitness_max )| ...
           ( abs( fitness_plot_min (1,Generation_numbers)-fitness_plot_min (1,Generation_numbers-1))>deta_fitness_max )|...
           ( abs( fitness_plot_mean(1,Generation_numbers)-fitness_plot_mean(1,Generation_numbers-1 ) ) > deta_fitness_max )|...
           ( abs( fitness_plot_max (1,Generation_numbers)-fitness_plot_min (1,Generation_numbers    ) ) > deta_fitness_max )...
          )                                   
                                 
           if ( no_change_fitness_generation > max_no_change_fitness_generation )
                           
                  if ( probability_crossover <= max_probability_crossover && probability_crossover <= 1 )
                                  
                       probability_crossover = probability_crossover + probability_crossover_step ;
                  % set to zero status
                       no_change_fitness_generation = 0 ;
                  else
                    return;
                  end      
                             
             end 
             
                no_change_fitness_generation = no_change_fitness_generation + 1 ;
       
%      else
%          return;
       end % end if #00002   
     
   end % end if # 00003      
          Generation_numbers = ( Generation_numbers + 1 );

          best_coding_space  =   coding_space;
 else
 
     return;
     
 end  % end if #00001
  
       no_change_probability_crossover_generation = no_change_probability_crossover_generation + 1; 
 end % end of while
       
       best_decimal_space = decimal_space( max_fitness_temp_position(population),:);
        
       maxfitness         = SGA_FITNESS_evaluating( best_decimal_space );
  
   %output parameter set
       
           minfitness                = min ( fitness_plot_min  );
           meanfitness               = mean( fitness_plot_mean );
           now_generation            = Generation_numbers-1;
           now_probability_crossover = probability_crossover;
           
       %plot
       
         generation_idx = 1 : 1 : now_generation ;
                       
 %plot
figure 
hold on;
grid on                   
%fitness_plot = plot ( generation_idx , fitness_plot_max(generation_idx) , 'LineWidth',2,'-r' , generation_idx , fitness_plot_min(generation_idx) , ':b' , generation_idx , fitness_plot_mean(generation_idx) , '-.k' );
plot ( generation_idx , fitness_plot_max(generation_idx) , '-r' ,'LineWidth',2);
plot ( generation_idx , fitness_plot_min(generation_idx) , ':b' ,'LineWidth',2);
plot ( generation_idx , fitness_plot_mean(generation_idx), '-.k' ,'LineWidth',2);

title('Every Fitness--Generation');
xlabel('Generation');
ylabel('Every Fitness');
legend('max','min','mean',4);
    
 % end of case 2
%close( SGA_Procedure_h );

error_status = 0 ;
       
otherwise, % other convergence method  update choice
   
disp('The convergence method has two way now, chose:1 or 2');
           
return;
    
    
end % end switch ...case 

elseif ( strcmpi ( 'binary' , options(1) )&&...
         strcmpi ( 'random',options(2))&&...
         strcmpi ( 'singlepoint',options(3))&&...
         strcmpi ( 'singlepoint',options(4))...
       )

error_status = 0;

else

error_status = 0;

end

% SGALAB End





