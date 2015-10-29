function [ max_fitness_temp_position , decimal_space_selected , binary_space_selected , maxfitness_selection ,istate ] = SGA__binary_roulettewheel_selection( decimal_space , binary_space, fitness_value, bits )

% /*M-FILE FUNCTION SGA__binary_roulettewheel_selection MMM SGALAB */
% /*==================================================================================================
%    Simple Genetic Algorithm Pro Toolbox for Matlab 7.x
% ====================================================================================================
%File description:
%      SGA__binary_roulettewheel_selection Function Of Simple Genetic Algorithm Program (Version 1.0.0.3 )
%      Support multi-dimesion parameters
%
%      SGA__binary_roulettewheel_selection is one of most basic operators in SGA(Simple Genetic Algorithm)
%      by Roulette Wheel method


%Input:
%            decimal_space--  is the decimal space pool
%            binary_space--   is the coded space in 0 or 1
%            fitness_value--  is fitness value
%            bits--           is the length of every paramete


%Output:
%            max_fitness_temp_position--  is a temp pointer(not c pointer , only a int number ) for fitness value location
%            decimal_space_selected--     is decimal pool from selection operator
%            binary_space_selected--      is binary pool from selection operator
%            maxfitness_selection--       is max fitness value from selection operator

%            istate--       =    0 -- ok
%                                !0-- fail


%Appendix comments:


%Usage:
%[ max_fitness_temp_position , decimal_space_selected , binary_space_selected , maxfitness_selection ,istate ]=SGA__binary_roulettewheel_selection(min_confines,max_confines,decimal_space_selected,binary_space_selected,bits,probability_crossover)
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
%27-Jun-2003 Chen Yi Initial version       chen_yi2000@sina.com  Chongqing
%14-Jan-2005 Chen Yi update 1003           chenyi2005@gmail.com  Shanghai
%HISTORY$
%==================================================================================================*/

% SGA__binary_roulettewheel_selection Begin

istate = 0 ;
%% check input & error protect
if ( nargin ~= 4 )

    error ('SGA__binary_roulettewheel_selection() Error: Input Parameters...');
    max_fitness_temp_position = NaN;
    decimal_space_selected    = NaN;
    binary_space_selected     = NaN;
    maxfitness_selection      = NaN;
    istate = 1 ;

