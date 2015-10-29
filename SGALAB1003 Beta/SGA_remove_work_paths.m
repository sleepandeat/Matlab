% /*M-FILE SCRIPT SGA__remove_work_paths MMM SGALAB */ %
% /*==================================================================================================
%  Simple Genetic Algorithm Laboratory Toolbox for Matlab 7.x
% ====================================================================================================
%File description:
% we can remove every paths or sub-paths for SGALAB
%
%Appendix comments:

%Usage:

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
%14-Jan-2005 Chen Yi Initial version       chenyi2005@gmail.com  Shanghai 
%HISTORY$
%==================================================================================================*/
% SGA__remove_work_paths Begin 

%% get current SGALAB top directory
home;
clear;

SGA_work_path = cd;

%% get sub-directoies for SGALAB

%%% 1-AssistantGAsTools
SGA_work_path_AssistantGAsTools = strcat(SGA_work_path,'\AssistantGAsTools');
%%%1.1-AssistantGAsTools\GADS
  SGA_work_path_AssistantGAsTools_GADS = strcat(SGA_work_path,'\AssistantGAsTools\GADS');
  SGA_work_path_AssistantGAsTools_GADSDEMOS = strcat(SGA_work_path,'\AssistantGAsTools\GADS\DEMOS');
    
  %%%1.2 -AssistantGAsTools\GAOT
  SGA_work_path_AssistantGAsTools_GAOT = strcat(SGA_work_path,'\AssistantGAsTools\GAOT');

   %%%1.3 -AssistantGAsTools\GEATbx
  SGA_work_path_AssistantGAsTools_GEATbx = strcat(SGA_work_path,'\AssistantGAsTools\GEATbx');
  SGA_work_path_AssistantGAsTools_GEATbx_TEST_Functions = strcat(SGA_work_path,'\AssistantGAsTools\GEATbx\TEST_Functions');
 
  %%%1.4 -AssistantGAsTools\SA_Tools
  SGA_work_path_AssistantGAsTools_SA_Tools = strcat(SGA_work_path,'\AssistantGAsTools\SA_Tools');

  
%%% 2-Demos
SGA_work_path_Demos             = strcat(SGA_work_path,'\Demos ');

%%% 3-Documents
SGA_work_path_Documents         = strcat(SGA_work_path,'\Documents');

%%% 4-Figures
SGA_work_path_Figures           = strcat(SGA_work_path,'\Figures');

%%% 5-FileExchangeTools
SGA_work_path_FileExchangeTools = strcat(SGA_work_path,'\FileExchangeTools');

 %%%% 5.1-\FileExchangeTools\Click3DPoint
 SGA_work_path_FileExchangeTools_Click3DPoint = strcat(SGA_work_path,'\FileExchangeTools\Click3DPoint');
  
 %%%% 5.2-\FileExchangeTools\Automated_Flowgraph_Analysis_Tool
 SGA_work_path_FileExchangeTools_Automated_Flowgraph_Analysis_Tool= strcat(SGA_work_path,'\FileExchangeTools\Automated_Flowgraph_Analysis_Tool');
     
 %%%% 5.3-\FileExchangeTools\Stochastic_Processes
 SGA_work_path_FileExchangeTools_Stochastic_Processes = strcat(SGA_work_path,'\FileExchangeTools\Stochastic_Processes');
 
 %%%% 5.4-\FileExchangeTools\akima
 SGA_work_path_FileExchangeTools_akima = strcat(SGA_work_path,'\FileExchangeTools\akima');
 
 %%%% 5.5-\FileExchangeTools\AutoTest_Script_for_Simulink
 SGA_work_path_FileExchangeTools_AutoTest_Script_for_Simulink = strcat(SGA_work_path,'\FileExchangeTools\AutoTest_Script_for_Simulink');
 
 %%%% 5.6-\FileExchangeTools\Mp3_toolbox
 SGA_work_path_FileExchangeTools_Mp3_toolbox = strcat(SGA_work_path,'\FileExchangeTools\Mp3_toolbox');
 
 %%%% 5.7-\FileExchangeTools\utility
 SGA_work_path_FileExchangeTools_utility = strcat(SGA_work_path,'\FileExchangeTools\utility');

 %%%% 5.8-\FileExchangeTools\TimeFrequencyToolbox
 SGA_work_path_FileExchangeTools_TimeFrequencyToolbox = strcat(SGA_work_path,'\FileExchangeTools\TimeFrequencyToolbox');
     
%%%% 5.9-\FileExchangeTools\TimeSeriesAnalysis
SGA_work_path_FileExchangeTools_TimeSeriesAnalysis = strcat(SGA_work_path,'\FileExchangeTools\TimeSeriesAnalysis');

