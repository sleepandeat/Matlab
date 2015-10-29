function [ coding_space , bits , error_status ] = SGA_encoding ( options, min_confines , max_confines , population , decimal_step  )

% /*M-FILE FUNCTION SGA_encoding MMM SGALAB */
% /*==================================================================================================
%    Simple Genetic Algorithm Pro Toolbox for Matlab 7.x
% ====================================================================================================
%File description:
%      Coding Function Of Simple Genetic Algorithm Program (Version 1.0.0.3 )
%      Support multi-dimesion parameters
%
%      Coding is the first step in SGA(Simple Genetic Algorithm )
%      this function provide several encoding method according to "options"
%

%Input:
%           options-- 'Binary' ,'b' :  binary encoding method
%                     'Real'   ,'r' :  real number encoding method
%                     'Literal','l' :  literal permutation encoding method
%                     'Gray'   ,'g' :  Gray encoding method
%                     'DNA'    ,'d' :  DNA encoding method
%                     'Messy'  ,'m'  :  Messy encoding method
%
%            ...

%Output:
%            coding_space      an array contain 1/0 element as a binary string
%            bits              the length of every paramete
%            error_status =    0 -- ok
%                              1 -- invalid parameter
%                              2 -- too many input arguments

%Appendix comments:

%Usage:
%
%
%Example :


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

% SGA_encoding Begin
error_status = 0 ;
%% check input & error protect
if ( nargin <= 2 )

    error ('SGA_encoding() Error: Input Parameters, Less than Requirement...');
    coding_space = NaN;
    bits = NaN;
    error_status = 1 ;
    return;
end
%% min_confines & max_confines check
if ( ( min_confines < max_confines ) ~= 1 )

    disp('SGA_encoding() Error: One of The input data confine Min > Max-> Check your Data!')

    coding_space = NaN;
    bits = NaN;
    error_status = 1 ;
    return;
end

%%
options = deblank( options );

%% en-coding method

%%  binary encoding method in array

if ( ( ( strcmpi ( 'Binary' , options ) )||...
        ( strcmpi ( 'B'      , options ) )...
        ) &&...
        ( nargin == 5 )...
        )


    %Input:
    %            min_confines-- is the minimum of input value in decimal-space
    %            max_confines-- is the maximum of input value in decimal-space
    %            population--   is the random decimal value in  [min_confines,max_confines]
    %            decimal_step-- is the search step in decimal space
    %Output:
    %            coding_space-- is the coded space in 0 or 1
    %            bits_sum--     is the total length of the coding_space of all the parameters
    %            bits--         is the length of every parameter

    [ coding_space,bits,error_status] = SGA__binary_encoding( min_confines , max_confines , population , decimal_step );

    if( error_status ~= 0 )
        coding_space = NaN;
        bits = NaN;

    end
    %%  real number encoding method
elseif ( ( strcmpi ( 'Real' , options ) ) ||...
        ( strcmpi ( 'R '   , options ) )...
        )

    error_status = 0;% add real encoding function here

    if( error_status ~= 0 )
        coding_space = NaN;
        bits = NaN;
    end

    %% and other en-coding method
else

    error_status = 0;% add other encoding function here

    if( error_status ~= 0 )
        coding_space = NaN;
        bits = NaN;
    end

end

%SGA_encoding End