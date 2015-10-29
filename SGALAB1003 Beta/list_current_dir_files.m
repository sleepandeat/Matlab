function cellFiles = list_current_dir_files(typeOFfiles)

% list_current_dir_files  Make a list of files in the current directory and saves
%        in a cell.
%      CELLlist_current_dir_files = list_current_dir_files(TYPEOFlist_current_dir_files), find the files that look as the
%      expression TYPEOFlist_current_dir_files
%
%Example1: the statement "A = list_current_dir_files('*.ppk')" find all files with
% extension ppk and saves it into the variable A

%Example2: the statement  "A = list_current_dir_files" is to list all
% directories and files in current directory


% Copyright: A. Sabino,  asabino79@gmail.com  
%            D. Barraez, dbarraez@euler.ciens.ucv.ve
% Department of Random Models, Faculty of Science
% Central University of Venezuela. Caracas, Venezuela.
%===================================================================================================
%Revision -
%Date        Name       Description of Change   email                         Location
%            A. Sabino  Initial version         asabino79@gmail.com           Caracas, Venezuela
%            D. Barraez Initial version         dbarraez@euler.ciens.ucv.ve   Caracas, Venezuela
%10-May-2005 Chen Yi    Add Example and history chenyi2005@gmail.com          Shanghai 
%HISTORY$
%==================================================================================================*/

if nargin < 1
    typeOFfiles = '*.*';
end

% Initialize the constant
FIRST_COMMAND = 'dir ';
SECOND_COMMAND = ' /b';

% Get the files in the current directory
[state, currentFiles] = dos([FIRST_COMMAND,typeOFfiles,SECOND_COMMAND]);

% Initialize the variable cellFiles, that will saves the file's name in the
% current directory
word = ''; % Variable that saves a temporal file name
cellFiles = cell(1,1); % Variable that contains the files in the current
                       % directory

% Verifing if the directory is empty or not
if state == 0 
    for icharacter = 1:length(currentFiles)
        if double(currentFiles(icharacter))==10
            cellFiles{length(cellFiles),1} = word;
            cellFiles{length(cellFiles)+1,1} = '';
            word = '';
        else
            word(length(word)+1) = currentFiles(icharacter);
        end
    end
    cellFiles = cellFiles(1:length(cellFiles)-1,1);
else
    cellFiles{1,1} = 'Empty';
end