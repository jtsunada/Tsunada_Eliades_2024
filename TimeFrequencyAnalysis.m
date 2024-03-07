function [Spec_each,t,f]=TimeFreqAnalysis(data)

% data: each ch data (duration 10s x trials)
% data sampling rate 1 kHz

width = 6;
f = 2.^([16:0.5:58]/8);
baseline=1000:1:1500;
data_sr=1000;

Spec_each=zeros(size(f,2),size(data,1),size(data,2));
for i=1:size(data,2)
    [S,t,f] = multienergyvec(data(:,i),f,samplingrate,width);
    Spec_each(:,:,i)=S;
end
% Spec_ave=nanmedian(Spec_each,3);
