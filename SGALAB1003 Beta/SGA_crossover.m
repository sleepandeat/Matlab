function  [ decimal_space,coding_space,error_status ] = SGA_crossover( options, min_confines , max_confines , decimal_space_selected , coding_space_selected , bits , probability_crossover )

% /* M-FILE FUNCTION SGA_crossover MMM SGALAB */

% /*==================================================================================================
%   (Arial Font) Simple Genetic Algorithm Laboratory Toolbox for Matlab 7.x
% ====================================================================================================
%File description:
%      SGA_crossover Function Of Simple Genetic Algorithm Program (Version 1.0.0.3 )
%      Support multi-dimesion parameters
%
%      Crossover is the step followed select in SGA(Simple Genetic Algorithm)
%      by single point cross method
%
%Input:
%            options--                'singlepoint','single'
%                                     'twopoint','two'
%                                     'N = n','n'
%                                     'random','r'
%            min_confines--           is the minimum of input value in decimal-space
%            max_confines--           is the maximum of input value in decimal-space
%            decimal_space--          is the rest decimal_space from select function
%            probability_crossover--  is the random decimal value in  [min_confines,max_confines]
%            decimal_space--          is the search step in decimal space
%            coding_space--           is the coded space in 0 or 1
%            bits--                   is the length of every paramete
%            probability_crossover--  is the crossover probability in crossover step,
%                                      your can give it's value to reach your need (About:0~1)

%Output:
%            decimal_space_crossover--is the result in decimal format
%            coding_space_crossove--  is the result in binary format
%            error_status =    0 -- ok
%                              !0 -- fail


%Appendix comments:


%Usage:
%  [ decimal_space_crossover , coding_space_crossover,error_status ] = SGA_crossover( options, min_confines , max_confines , decimal_space , coding_space, bits , fitness_value,probability_crossover )
%
%example :
%          [ coding_space , bits_sum , bits ] = SGA_encoding( options ,[1,2,3,4] ,[7,8,9,10] , 10 , [0.01,0.01,0.01,0.01] )
%          [ decimal_space]                   = SGA_decoding( options ,[1,2,3,4] ,[7,8,9,10] , coding_space , bits )
%          [ fitness_value]                   = SGA_FITNESS_evaluating( decimal_space )

%[ max_fitness_temp_position,decimal_space_selected,coding_space_selected,maxfitness]= SGA_selection(options , decimal_space , coding_space , fitness_value , bits )

%[ decimal_space_crossover , coding_space_crossover ] = SGA_crossover(options , [1,2,3,4],[7,8,9,10] , decimal_space_selected , coding_space_selected , bits ,0.6 )

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
%19-Apr-2002   Chen Yi  Initial version        chen_yi2000@sina.com  Chongqing
%27-Jun-2003   Chen Yi  update 1002            chen_yi2000@sina.com  Chongqing
%14-Jan-2005   Chen Yi  update 1003            chenyi2005@gmail.com  Shanghai
%HISTORY$
%==================================================================================================*/

% SGA_crossover Begin
error_status = 0 ;
%% check input & error protect

if ( nargin <= 1 )
    error ('SGA_crossover() Error: Input Parameters, Less than Requirement...');
    decimal_space = NaN;
    binary_space= NaN;
    error_status = 1 ;

elseif ( probability_crossover < 0 )
    error ('Invalid probability_crossover');
    decimal_space = NaN;
    binary_space= NaN;
    error_status = 1 ;

else

    %% begin to crossover
    %  DEBLANK(S) removes trailing blanks from string S.
    options = deblank( options );

    %% to take crossover method

    % Singlepointcrossover method
    % Input:     decimal_space , coding_space,fitness_value,bits
    %            decimal_space-- is the decimal space pool
    %            coding_space--  is the coded space in 0 or 1
    %            fitness_value-- is fitness value
    %            bits--          is the length of every paramete

    if (    (  ( strcmpi ( 'Singlepoint' , options ) )||...
            ( strcmpi ( 'Single'      , options ) ) ...
            )&&( nargin == (1+6) )...
            )

        [ decimal_space,coding_space,error_status] = SGA__binary_singlepoint_crossover( min_confines , max_confines , decimal_space_selected , coding_space_selected , bits , probability_crossover);

        if ( error_status ~= 0 )

            decimal_space = NaN;
            binary_space= NaN;

        end


        %  Stochastic selection method
    elseif ( ( strcmpi ( 'Stochastic' , options ) )||...
            ( strcmpi ( 'S'          , options ) )...
            )

        if ( error_status ~= 0 )

            decimal_space = NaN;
            binary_space= NaN;

        end

    else % add other selection method


        if ( error_status ~= 0 )

            decimal_space = NaN;
            binary_space= NaN;

        end

    end

end
% SGA_crossover End