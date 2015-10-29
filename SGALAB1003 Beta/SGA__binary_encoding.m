function [ binary_pool, bits, error_status ] = SGA__binary_encoding( min_confines,max_confines,population,steps )

% /*M-FILE FUNCTION SGA__binary_encoding MMM SGALAB */
% /*==================================================================================================
%                               Simple Genetic Algorithm Pro Toolbox for Matlab 7.x
% ====================================================================================================
%File description:
%      Coding Function Of Simple Genetic Algorithm Program (Version 1.0.0.3 )
%      in an  Array
%      Support multi-dimesion parameters
%
%      Coding is the first step in SGA(Simple Genetic Algorithm )
%      this coding function is to code variable by binary coding method .
%
%Input:

%       attention: when 'manual', design binary matrix as string format
%       such as: ['10010';'11111';'00000'](3*5)

%            data_space-- is original data matrix (m*n)
%                             where: m -- population
%                                    n -- total length of all variables array
%
%
%  e.g.                             x1  x2  x3   x4 x...
%       data_space  = [ populaton1: 3.8|3.6|74  |8 |...
%                       populaton2:   2|3  |7.7 |77|...
%                       populaton3: 356|65 |53  |6 |...

%                                   x1   x2   x3   x4  x...
%      coding_space = [ populaton1: 1010|0001|1010|0101|...
%                       populaton2: 1000|0101|1110|1101|...
%                       populaton3: 1011|0011|1011|1101|...
%Output:
%            coding_space-- is the coded space in 0 or 1 of binary format
%            error_status =    0 -- ok
%                              1 -- invalid parameter
%                              2 -- too many input arguments
%
%Example 1 : 'auto'
% [ binary_pool, bits, error_status ] = SGA__binary_encoding( [1.1,1],[2,3],20,[0.01,0.01])

%Example 2 : 'manual'
% [ binary_pool, bits, error_status ] = SGA__binary_encoding( ['10010';'11111';'00000'] )
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

% SGA__binary_encoding Begin
error_status = 0 ;
% Check input data

if ( nargin == 4 )

    if ( size( min_confines ) ~= size( max_confines ) ) % min_confines & max_confines check

        disp('SGA__binary_encoding() input error : The size of min_confines&max_confines do not match ')
        error_status = 1 ;
        bits = NaN;
        binary_pool = NaN;

        return;%Reinforce the robust of this function

    elseif ( min_confines < max_confines ) ~=1   % min_confines & max_confines check

        disp('SGA__binary_encoding() input error : min value > max value  ')
        error_status = 1 ;
        bits = NaN;
        binary_pool = NaN;
        return;

    elseif size( steps )~= size( max_confines-min_confines ) %check the size of steps
        disp('SGA__binary_encoding() input error : the steps and the confines_deta must be in same size')
        error_status = 1 ;
        bits = NaN;
        binary_pool = NaN;
        return;

    elseif ( steps < ( max_confines - min_confines )/2 )~=1 %check the size of steps
        disp('SGA__binary_encoding() input error : one of elements in the steps matrix is too large')
        error_status = 1 ;
        bits = NaN;
        binary_pool = NaN;
        return;

    elseif ( population > 0 )~= 1 % population check
        disp('SGA__binary_encoding() input error : every population members must be even Integer and larger than 0')
        error_status = 1 ;
        bits = NaN;
        binary_pool = NaN;
        return;

    elseif mod( population,2 )~= 0 % population check
        disp('SGA__binary_encoding() input error : the population must be even integer and larger than 0')
        error_status = 1 ;
        bits = NaN;
        binary_pool = NaN;
        return;

    elseif ( steps >=0 )~=1
        disp('SGA__binary_encoding() input error : the steps must be >= 0 ')
        error_status = 1 ;
        bits = NaN;
        binary_pool = NaN;
        return;

    else

        %% begin to coding
        %add all the binary parameters into a long-chromosome
        % count the sum bits

        confines_deta = ( max_confines - min_confines );

        % binary string 's length is sum up as following:
        % total_length = (binary_string1_length| binary_string2_length|binary_string3_length|...)
        % e.g.  ( 1010|0001|0101|...) = (1010|0001|0101|...)
        bits        = ceil( log2(confines_deta./steps) );

        %%%##if_002

        if ( min ( bits >= 1) ~= 1 )

            disp('SGA__binary_encoding() error :the bits must be > 0 ,please chose the min_confines and max_confines again.')

            error_status = 1 ;
            bits = NaN;
            binary_pool = NaN;

            return;

        end % end for ##if_002

        bits_sum = sum( bits , 2 );

        [ binary_pool ,error_status ] = SGA__binary_uniformly_encoding( population , bits_sum );

        if ( error_status ~= 0 )
            error_status = 1 ;
            bits = NaN;
            binary_pool = NaN;
            return ;
        end

        %%  TO PLOT
        %   figure
        % plot coding_space in sparse model
        % binary_space_sparse = sparse( binary_pool );
        % spy( binary_space_sparse );
        % hold on;

        %% initilize bits_No
        %% bits_No is important,it is the pointer of the bits

        bits_No = [ 0 , bits ];

        parameter_numbers  = size( bits , 2 );
        %%to find out which is the binary parameter
        %%   idx = 0 : 0.1 : population;

        for idx =1 : 1 : parameter_numbers
            %%to avoid that Index exceeds matrix dimensions
            bits_No( idx + 1 ) = bits_No( idx + 1 ) + bits_No( idx );

        end

        %   title('the Initialization of the coded binary-space in sparsity pattern');
        %   xlabel('Non-Zero bits');
        %   ylabel('Population');
    end
elseif( nargin == 2 )

    if ( isstr( min_confines ) )
        if(  size( min_confines ) > 0  )

            % convert int matrix -> string matrix , e.g.
            %         int [1001
            %              0001 ] (2*1)  -> string ['1001';
            %                                       '0001' ](2*4)
            %         temp_string_matrix = num2str( min_confines );

            [ population,binary_length ] = size( min_confines );

            % generate a int matrix as total column as a binary string
            % initialize
            temp_binary_matrix = zeros( population , binary_length );

            % convert character to int
            for idx = 1: 1: population
                for jdx = 1: 1: binary_length
                    temp_binary_matrix(idx, jdx) = str2num(min_confines(idx, jdx));
                end
            end
            % convert binary_pool
            [ binary_pool ,error_status ] = SGA__binary_manually_encoding( population , binary_length , temp_binary_matrix );
            %check binary length match the given binary or not
            if( sum(max_confines,2)== binary_length)
                bits = max_confines;
            else
                error_status = 1 ;
                bits = NaN;
                binary_pool = NaN;
                disp('SGA__binary_encoding() manual binary error')
                disp('binary length & binary matrix do NOT Match')
            end
        else
            error_status = 1 ;
            bits = NaN;
            binary_pool = NaN;
            disp('SGA__binary_encoding() manual binary error')

        end
    else
        error_status = 1 ;
        bits = NaN;
        binary_pool = NaN;
        disp('SGA__binary_encoding() input binary string should be string matrix ')

    end

else
    error_status = 1 ;
    bits = NaN;
    binary_pool = NaN;
    disp('SGA__binary_encoding() input error')
end
%   SGA__binary_encoding End
