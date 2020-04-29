%{
vid = VideoReader('yourvideo.avi');
implay('yourvideo.avi');
% Create a cascade detector object.
faceDetector = vision.CascadeObjectDetector();

% Read a video frame and run the face detector.
videoFrame      = readFrame(vid);
bbox            = step(faceDetector, videoFrame);

% Draw the returned bounding box around the detected face.
videoFrame = insertShape(videoFrame, 'Rectangle', bbox);
figure; imshow(videoFrame); title('Detected face');
%}
load('breastcone.mat');

positiveInstances = stopSignsAndCars(:,1:2);

imDir = fullfile(matlabroot,'toolbox','vision','visiondata',...
    'stopSignImages');
addpath(imDir);

negativeFolder = fullfile(matlabroot,'toolbox','vision','visiondata',...
    'nonStopSigns');
negativeImages = imageDatastore(negativeFolder);

trainCascadeObjectDetector('fullimage.JPG',positiveInstances, ...
    negativeFolder,'FalseAlarmRate',0.1,'NumCascadeStages',5);

detector = vision.CascadeObjectDetector('stopSignDetector.xml');

img = imread('stopSignTest.jpg');

bbox = step(detector,img);

detectedImg = insertObjectAnnotation(img,'rectangle',bbox,'stop sign');

figure; imshow(detectedImg);

