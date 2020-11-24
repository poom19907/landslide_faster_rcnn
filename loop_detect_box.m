clc
clear
close all

load('ImageSource_700.mat')
load('labeled_700.mat')
load('detector_vary_normal.mat')
load('labeled_770.mat')
% i=1;
% length(ImageSource_700)
for i=1:length(ImageSource_700)
    path = ImageSource_700{i};
    img = imread(path);
    [bbox, score, label] = detect(detector,img);
    Box{i}=bbox;
    Score{i}=score;
    groundTruthBox = cell2mat((labeled_770(i,1)));
   
    detectedImg = insertShape(img,'Rectangle',bbox,'Color','red');
    detectedImg2 = insertShape(detectedImg,'Rectangle',groundTruthBox,'Color','white');

    sp = ['./view_result_rgb\',ImageSource_700{i}(12:end)];
    imwrite(detectedImg2,sp)
end
save('detector_vary_normal_score')