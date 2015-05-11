function [] = showVid( dirpath )
%% Show all the videos in 'dir' and allow ratings. 
% showVid('/Volumes/My Passport/CK+/SetClips/?');  >> to run.

% ---- Pre-run definitions ----
% Add Java POI Libs to matlab javapath
javaaddpath('poi_library/poi-3.8-20120326.jar');
javaaddpath('poi_library/poi-ooxml-3.8-20120326.jar');
javaaddpath('poi_library/poi-ooxml-schemas-3.8-20120326.jar');
javaaddpath('poi_library/xmlbeans-2.3.0.jar');
javaaddpath('poi_library/dom4j-1.6.1.jar');
javaaddpath('poi_library/stax-api-1.0.1.jar');

% Constants
XLS_HEADLINE = {'Clip ID' 'Pleasure' 'Arousal' 'Dominance'};
XLS_FILENAME = 'Full_Rating.xlsx';

% Ohter Stuff
lineCount = 2;

% Initialize Excel file
subjNum = input('Subject Num (ID_Date_SubTestNum): ');
subjGender = input('Male or Female (0/1): ');
subjAge = input('Subject Age: ');
subjName = strcat('Subj_',num2str(subjNum),'_',num2str(subjGender),'_',num2str(subjAge));
xlwrite(XLS_FILENAME, XLS_HEADLINE, subjName, 'A1');
% ---- End of Pre-run definitions ----


% List videos
fileList = dir(dirpath);
fileList = fileList(randperm(size(fileList,1)),:);  % Randomize


% For each video
for file = fileList'
    clc;
    if (mod(lineCount,10) == 0)
        jheapcl(1);    % Clear Java Heap Memory 
    end
    fileName = file.name;
    if strcmp(fileName, '.') || strcmp(fileName, '..') ...
            || strcmp(fileName, 'TrainningSet') || strcmp(fileName, '.DS_Store')
        % patch matlab's bug in file list (remove . and ..)
        continue
    end
    
    fprintf('enter 0 for re-watching\n');
    fprintf(strcat('\nRating clip #',num2str(lineCount - 1)));
    fprintf('\n---------------\n');
    
    % -- START of playing --
    playVid(dirpath, fileName);
    % -- END of playing --
    
    % -*- Start of rating -*-
    % Get V-A-D inputs
    pleasure = 0;
    arousal = 0;
    dominance = 0;
    while ( (size(pleasure,1) == 0) || (pleasure < 1) || (pleasure > 9) )
        pleasure = input('Displeasure(1) - Pleasure(9) :  ');
        if (pleasure == 0)
            playVid(dirpath, fileName);
            clc;
            fprintf('enter 0 for re-watching\n');
            fprintf(strcat('\nRating clip #',num2str(lineCount - 1)));
            fprintf('\n---------------\n');
        end
    end
    while ( (size(arousal,1) == 0) || (arousal < 1) || (arousal > 9) )
        arousal = input('Nonarousal(1) - Arousal(9):  ');
        if (arousal == 0)
            playVid(dirpath, fileName);
            clc;
            fprintf('enter 0 for re-watching\n');
            fprintf(strcat('\nRating clip #',num2str(lineCount - 1)));
            fprintf('\n---------------\n');
            fprintf('Displeasure(1) - Pleasure(9) :  %d\n', pleasure);
        end
    end
    while ( (size(dominance,1) == 0) || (dominance < 1) || (dominance > 9) )
        dominance = input('Submissiveness(1) - Dominance(9) :  ');
        if (dominance == 0)
            playVid(dirpath, fileName);
            clc;
            fprintf('enter 0 for re-watching\n');
            fprintf(strcat('\nRating clip #',num2str(lineCount - 1)));
            fprintf('\n---------------\n');
            fprintf('Displeasure(1) - Pleasure(9) :  %d\n', pleasure);        
            fprintf('Nonarousal(1) - Arousal(9):  %d\n', arousal);
        end
    end
    
    % Write to excel
    cellNum = strcat('A',num2str(lineCount));
    fileId = strsplit(fileName, '.'); fileId = fileId(1);
    xlwrite(XLS_FILENAME, {fileId pleasure arousal dominance}, subjName, cellNum);
    lineCount = lineCount + 1;
    % -*- End of rating -*-
    pause(0.5);
end


fprintf('\nEnd of run. Thank you. \n\n');
end