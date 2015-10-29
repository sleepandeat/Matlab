function [ decimal_pool,error_status ] = SGA_decoding( options, min_confines , max_confines , coding_space , bits )

% /*M-FILE FUNCTION SGA_decoding MMM SGALAB */
% /*==================================================================================================
%    Simple Genetic Algorithm Pro Toolbox for Matlab 7.x
% ====================================================================================================
%File description:
%      Decoding Function Of Simple Genetic Algorithm Program (Version 1.0.0.3 )
%      Support multi-dimesion parameters
%
%       Decoding is the second step in SGA(Simple Genetic Algorithm )
%       this decoding function is deconding the binary value which coded by coding
%       function ,that is to say you should use coding function first
%       it can transfer binary value to decimal value
%
%Input:
%           options-- 'Binary' ,'b' :  binary encoding method
%                     'Real'   ,'r' :  real number encoding method
%                     'Literal','l' :  literal permutation encoding method
%                     'Gray'   ,'g' :  Gray encoding method
%                     'DNA'         :  DNA encoding method
%                     'Messy'  ,m'  :  Messy encoding method
%

%Appendix comments:

%Usage:
% [ decimal_pool,istate ] = SGA__binary_decoding( min_confines , max_confines , coding_space , bits )

%   in the method of 'X=Decimal*decimal_step+min_confines'
%   decimal_pool is the decimal number which from coding_space
%   min_confines is the minimum of input value in decimal-space
%   max_confines is the maximum of input value in decimal-space


%Example1:
%     f(x)=1./a+sin(b)+exp(c)+log2(d)+10 , a,b,c,d belong to [1,7],[2,8],[3,9],[4,10]
%    [ coding_space , bits_sum , bits,istate ] = SGA__binary_encoding([1,2,3,4],[7,8,9,10],10,[0.01,0.01,0.01,0.01])
%    [ decimal_pool,istate ]=SGA__binary_decoding([1,2,3,4],[7,8,9,10],coding_space,bits)
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


% SGA_decoding() Begin
error_status = 0;
%% check input & error protect
if ( nargin <= 2 )

    error ('SGA_decoding() Error: Input Parameters, Less than Requirement...');
    decimal_pool = NaN;
    error_status = 1;
    return;
end
%% min_confines & max_confines check
if ( ( min_confines < max_confines ) ~= 1 )

    disp('SGA_decoding() Error: One of The input data confine Min > Max-> Check your Data!')

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
        ) )


    %Input:
    %            min_confines--  is the minimum of input value in decimal-space
    %            max_confines-- is the maximum of input value in decimal-space
    %            population--      is the random decimal value in  [min_confines,max_confines]
    %            decimal_step-- is the search step in decimal space
    %Output:
    %            coding_space-- is the coded space in 0 or 1
    %            bits_sum--        is the total length of the coding_space of all the parameters
    %            bits--                is the length of every parameter

    [ decimal_pool,error_status ] = SGA__binary_decoding(  min_confines , max_confines , coding_space , bits  );

    if ( error_status ~= 0 )
        decimal_pool = NaN;
    end


    %%  real number decoding method
elseif ( ( strcmpi ( 'Real' , options ) ) ||...
        ( strcmpi ( 'R '   , options ) )...
        )

    error_status = 0;% add real decoding function here

    if( error_status ~= 0 )
        decimal_pool = NaN;
    end

    %% and other en-coding method
else

    error_status = 0;% add other decoding function here

    if( error_status ~= 0 )
        decimal_pool = NaN;
    end

end

% SGA_decoding end