%%%% 5.10-\FileExchangeTools\ParticleSwarmOptimizationToolbox
SGA_work_path_FileExchangeTools_ParticleSwarmOptimizationToolbox = strcat(SGA_work_path,'\FileExchangeTools\ParticleSwarmOptimizationToolbox');

     
%%% 6-history
%SGA_work_path_history          = strcat(SGA_work_path,'\history');

%%% 7-private
%SGA_work_path_private          = strcat(SGA_work_path,'\private');

%%% 8-TestFunctions
SGA_work_path_SGALAB_TestFunctions     = strcat(SGA_work_path,'\SGALAB_TestFunctions');

%%% 9-UserInterface
SGA_work_path_GUI     =strcat(SGA_work_path,'\SGALAB_GUI ');

%%% 10-SGALAB_Funcs
SGA_work_path_SGALAB_Funcs     =strcat(SGA_work_path,'\SGALAB_Funcs ');

%%% 11-SGALAB_Temporary
SGA_work_path_SGALAB_Temporary     =strcat(SGA_work_path,'\SGALAB_Temporary ');

%% add some necessary sub-dirs

%%% 1-AssistantGAsTools
rmpath(SGA_work_path_AssistantGAsTools);
 %%% 1.1-AssistantGAsTools\GADS
 rmpath(SGA_work_path_AssistantGAsTools_GADS);
 rmpath(SGA_work_path_AssistantGAsTools_GADSDEMOS);
 
  %%%1.2 -AssistantGAsTools\GAOT
  rmpath(SGA_work_path_AssistantGAsTools_GAOT);

  %%%1.3 -AssistantGAsTools\GEATbx
  rmpath(SGA_work_path_AssistantGAsTools_GEATbx);
  rmpath(SGA_work_path_AssistantGAsTools_GEATbx_TEST_Functions);
  
  %%%1.4 -AssistantGAsTools\SA_Tools.
  rmpath(SGA_work_path_AssistantGAsTools_SA_Tools);
%%% 2-Demos
rmpath(SGA_work_path_Demos);

%%% 3-Documents
rmpath(SGA_work_path_Documents);

%%% 4-Figures
rmpath(SGA_work_path_Figures);

%%% 5-FileExchangeTools
rmpath(SGA_work_path_FileExchangeTools);

%%5.1-FileExchangeTools\Click3DPoint
rmpath(SGA_work_path_FileExchangeTools_Click3DPoint);
     
%%5.2-\FileExchangeTools\Automated_Flowgraph_Analysis_Tool
rmpath(SGA_work_path_FileExchangeTools_Automated_Flowgraph_Analysis_Tool);

%%%% 5.3-\FileExchangeTools\Stochastic_Processes
rmpath(SGA_work_path_FileExchangeTools_Stochastic_Processes);

%%%% 5.4-\FileExchangeTools\akima
rmpath(SGA_work_path_FileExchangeTools_akima);

%%%% 5.5-\FileExchangeTools\AutoTest_Script_for_Simulink
rmpath(SGA_work_path_FileExchangeTools_AutoTest_Script_for_Simulink);

%%%% 5.6-\FileExchangeTools\Mp3_toolbox
rmpath(SGA_work_path_FileExchangeTools_Mp3_toolbox);

%%%% 5.7-\FileExchangeTools\utility
rmpath(SGA_work_path_FileExchangeTools_utility);

%%%% 5.8-\FileExchangeTools\TimeFrequencyToolbox
rmpath(SGA_work_path_FileExchangeTools_TimeFrequencyToolbox);
     
%%%% 5.9-\FileExchangeTools\TimeSeriesAnalysis
rmpath(SGA_work_path_FileExchangeTools_TimeSeriesAnalysis);

%%%% 5.10-\FileExchangeTools\ParticleSwarmOptimizationToolbox
rmpath(SGA_work_path_FileExchangeTools_ParticleSwarmOptimizationToolbox);

%%% 6-history
%rmpath(SGA_work_path_history);

%%% 7-private
%rmpath(SGA_work_path_private);

%%% 8-TestFunctions
rmpath(SGA_work_path_SGALAB_TestFunctions);

%%% 9-UserInterface
rmpath(SGA_work_path_GUI);

%%% 10-SGALAB_Funcs
rmpath(SGA_work_path_SGALAB_Funcs);

%%% 11-SGALAB_Temporary
rmpath(SGA_work_path_SGALAB_Temporary);


clear  SGA_work_path*

%home ;
%warning off REGEXP:multibyteCharacters
%warning off MATLAB:rmpath:DirNotFound
%SGA_work_path = genpath( cd );
%rmpath(lower(SGA_work_path));
%rmpath('E:\matlab_tools\sgalab1003\demos')

% SGA__remove_work_paths End 

