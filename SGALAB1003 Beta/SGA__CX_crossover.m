function  [ path_code_string, istate ] = SGA__CX_crossover( path_code_string, probability_crossover )

% /*M-FILE FUNCTION SGA__CX_crossover MMM SGALAB */
% /*==================================================================================================
%  Simple Genetic Algorithm Pro Toolbox for Matlab 7.x
% ====================================================================================================
%File description:
%      SGA__CX_crossover Function Of Simple Genetic Algorithm Program (Version 1.0.0.3 )
%      Support multi-dimesion parameters
%
%     Cycle Crossover, CX
%
%Input:

%            probability_crossover--  is the crossover probability in crossover step,
%                                     your can give it's value to reach your need (About:0~1)

%Output:


%Appendix comments:


%Usage:

%
%example :
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
%14-Jul-2005 Chen Yi initial               chenyi2005@gmail.com  Shanghai
%HISTORY$
%==================================================================================================*/

% SGA__CX_crossover Begin
istate = 0 ;
MIN_POPULATION = 30 ;


if ( nargin ~= 2 )

    error ('SGA__CX_crossover() Error: Input Parameters...');
    pmx_path_code_string = NaN;

    istate = 1 ;

else
    [ population , parameter_numbers ] = size ( path_code_string );


    if( mod(population,2)~= 0 )
        error ('SGA__CX_crossover() Error: Input Parameters...');
        error ('population should be even number ');

        pmx_path_code_string = NaN;
        istate = 1 ;

    elseif (  population < 2 )
        error ('SGA__CX_crossover() Error: Input Parameters...');
        error ('population should be > 30 ');

        pmx_path_code_string = NaN;
        istate = 1 ;
    end

    probability_pairs_numbers = ceil ( probability_crossover * population / 2 );
    %
    if ( probability_pairs_numbers < 1 )

        error( 'SGA__CX_crossover() Error: the prabability of crossover is too small, please give another one!! ' );
        pmx_path_code_string = NaN;
        istate = 1 ;
    end
    % set crossover points of every parameter
    %to avoid the same sites in colume 1 be used in colume 2
    %to avoid near relation's mating
    %to initialize pairs

    pairs = randint ( population/2 , 2 , [ 1 , population ] );

    % to avoid same position
    for idx = 1 : 1 : ( population/2 )

        while ( pairs( idx ,1) == pairs( idx , 2 )| pairs( idx ,1) ==0 | pairs( idx ,2 ) == 0)

            pairs( idx , 2 ) = randint(1 , 1 , [ 1 , population ] );
            pairs( idx , 1 ) = randint(1 , 1 , [ 1 , population ] );

        end

    end

    % to choose crossover position from the pairs matrix
    % crossover_position is the pointer of pairs matrix
    % initialize  crossover_position

    crossover_position = randint( probability_pairs_numbers , 1 , [ 1 , population/2 ] );
    % to have different position in the next position

    for idx = 1 : 1 : probability_pairs_numbers

        for jdx = 1 : 1 : probability_pairs_numbers

            while ( ( ( idx ~= jdx ) & ( crossover_position ( idx ,1 ) == crossover_position( jdx , 1 ) ) ) | crossover_position( jdx , 1 ) == 0 )

                crossover_position( jdx ,1) = randint( 1 , 1 , [ 1 , population/2 ] ) ;

            end

        end

    end

    % generate mating point for every chromosome
    % find 2 point in a chromosome
    mating_point = randint( probability_pairs_numbers , 2 , [ 1 , parameter_numbers ] ) ;
    % to avoid same position
    for idx = 1 : 1 : probability_pairs_numbers
        % first point location should be < second point
        while ( mating_point( idx ,1) >= mating_point( idx , 2 ) |...
                mating_point( idx ,1) == 0 |...
                mating_point( idx , 2 ) == 0 |...
                mating_point( idx ,1) == ( mating_point( idx , 2 ) - 1 ) )

            mating_point( idx , 2 ) = randint(1 , 1 , [1,parameter_numbers] );
            mating_point( idx , 1 ) = randint(1 , 1 , [1,parameter_numbers] );

        end

    end

%begin to crossver

    for idx = 1 : 1 : probability_pairs_numbers
 
        
        
    end

end

