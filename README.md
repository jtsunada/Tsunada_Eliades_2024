# Tsunada_Eliades_2024
Matlab codes used for Tsunada and Eliades (2024)

### 1. Matlab programs for controlling experiments are available upon request.
   
   - [ ] Vocal recording with a National Instruments DAQ board
   - [ ] Playback of shifted auditory feedback with Eventide Eclipse V4
   - [ ] Neural recording with TDT system

### 2. Extraction of LFPs from raw recording data
   
   - [ ]  Bandpass filter design: matlab function "butter" (e.g., [b,a]=butter(4,[4 8]/(1000/2),'bandpass');)
       - Broadband LFP (1-300 Hz)
       - Theta band (4-8 Hz)
       - Gamma band (25-50 Hz)
       - MUA (300-6000 Hz) 
   - [ ]  Filtering: matlab function "filtfilt" (e.g., Data_filtered=filtfilt(b,a,Data))
   - [ ]  Baseline normalization: dividing activity by baseline activity
       Baseline period: 3-2.5s before vocal production

### 3. Time-frequency analysis of broadband LFP
   
  - [ ] Morlet wavelet transform (the width of Gaussian as 6, frequency range from 4 Hz to 150 Hz) for individual vocal response, followed by averaging
  across vocal events.
  - [ ] Wavelet codes are modified from matlab EEG toolbox provided by Michael Khahana lab (https://memory.psych.upenn.edu/Software).

### 4. Granger causality analysis
   
  - [ ] FieldTrip toolbox (https://www.fieldtriptoolbox.org/).
  
  Robert Oostenveld, Pascal Fries, Eric Maris, and Jan-Mathijs Schoffelen. FieldTrip: Open Source Software for Advanced Analysis of MEG, EEG, and Invasive Electrophysiological Data. Computational Intelligence and Neuroscience, 2011; 2011:156869.

  For example...
  ```
  cfg         = [];
  cfg.order   = 5;
  cfg.toolbox = 'bsmart';
  mdata       = ft_mvaranalysis(cfg, data);
  cfg.method = 'mvar';
  mfreq      = ft_freqanalysis(cfg, mdata);    
  cfg.method    = 'granger';
  granger       = ft_connectivityanalysis(cfg, mfreq);
   ```
  
### 5. Vocal acoustic analysis
   
   custom-made matlab codes used for previous studies (e.g., Eliades and Tsunada, 2018)
   - [ ]  Detection of vocalizations based on crossings of a sound amplitude threshold
   - [ ]  Fine adjustment of vocal onset and offset times
   - [ ]  Classification of call types based on visual inspection of spectrograms
   - [ ]  Characterization of the acoustic properties and call structure of each vocalization, including fundamental frequency, call loudness, and duration. 

### 6. Anatomical localization
   
   We used the marmoset brain atlas (https://3dviewer.marmosetbrainmapping.org/).

### 7. Basic statistical tests
   
  - [ ]  Wilcoxon sign-rank test: matlab function "signrank"
  - [ ]  Wilcoxon rank-sum test: matlab function "ranksum"
  - [ ]  Spearman's rank correlation analysis: matlab function "corr" with "spearman" option 
  - [ ]  Linear regression analysis: matlab function "regress" or "fitlm". statistical analysis by "anova" with "summary" option
  - [ ]  Friedman test: modified matlab functions "friedman" and "anovan" to conduct an unbalanced Friedman test
  - [ ]  False discovery rate (FDR) correction: David Groppe (2024). fdr_bh (https://www.mathworks.com/matlabcentral/fileexchange/27418-fdr_bh), MATLAB Central File Exchange.

   
