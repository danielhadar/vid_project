function [] = playVid(dirpath, fileName)
%% playVid

% Constants
NUM_OF_TIMES_TO_PLAY = 2;
WAIT_BEFORE_START = 0.5;
FPS = 0.02;

videoFReader = vision.VideoFileReader(fullfile(dirpath, fileName));
videoPlayer = vision.VideoPlayer('Position', [200 200 800 800]);
for i = 1:NUM_OF_TIMES_TO_PLAY
    pause(WAIT_BEFORE_START);
    while ~isDone(videoFReader)
        frame = step(videoFReader);
        pause(FPS);
        step(videoPlayer, frame);
    end
reset(videoFReader);
end
pause(WAIT_BEFORE_START);
hide(videoPlayer);

end