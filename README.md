# Tsunada_Eliades_2024
Matlab codes used for Tsunada and Eliades (2024)

1. Matlab programs for controlling experiments are available upon request.
   
   -Vocal recording with a National Instruments DAQ board
   -Playback of shifted auditory feedback with Eventide Eclipse V4
   -Neural recording with TDT system

3. Extraction of LFPs from raw recording data
   
   a) Bandpass filter design: matlab function "butter" (e.g., [b,a]=butter(4,[4 8]/(1000/2),'bandpass');)
       Broadband LFP (1-300 Hz)
       Theta band (4-8 Hz)
       Gamma band (25-50 Hz)
       MUA (300-6000 Hz) 
   b) Filtering: matlab function "filtfilt" (e.g., Data_filtered=filtfilt(b,a,Data))
   c) Baseline normalization: dividing activity by baseline activity
       Baseline period: 3-2.5s before vocal production

4. Time-frequency analysis of broadband LFP
   
   Morlet wavelet transform (the width of Gaussian as 6, frequency range from 4 Hz to 150 Hz) for individual vocal response, followed by averaging
  across vocal events.
  Wavelet codes are modified from matlab EEG toolbox provided by Michael Khahana lab (https://memory.psych.upenn.edu/Software).

5. Granger causality analysis
   
  We used the FieldTrip toolbox (https://www.fieldtriptoolbox.org/).
  
  Robert Oostenveld, Pascal Fries, Eric Maris, and Jan-Mathijs Schoffelen. FieldTrip: Open Source Software for Advanced Analysis of MEG, EEG, and Invasive Electrophysiological Data. Computational Intelligence and Neuroscience, 2011; 2011:156869.

  For example...
  cfg         = [];
  cfg.order   = 5;
  cfg.toolbox = 'bsmart';
  mdata       = ft_mvaranalysis(cfg, data);
  cfg.method = 'mvar';
  mfreq      = ft_freqanalysis(cfg, mdata);    
  cfg.method    = 'granger';
  granger       = ft_connectivityanalysis(cfg, mfreq);

  
6. Vocal acoustic analysis
   
   custom-made matlab codes used for previous studies (e.g., Eliades and Tsunada, 2018)
   a) Detection of vocalizations based on crossings of a sound amplitude threshold
   b) Fine adjustment of vocal onset and offset times
   c) Classification of call types based on visual inspection of spectrograms
   d) Characterization of the acoustic properties and call structure of each vocalization, including fundamental frequency, call loudness, and duration. 

7. Anatomical localization
   
   We used the marmoset brain atlas (https://3dviewer.marmosetbrainmapping.org/).

8. Basic statistical tests
   
  a) Wilcoxon sign-rank test: matlab function "ranksum"
  b) Spearman's rank correlation analysis: matlab function "corr" with "spearman" option 
  c) Linear regression analysis: matlab function "regress"
  d) Friedman test: modified a
  e) False discovery rate (FDR) correction: David Groppe (2024). fdr_bh (https://www.mathworks.com/matlabcentral/fileexchange/27418-fdr_bh), MATLAB Central File Exchange.
   