else
    %%
    %%  Roulette selection-method
    %initialize
    [ population , parameter_numbers ] = size( decimal_space );
    %
    fitness_desired_value = sum( fitness_value , 2 ) / population;

    % MAX(X) is the largest element in X

    maxfitness_selection = max( fitness_value );

    %bits_No is important

    bits_No = [ 0 , bits ];

    % to find out which is the binary parameter

    for jdx = 1 : 1 : parameter_numbers
        %to avoid that Index exceeds matrix dimensions
        bits_No( jdx + 1 ) = bits_No( jdx + 1 ) + bits_No( jdx );
    end

    for idx =1:1:population
        %work out the next Desired value of fitness
        M( idx ) = fitness_value( idx ) / fitness_desired_value;

        %select the number of decimal_space_old
        index_number( idx ) = floor( M( idx ) );
    end

    %sum the non-zeros members

    % if 00000
    if ( sum( index_number , 2 ) < population )

        % rest_population=population-sum(index_number,2);
        % SORT(X) sorts the elements of X in ascending order.

        index_number = sort( index_number,2);

        % for 00001
        for jdx = population : -1 : ( sum( index_number , 2 ) + 1 )% attention the -1 must be there

            index_number( jdx ) = index_number( jdx ) +1 ;

            % if 00001
            if ( sum( index_number ) == population )

                break;

            end % end if 00001

        end  % end for 00001

    end     % end if 00000


    %set temperary value

    fitness_value_temp = fitness_value;

    decimal_space_temp = decimal_space * 0 ; %set 0 to this temp matrix

    %set the order of decimal_space by fitness_value order
    for idx = population : -1 : 1

        [ max_fitness_temp(idx),max_fitness_temp_position(idx) ] = max( fitness_value_temp );

        fitness_value_temp( max_fitness_temp_position( idx ) ) = 0 ;

        decimal_space_temp( idx , : ) = decimal_space( max_fitness_temp_position( idx ) , : );

        %decimal_space_temp( idx , : ) = decimal_space_temp_sort( idx , : );
    end

    %set 0 to record the fitness position

    if ( min( find( index_number ) ) > 1 )

        for idx =1 : 1 : ( min( find( index_number )) - 1 )

            max_fitness_temp_position( idx ) = max_fitness_temp_position( population );
        end
    end

    %~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    %set 0 in the small probability position for the first time
    %~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

    for kdx =1 : 1 : population

        decimal_space( kdx , : ) = index_number( kdx ).*decimal_space_temp( kdx , : );

        decimal_space_temp( kdx , : ) = decimal_space( kdx ,: );

        %index_number( kdx ).*decimal_space_temp( kdx , : );
        if ( index_number( kdx ) ~= 0 )

            decimal_space( kdx , : ) = decimal_space_temp( kdx , : ) / index_number( kdx );

        end

    end
    % to see if the index of every parameter is the same length

    for idx = 1 : 1 : parameter_numbers

        index( idx ) = min(find(decimal_space_temp( : , idx ) ) );

    end

    index = min( index );

    % for 001
    for idx = index : 1 : population
        % if 001
        if ( decimal_space( idx , : ) ~=  decimal_space_temp( idx , : ) )

            %index_temp = min(find( decimal_space ));

            if ( index == 1 )

                break;

            end

        end % end if 001

        % for 002
        for jdx = ( index - 1 ) : -1 : 1

            %if 002
            if ( decimal_space( jdx , : ) ~= decimal_space( idx , : ) )

                decimal_space( jdx ) = decimal_space_temp( idx ) - decimal_space( idx );

                max_fitness_temp_position( jdx ) = max_fitness_temp_position( idx );

                % if 003
                if ( decimal_space( jdx , : ) ~= decimal_space( idx , : ) )


                    if ( jdx == 1 ) % if 004

                        decimal_space( jdx , : ) = decimal_space( population , : );

                    else

                        decimal_space(( jdx - 1 ),: ) = decimal_space( jdx , : ) - decimal_space( idx , : );

                        decimal_space( jdx , : ) = decimal_space( idx , : );

                        max_fitness_temp_position( jdx - 1 ) = max_fitness_temp_position( idx );

                    end % end  if 004

                else

                    %if decimal_space(j)==decimal_space(i);
                    break;

                end % end if 003

            end  % end if 002

        end    % end for 002

    end         % end for 001

    %end

    decimal_space_selected = decimal_space;

    %initialize binary_space_selected

    binary_space_selected = binary_space;
    %
    %       for kdx = 1 : 1 : parameter_numbers

    for idx = population : -1 : 1

        %  for jdx = ( bits_No( kdx ) + 1 ) : 1 : bits_No( kdx + 1 )

        binary_space_selected( idx , : ) = binary_space( max_fitness_temp_position( idx ) , : ) ;

        % end

    end

    %      end

    % binary_space_selected_sparse = sparse( binary_space_selected );

    %Plot
    % SPY Visualize sparsity pattern.
    % SPY(S) plots the sparsity pattern of the matrix S.

    % figure (1)

    % spy( binary_space_selected_sparse , 'r' );

    %  title('the Selected binary-space in sparsity pattern');
    %  xlabel('Non-Zero bits');
    %  ylabel('Population');

    %  hold on;

    %       idx = 0 : 0.1 : population
    %       for jdx = 1 : 1 : parameter_numbers

    %            plot( bits_No( jdx + 1 ) , idx , 'r' );

    %        end


    % figure (2)
    %  idx = population : -1 : 1
    %  plot( decimal_space_selected( idx , : ) , idx , '*' );
    %  xlabel('selected decimal-space');
    %  ylabel('population');
    %  title('the crosponding deciaml-space of binary-space');

    %  grid on;

    %
end
% SGA__binary_roulettewheel_selection End