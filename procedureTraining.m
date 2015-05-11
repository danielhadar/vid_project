function [ ] = procedureTraining( dirpath )
%% procedureTraining
% to run: 
% procedureTraining('/Volumes/My Passport/CK+/SetClips');

% ---- Pre-run definitions ----
% Add Java POI Libs to matlab javapath
javaaddpath('poi_library/poi-3.8-20120326.jar');
javaaddpath('poi_library/poi-ooxml-3.8-20120326.jar');
javaaddpath('poi_library/poi-ooxml-schemas-3.8-20120326.jar');
javaaddpath('poi_library/xmlbeans-2.3.0.jar');
javaaddpath('poi_library/dom4j-1.6.1.jar');
javaaddpath('poi_library/stax-api-1.0.1.jar');

% Ohter Stuff
lineCount = 2;

% Open statements
clc;
fprintf('---------------- \n');
fprintf('- Instructions - \n');
fprintf('----------------');
fprintf(['\n In the following experiment you will watch several clips of people\n ' ...
    'posing facial expressions to the camera. You will be asked to rate them on 3 scales (1-9): \n' ...
    ' (1) Pleasure-Displeasure. \n (2) Arousal-Nonarousal. \n (3) Dominance-Submissiveness.\n']);
[~] = input('\n >> Press Enter to continue');

fprintf('\n \n--------------------- \n');
fprintf('- A Few Definitions - \n');
fprintf('---------------------');
[~] = input('\n\n >> Press Enter to continue');

fprintf(['\n(1) Pleasure-Displeasure = How pleasant is the emotion? \n'...
    '     For Example: both anger and fear are unpleasant emotions, '...
    'while joy is a pleasant emotion.']);
[~] = input('\n\nPress Enter to see example clips');
[~] = input('\nHigh Pleasure #1: (First loading takes a few seconds) <Press Enter>');
playVid(dirpath,'TrainningSet/S026_006006.avi');
[~] = input('\nHigh Pleasure #2: <Press Enter>');
playVid(dirpath,'TrainningSet/S052_004004.avi');
[~] = input('\nHigh Displeasure #1: <Press Enter>');
playVid(dirpath,'TrainningSet/S095_002002.avi');
[~] = input('\nHigh Displeasure #2: <Press Enter>');
playVid(dirpath,'TrainningSet/S005_001001.avi');
[~] = input('\n\n Press Enter to continue');

fprintf(['\n(2) Arousal-Nonarousal = How intense is the emotion? \n'...
    '     For Example: while both anger and rage are unpleasant emotions, '...
    'rage is more intense than anger;\n     On the other hand, '...
    'boredom has a low arousal value (although it is also unpleasant).']);
[~] = input('\n\nPress Enter to see example clips');
[~] = input('\nHigh Arousal #1: <Press Enter>');
playVid(dirpath,'TrainningSet/S073_001001.avi');
[~] = input('\nHigh Arousal #2: <Press Enter>');
playVid(dirpath,'TrainningSet/S117_001001.avi');
[~] = input('\nLow Arousal #1: <Press Enter>');
playVid(dirpath,'TrainningSet/S505_002002.avi');
[~] = input('\nLow Arousal #2: <Press Enter>');
playVid(dirpath,'TrainningSet/S132_004004.avi');
[~] = input('\n\n Press Enter to continue');

fprintf(['\n(3) Dominance-Submissiveness = How controlling and approaching the emotion is? \n'...
    '     For Example: while both anger and fear are unpleasant emotions, '...
    'anger is dominant but fear is submissive.']);
[~] = input('\n\nPress Enter to see example clips');
[~] = input('\nHigh Dominance #1: <Press Enter>');
playVid(dirpath,'TrainningSet/S014_004004.avi');
[~] = input('\nHigh Dominance #2: <Press Enter>');
playVid(dirpath,'TrainningSet/S999_001001.avi');
[~] = input('\nHigh Submissiveness #1: <Press Enter>');
playVid(dirpath,'TrainningSet/S107_005005.avi');
[~] = input('\nHigh Submissiveness #2: <Press Enter>');
playVid(dirpath,'TrainningSet/S105_001001.avi');
[~] = input('\n\n Press Enter to continue');

[~] = input('\n\n Before we start, lets practice one rating session. Press the Enter key.');
fprintf(strcat('\n\nRating practice clip'));
fprintf('\n--------------------\n');
pause(0.5);
playVid(dirpath,'TrainningSet/S026_006006.avi');
[p] = input('Displeasure(1) - Pleasure(9) :  ');
[~] = input('Nonarousal(1) - Arousal(9):  ');
[~] = input('Submissiveness(1) - Dominance(9) :  ');
pause(0.5);
if (p < 7) 
    [~] = input('\n Watch again. Pleasure should probably be higher than 6.\nThe avarage of Pleasure-Displeasure is: 8.0');
    playVid(dirpath,'TrainningSet/S026_006006.avi');
else
    [~] = input('\n Good. The avarage of Pleasure-Displeasure is: 8.0');
end
pause(1);
[~] = input('\n >> The introduction is over. Call the experimenter to start. \n');


end

