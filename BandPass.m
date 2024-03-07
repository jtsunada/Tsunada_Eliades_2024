function [theta,alpha,beta,gamma,hg]=BandPass(data)

% data: time
% before filtering, we did global referencing using median activity across all the chs
% downsampling from 24414 Hz to 1kHz

neural_sr=1000;

[b,a]=butter(4,[4 8]./(neural_sr./2),'bandpass');
theta=abs(hilbert(filtfilt(b,a,data)));

[b,a]=butter(4,[8 13]./(neural_sr./2),'bandpass');
alpha=abs(hilbert(filtfilt(b,a,data)));

[b,a]=butter(4,[13 28]./(neural_sr./2),'bandpass');
beta=abs(hilbert(filtfilt(b,a,data)));

[b,a]=butter(4,[28 70]./(neural_sr./2),'bandpass');
gamma=abs(hilbert(filtfilt(b,a,data)));

[b,a]=butter(4,[70 150]./(neural_sr./2),'bandpass');
hg=abs(hilbert(filtfilt(b,a,data)));
