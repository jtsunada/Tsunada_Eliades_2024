function [response_stats,response_idx,response_onset]=ResponseOnsetDetection(data)
%data: time x ch x trials

ch_num=16;%recording ch number
baseline_for_onset=1000:1500;
% centered_bins=1010:10:9010 + 250;

time_counter=0;
for j=1010:10:9010 %sliding test 1010 ms to 9010 ms with 10 ms step 
    time_counter=time_counter+1;
    
    for k=1:ch_num   
        response_stats(time_counter,k)=signrank(squeeze(median(data(baseline_for_onset,k,:),1)),squeeze(median(data(j:j+500,k,:),1)));
        
        %AUC using perfcurve is another option
        idx=(median(median(data(j:j+500,k,:),1))-median(median(data(baseline_for_onset,k,:),1)))./(median(median(data(baseline_for_onset,k,:),1)));
        response_idx(time_counter,k)=idx;
    end
end

test_length=9; %i.e., testing for 9+1 consecutive bins
response_onset=NaN(size(response_stats,2),1);
for k=1:ch_num
    [h,~,~,adj_p]=fdr_bh(response_stats(:,k),.05,'pdep','no');
    response_onset(:,k)=1-h;
    
    % Onset detection
    for m=1:size(response_stats,1)-test_length
        if response_stats(m:m+test_length,k)'==zeros(1,test_length+1);
            response_onset(k)=m;
            break
        end
    end
end

    


