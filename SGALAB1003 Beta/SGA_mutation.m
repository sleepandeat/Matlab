function [ decimal_space , binary_space,error_status ] = SGA_mutation(options , min_confines , max_confines , decimal_space , binary_space , bits , probability_mutation )

% /*M-FILE FUNCTION SGA_mutation MMM SGALAB */
% /*==================================================================================================
%    Simple Genetic Algorithm Pro Toolbox for Matlab 7.x
% ====================================================================================================
%File description:
%     Mutation Function Of Simple Genetic Algorithm Program (Version 1.0.0.3 )
%     support multi-input parameters,  mutation of single point method
%
%Input:
%            options--                'singlepoint','single'
%                                     'twopoint','two'
%                                     'N = n','n'
%                                     'random','r'
%
%            min_confines--           is the minimum of input value in decimal-space
%            max_confines--           is the maximum of input value in decimal-space
%            decimal_space_crossover--is  the search step in decimal space from crossover
%            binary_space_crossover-- is  the search step in binary space from crossover
%
%            bits--                   is the length of every parameter
%            probability_mutation--   is probability for mutation,probability_mutation is given by yourself

%Output:
%            decimal_space_mutation-- is  the search step in decimal space from mutation
%            binary_space_mutation--  is  the search step in binary space from mutation
%            error_status-- =    0 -- ok
%                                1 -- invalid parameter
%                                2 -- too many input arguments

%Appendix comments:

%Usage:
%function [ decimal_space , binary_space,error_status ] = SGA_mutation(options , min_confines , max_confines , decimal_space_crossover , binary_space_crossover , bits , probability_mutation )
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

%SGA_mutation begin
error_status = 0 ;
%% check input & error protect
if ( nargin <= 2 )

    error ('SGA_mutation() Error: Input Parameters, Less than Requirement...');
    decimal_space = NaN;
    binary_space = NaN;
    error_status = 1 ;

else

    %%
    options = deblank( options );

    %% mutation method

    %%  binary encoding method in array

    if ( ( ( strcmpi ( 'Binary' , options ) )||...
            ( strcmpi ( 'B'      , options ) )...
            ) &&...
            ( nargin == 6 )...
            )

        %Input:
        %            min_confines--  is the minimum of input value in decimal-space
        %            max_confines-- is the maximum of input value in decimal-space
        %            population--      is the random decimal value in  [min_confines,max_confines]
        %            decimal_step-- is the search step in decimal space
        %Output:
        %            binary_space-- is the coded space in 0 or 1
        %            bits_sum--        is the total length of the binary_space of all the parameters
        %            bits--                is the length of every parameter

        [ decimal_space , binary_space,error_status] = SGA__binary_singlepoint_mutation( min_confines , max_confines , decimal_space, binary_space , bits , probability_mutation );

        if ( error_status ~= 0 )

            decimal_space = NaN;
            binary_space = NaN;

        end


        %%  real number encoding method
    elseif ( ( strcmpi ( 'Real' , options ) ) ||...
            ( strcmpi ( 'R '   , options ) )...
            )

        if ( error_status ~= 0 )

            decimal_space = NaN;
            binary_space = NaN;

        end

        %% and other en-coding method
    else

        if ( error_status ~= 0 )

            decimal_space = NaN;
            binary_space = NaN;

        end

    end

end
%SGA_mutation End