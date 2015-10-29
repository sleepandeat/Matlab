function  [ decimal_space_crossover,binary_space_crossover,istate] = SGA__binary_singlepoint_crossover( min_confines , max_confines , decimal_space_selected , binary_space_selected , bits , probability_crossover )

% /*M-FILE FUNCTION SGA__binary_singlepoint_crossover MMM SGALAB */
% /*==================================================================================================
%                               Simple Genetic Algorithm Pro Toolbox for Matlab 7.x
% ====================================================================================================
%File description:
%      SGA__binary_singlepoint_crossover Function Of Simple Genetic Algorithm Program (Version 1.0.0.3 )
%      Support multi-dimesion parameters
%
%      Crossover is the step followed select in SGA(Simple Genetic Algorithm)
%      by single point cross method
%
%Input:
%            min_confines--           is the minimum of input value in decimal-space
%            max_confines--           is the maximum of input value in decimal-space
%            decimal_space_selected-- is the rest decimal_space from select function
%            probability_crossover--  is the random decimal value in  [min_confines,max_confines]
%            decimal_space_selected-- is the search step in decimal space
%            binary_space_selected--  is the coded space in 0 or 1
%            bits--                   is the length of every paramete
%            probability_crossover--  is the crossover probability in crossover step,
%                                     your can give it's value to reach your need (About:0~1)

%Output:
%               decimal_space_crossover-- is the result in decimal format
%               binary_space_crossove--   is the result in binary format
%               istate--             =    0 -- ok
%                                         1 -- invalid parameter
%                                         2 -- too many input arguments


%Appendix comments:


%Usage:
%[decimal_space_crossover,binary_space_crossover]=SGA_crossover(min_confines,max_confines,decimal_space_selected,binary_space_selected,bits,probability_crossover)
%
%example :
%          [binary_space,bits_sum,bits]=SGA_coding([1,2,3,4],[7,8,9,10],10,[0.01,0.01,0.01,0.01])
%          [decimal_space]                  =SGA_decoding([1,2,3,4],[7,8,9,10],binary_space,bits)
%          [fitness_value]                     =SGA_FITNESS_evaluating(decimal_space)

%[max_fitness_temp_position,decimal_space_selected,binary_space_selected,maxfitness]=SGA_selection(decimal_space,binary_space,fitness_value,bits)

%[decimal_space_crossover,binary_space_crossover]=SGA_crossover([1,2,3,4],[7,8,9,10],decimal_space_selected,binary_space_selected,bits,0.6)

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

% SGA__binary_singlepoint_crossover Begin
istate = 0 ;
if ( nargin ~= 6 )

    error ('SGA__binary_singlepoint_crossover() Error: Input Parameters...');
    decimal_space_crossover = NaN;
    binary_space_crossover= NaN;

    istate = 1 ;

else

    [ population , parameter_numbers ] = size ( decimal_space_selected );

    %[ range_min , range_max ]

    [ population , bits_sum ] = size ( binary_space_selected );

    probability_pairs_numbers = ceil ( probability_crossover * population / 2 );

    %initialize binary_space_crossover

    binary_space_crossover  =   binary_space_selected ;

    confines_deta           = ( max_confines - min_confines ) ;

    coded_step              =    confines_deta./ ( 2 .^ bits - 1 ) ;


    %bits_No is important
    bits_No = [ 0 , bits ];

    % to find out which is the binary parameter
    for idx = 1 : 1 : parameter_numbers

        %%to avoid that Index exceeds matrix dimensions

        bits_No ( idx + 1 ) = bits_No( idx + 1 ) + bits_No( idx );

    end

    %
    if ( probability_pairs_numbers < 1 )

        disp( 'SGA__binary_singlepoint_crossover() Error: the prabability of crossover is too small, please give another one!! ' )
        decimal_space_crossover = NaN;
        binary_space_crossover= NaN;
        istate = 1 ;
    end

    % set crossover points of every parameter
    %to avoid the same sites in colume 1 be used in colume 2
    %to avoid near relation's mating
    %to initialize pairs

    pairs = randint ( population/2 , 2 , [ 1 , population ] );

    %test_nonzeros_pairs=nnz(pairs)

    for idx = 1 : 1 : ( population/2 )

        while ( pairs( idx ,1) == pairs( idx , 2 ) | pairs( idx ,1) == 0 | pairs( idx , 2 ) == 0 )

            pairs( idx , 2 ) = randint(1 , 1 , population ) ;
            pairs( idx , 1 ) = randint(1 , 1 , population );

        end

    end

    % avoid the pairs has 0 element

    %   while nnz( pairs ) ~= ( ( population/2 ) .*2 )

    %       pairs = randint( population/2 , 2 , [ 1 , population ] );

    %   end


    % to choose crossover position from the pairs matrix
    %crossover_position is the pointer of pairs matrix
    %initialize  crossover_position

    crossover_position = randint( probability_pairs_numbers , 1 , [ 1 , population/2 ] );

    % to have different position in the next position

    for idx = 1 : 1 : probability_pairs_numbers

        for jdx = 1 : 1 : probability_pairs_numbers

            while ( ( ( idx ~= jdx ) & ( crossover_position ( idx ,1 ) == crossover_position( jdx , 1 ) ) ) | crossover_position( jdx , 1 ) == 0 )

                crossover_position( jdx ,1) = randint( 1 , 1 , [ 1 , population/2 ] ) ;

            end

        end

    end

    % to avoid the crossover_position has 0 element

    %     while nnz( crossover_position ) ~= ( ( probability_pairs_numbers ) .* 1 )

    %         crossover_position = randint( probability_pairs_numbers , 1 , [ 1 , population/2 ] );

    %     end


    % crossover begin

    for idx =1 : 1 : probability_pairs_numbers

        for kdx = 1 : 1 : parameter_numbers

            mating_point( kdx ) = randint( 1 , 1 , [ bits_No( kdx ) + 1 , bits_No( kdx + 1 ) ] ) ;


            for jdx = mating_point( kdx ) : 1 : bits_No( kdx + 1 )

                crossover_parts = binary_space_crossover( pairs ( crossover_position( idx ,1),1) , jdx );

                binary_space_crossover( pairs ( crossover_position( idx ,1 ) , 1 ) , jdx ) = binary_space_crossover( pairs ( crossover_position( idx ,1) , 2 ) , jdx );

                binary_space_crossover( pairs ( crossover_position( idx ,1 ) , 2 ) , jdx ) =crossover_parts ;

            end


        end

    end

    % binary_space_crossover_sparse = sparse( binary_space_crossover );

    %~~~~~~~~~~~~~~~~~~~~~~plot~~~~~~~~~~~~~~~~~~~~~
    % SPY Visualize sparsity pattern.
    % SPY(S) plots the sparsity pattern of the matrix S.

    %  figure(5)
    %  subplot(1,2,1)

    %  spy(binary_space_crossover_sparse,'b');

    %   title('the crossover binary-space in sparsity pattern');
    %   xlabel('Non-Zero bits');
    %   ylabel('Population');
    %   hold on;

    %  idx = 0 : 0.1 : population;

    %  for jdx =1 : 1 : parameter_numbers

    %    plot(bits_No( jdx + 1 ) , idx , 'r' );

    %  end


    % decimal_space_crossover=decimal_space;

    % important ,matrix of matlab begins from 1 ,not 0

    for idx = parameter_numbers : -1 : 1

        for jdx = population : -1 : 1

            for kdx = bits_No( idx + 1 ) : -1 : ( bits_No( idx ) + 1 )

                twos( jdx , kdx ) = pow2( bits_No( idx + 1 ) - kdx ) * binary_space_crossover( jdx ,kdx );

            end

            twos_sum( jdx ,idx ) = sum( twos ( jdx , : ) , 2 );

            decimal_space_crossover( jdx , idx ) = twos_sum( jdx , idx ) * coded_step( idx )+min_confines( idx );

        end

        twos = zeros( population , bits_sum ); %clear twos at present idx

        % X=Decimal*coded_step+min_confines

    end

    %~~~~~~~~~~~~plot~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    % figure(6)

    % idx = population: -1 : 1;

    % plot( decimal_space_crossover( idx , : ) , idx , '*' );
    % xlabel('crossover decimal-space');
    % ylabel('population');

    % title('the crosponding deciaml-space of binary-space');
    % grid on;
end

% SGA__binary_singlepoint_crossover End