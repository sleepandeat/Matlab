function [ max_fitness_temp_position , decimal_space_selected , coding_space_selected , maxfitness_selection,error_status ] = SGA_selection ( options, decimal_space , binary_space , fitness_value , bits )

% /*M-FILE FUNCTION SGA_selection MMM SGALAB */
% /*==================================================================================================
%  Simple Genetic Algorithm Pro Toolbox for Matlab 7.x
% ====================================================================================================
%File description:
%      SGA_selection Function Of Simple Genetic Algorithm Program (Version 1.0.0.3 )
%      Support multi-dimesion parameters
%
%      selection is one of most basic operators in SGA(Simple Genetic Algorithm)
%      by single point cross method

%Input:
%              options--                    'Roulettewheel', 'Roulette','Wheel','r' : Roulette wheel selection method
%                                           'Stochastic','s'                        : Stochastic selection method


%               decimal_space--             is the decimal space pool
%               binary_space--              is the coded space in 0 or 1
%               fitness_value--             is fitness value
%               bits--                      is the length of every paramete

%Output:
%               max_fitness_temp_position--  is a temp pointer(not c pointer , only a int number ) for fitness value location
%               decimal_space_selected--     is decimal pool from selection operator
%               coding_space_selected--      is binary pool from selection operator
%               maxfitness_selection--       is max fitness value from selection operator

%            error_status--       =    0 -- ok
%                                      1 -- invalid parameter
%                                      2 -- too many input arguments




%Appendix comments:


%Usage:
%[ max_fitness_temp_position , decimal_space_selected , coding_space_selected , maxfitness_selection,error_status ] = SGA_selection ( options, decimal_space , binary_space , fitness_value , bits )
%
%example :
%          [binary_space,bits_sum,bits,error] = SGA_encoding('binary',[1,2,3,4],[7,8,9,10],10,[0.01,0.01,0.01,0.01])
%          [decimal_space,error]              = SGA_decoding('binary',[1,2,3,4],[7,8,9,10],binary_space,bits)
%          [fitness_value,error]              = SGA_FITNESS_evaluating(decimal_space)

%[max_fitness_temp_position,decimal_space_selected,coding_space_selected,maxfitness,error] = SGA_selection( 'Roulettewheel' , decimal_space,binary_space,fitness_value,bits )

%[ decimal_space_crossover , binary_space_crossover ] = SGA_crossover('singlepoint',[1,2,3,4],[7,8,9,10],decimal_space_selected,coding_space_selected,bits,0.6 )

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

% SGA_selection Begin
error_status = 0;
%% check input & error protect
if ( nargin <= 2 )

    error ('SGA_selection() Error: Input Parameters...');
    max_fitness_temp_position = NaN;
    decimal_space_selected    = NaN;
    binary_space_selected     = NaN;
    maxfitness_selection      = NaN;
    error_status = 1 ;

else

    %%
    options = deblank( options );

    %% to take selection-method

    %%  Roulette selection-method

    if ( (( strcmpi ( 'roulettewheel' , options ) )||...
            ( strcmpi ( 'roulette'      , options ) )||...
            ( strcmpi ( 'r'             , options ) )||...
            ( strcmpi ( 'wheel'         , options ) ))...
            &&( nargin == 5 )...
            )


        [ max_fitness_temp_position , decimal_space_selected , coding_space_selected , maxfitness_selection,error_status ] = SGA__binary_roulettewheel_selection( decimal_space , binary_space,fitness_value,bits );
        %
        %Input:      decimal_space , binary_space,fitness_value,bits
        %
        %               decimal_space--     is the decimal space pool
        %               binary_space--      is the coded space in 0 or 1
        %               fitness_value--     is fitness value
        %               bits--              is the length of every paramete

        %% Stochastic selection method

    elseif ( ( strcmpi ( 'Stochastic' , options ) )||...
            ( strcmpi ( 'S'          , options ) )...
            )



    else

        error_status = 1;

    end


end
%%%  SGA_selection End