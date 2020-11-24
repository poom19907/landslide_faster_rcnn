clc
clear
close all

load('detector_vary_normal_score.mat','Score')

Score2 = Score(~cellfun(@isempty,Score));
for i=1:length(Score2)
   Score3{i}(1) = Score2{i}(1);
end
total = 0;
for i=1:length(Score3)
   total = Score3{i}+total;
end
Accuracy = total/length(Score3);