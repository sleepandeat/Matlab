% /*M-FILE SCRIPT SGALAB_DEMO_1 MMM SGALAB */ %
% /*==================================================================================================
%  Simple Genetic Algorithm Laboratory Toolbox for Matlab 7.x
% ====================================================================================================
%File description:
% We can run SGALAB by key-in "SGALAB_Script_demo_1" in Matlab command window
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
%27-Jun-2003 Chen Yi Initial version       chen_yi2000@sina.com  Chongqing
%14-Jan-2005 Chen Yi update 1003           chenyi2005@gmail.com  Shanghai 
%HISTORY$
%==================================================================================================*/
% SGALAB_DEMO_1 Begin 

%% set screen 
 

%       fresh
     % clear ;
     % close ('all');
      warning off
% to delete old output_*.txt
     !del OUTPUT_*.txt
% set working path
      %cd SGALAB_Funcs
%      SGA_set_working_paths
      
%% begin to count time during calculating     
       home ;
       
      
       tic % start >>

% data preparation
    
%% open data files

%%%input data files
         fid1  = fopen('INPUT_min_confines.txt' , 'r' );
         fid2  = fopen('INPUT_max_confines.txt' , 'r' );
         fid3  = fopen('INPUT_probability_crossover.txt' , 'r' );
         fid4  = fopen('INPUT_probability_mutation.txt' , 'r' );
         fid5  = fopen('INPUT_population.txt' , 'r' );
         fid6  = fopen('INPUT_decimal_step.txt' , 'r' );
         fid7  = fopen('INPUT_max_generation.txt' , 'r' );
         fid8  = fopen('INPUT_convergence_method.txt' , 'r' );
         fid9  = fopen('INPUT_max_no_change_probability_crossover_generation.txt','r');
         fid10 = fopen('INPUT_deta_fitness_max.txt','r');
         fid11 = fopen('INPUT_max_probability_crossover.txt','r');
         fid12 = fopen('INPUT_probability_crossover_step.txt','r');
         fid13 = fopen('INPUT_max_no_change_fitness_generation.txt','r');
         
%output data files
         fid14 = fopen('OUTPUT_maxfitness.txt','w+');
         fid15 = fopen('OUTPUT_minfitness.txt','w+');
         fid16 = fopen('OUTPUT_meanfitness.txt','w+');
         fid17 = fopen('OUTPUT_best_result_space.txt','w+');
         fid18 = fopen('OUTPUT_best_coding_space.txt','w+');
         fid19 = fopen('OUTPUT_now_generation.txt','w+');
         fid20 = fopen('OUTPUT_now_probability_crossover.txt','w+');

% begin to load data from file

%% read data from these files
disp('----------------------------------------------------------------------------------------')
disp('/* Simple Genetic Algorithms( SGALAB ) Toolbox 1.0.0.3 */ ')
disp('|  By Chen Yi   8th May, 2005                          ')
disp('|  Email : chenyi2005@gmail.com                        ')
disp('|  MSN   : cdey_china@hotmail.com                      ')
disp('|  Skype : see_moonlight                               ')
disp('----------------------------------------------------------------------------------------')
disp('>>>>')
disp(' Begin to evaluate...Waiting please ...')


      min_confines = fscanf( fid1 , '%g' ); min_confines = min_confines' ;
      
      max_confines = fscanf( fid2 , '%g' ); max_confines = max_confines';
      
      probability_crossover = fscanf( fid3 , '%g' ); probability_mutation = fscanf(fid4,'%g');
      
      population = fscanf( fid5 , '%g' ); 
      
      decimal_step = fscanf( fid6 , '%g' );
      
      max_generation = fscanf( fid7 , '%g' );
      
      convergence_method = fscanf( fid8 , '%g' );
      
      max_no_change_probability_crossover_generation = fscanf( fid9 , '%g' );
      
      deta_fitness_max = fscanf( fid10 , '%g' );
      
      max_probability_crossover = fscanf( fid11,'%g' );
      
      probability_crossover_step = fscanf(fid12,'%g');

      max_no_change_fitness_generation = fscanf(fid13,'%g');
      
      decimal_step = decimal_step' ;
      
      now_probability_crossover = probability_crossover;
%

disp(' >>>>')
disp('End Evaluating, List of results :')

% Step into SGALAB()
 options = { 'Binary',
             'Roulettewheel',
             'singlepoint', 
             'singlepoint',
             '0' };
      
% Output          
 
[ maxfitness ,...
  minfitness ,...
  meanfitness ,...
  now_generation , ...
  now_probability_crossover,...
  best_decimal_space ,...
  best_coding_space ,...
  error_status ]= SGALAB...      
( options,...
  min_confines ,...
  max_confines ,...
  probability_crossover ,...
  probability_mutation ,...
  population ,...
  decimal_step , ...
  max_generation ,...
  convergence_method ,...
  max_no_change_probability_crossover_generation ,...
  deta_fitness_max ,...
  max_probability_crossover ,...
  max_no_change_fitness_generation ,...
  probability_crossover_step  );
                                                                                                                                                
if ( error_status ~= 0 )  return ;  end

%  [ maxfitness , minfitness , meanfitness , best_decimal_space , now_generation , now_probability_crossover , best_binary_space ] = SGALAB...
%  ( min_confines , max_confines , probability_crossover , probability_mutation , population , decimal_step , max_generation , convergence_method , max_no_change_probability_crossover_generation , deta_fitness_max , deta_fitness_max_min , max_probability_crossover , max_no_change_fitness_generation , probability_crossover_step );


%  maxfitness = max( fitness_value )
%  best_decimal_space = decimal_space( max_fitness_temp_position( population ) )

%write data to output files
% fprintf( fid8 , '\n the max value of fitness function:\n' );
    fprintf( fid14 , '%f\n' , maxfitness);

%fprintf( fid9, '\n the min value of fitness function:\n');
   fprintf( fid15 , '%f\n' ,minfitness);

%fprintf(fid10,'\n the mean value of fitness function:\n');
   fprintf(fid16,'%f\n',meanfitness);

%fprintf( fid11,'\nthe best decimal space(x1 x2 x3...):\n');
   fprintf( fid17,'%f\n',best_decimal_space );

   fprintf( fid18 , '%f\n' , best_coding_space );
   
%fprintf( fid12, '\nthe generation number when end GAs:\n' );

   fprintf( fid19, '%f\n' , now_generation );
   
   fprintf( fid20, '%f\n' , now_probability_crossover );
   
%close files
   status = fclose( 'all' );
   

disp(' More detail result in text files with " Output_*.txt " ' )
disp('----------------------------------------------------------------------------------------')
result_files = list_current_dir_files ('OUTPUT_*.txt')

disp('----------------------------------------------------------------------------------------')

% timer end
    toc


 

%  SGA_remove_work_paths

% SGALAB_DEMO_1 End