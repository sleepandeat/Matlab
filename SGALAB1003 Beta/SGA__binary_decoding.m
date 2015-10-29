function [ decimal_pool, error_status ] = SGA__binary_decoding( min_confines , max_confines , binary_pool , bits )

% /*M-FILE FUNCTION SGA__binary_decoding MMM SGALAB */
% /*==================================================================================================
%                               Simple Genetic Algorithm Pro Toolbox for Matlab 7.x
% ====================================================================================================
%File description:
%      Binary Decoding Function Of Simple Genetic Algorithm Program (Version 1.0.0.3 )
%      Support multi-dimesion parameters
%
%       Decoding is the second step in SGA(Simple Genetic Algorithm )
%       this decoding function is deconding the binary value which coded by coding
%       function ,that is to say you should use coding function first
%       it can transfer binary value to decimal value
%
%Input:
%            min_confines--  is the minimum of input value in decimal-space
%            max_confines-- is the maximum of input value in decimal-space
%            binary_pool--  is the coded space in 0 or 1
%            bits--         is the length of every parameter

%Output:
%            decimal_pool-- is the search step in decimal space
%            error_status-- =    0 -- ok
%                               !0-- fail


%Appendix comments:

%Usage:
%[ decimal_pool, error_status ] = SGA__binary_decoding( min_confines ,
%max_confines , binary_pool , bits )

%    in the method of 'X=Decimal*decimal_step+min_confines'
%   decimal_pool is the decimal number which from binary_pool
%   min_confines is the minimum of input value in decimal-space
%   max_confines is the maximum of input value in decimal-space


%Example1:
% [ coding_space,bits,error_status ] = SGA__binary_encoding( [1.1,1],[2,3],10,[0.01,0.01]);
% [ decimal_pool, error_status ] = SGA__binary_decoding([1.1,1],[2,3] , coding_space , bits)
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

% SGA__binary_decoding Begin
error_status = 0 ;
% check input parameters
if( nargin == 4 )
    % min_confines & max_confines check
    % if #0001
    if ( size( min_confines ) ~= size( max_confines ))

        disp('SGA__binary_decoding() error: The size of min_confines&max_confines do not match')

        decimal_pool = NaN;

        error_status = 1 ;

        % min_confines & max_confines check
    elseif ( ( min_confines < max_confines ) ~= 1 )

        disp('SGA__binary_decoding() error: One of The Min=Min! Check your Data!')

        decimal_pool = NaN;

        error_status = 1 ;

    else

        [ population , bits_sum ] = size( binary_pool );

        confines_deta           = ( max_confines - min_confines );

        coded_step              = confines_deta./( 2.^bits - 1 );

        [ parameter_numbers ]     = size( bits , 2 );

        %bits_No is important, it's the pointer for binary_pool
        bits_No = [ 0, bits ];

        % to find out which is the binary parameter

        for idx = 1 : 1 : parameter_numbers

            %to avoid that Index exceeds matrix dimensions
            bits_No( idx + 1 ) = bits_No( idx + 1 ) + bits_No( idx );

        end

        % important ,matrix of matlab begins from 1 ,not 0

        for idx = parameter_numbers: -1 : 1,

            for jdx = population : -1 : 1 ,

                for kdx = bits_No(idx + 1 ) : -1 : ( bits_No( idx ) + 1 ),

                    pairs( jdx ,kdx ) = pow2( bits_No( idx + 1 ) - kdx ) * binary_pool( jdx , kdx );

                end

                pairs_sum( jdx ,idx ) = sum( pairs( jdx , : ) , 2 ) ;

                decimal_pool( jdx , idx ) = pairs_sum( jdx , idx ) * coded_step( idx )+ min_confines( idx );
            end

            pairs = zeros( population , bits_sum );%clear pairs at present idx
            % X=Decimal*coded_step+min_confines
        end


        %Plot
        % figure( 2000 )
        %    idx = population : -1 : 1 ;
        %
        %    plot( decimal_pool ( idx , : ) , idx ,'*');
        %
        %    xlabel('initialized decimal-space');
        %    ylabel('population');
        %    title('the corresponding deciaml-space of binary-space');

        %    grid on;

    end % for if #0001


else
    decimal_pool = NaN;
    error_status = 1;
end

% SGA__binary_decoding End