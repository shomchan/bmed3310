close all
data=BL_01; % change out varname
data=table2array(data);
data=data(:,1);
time=linspace(0,120000*2.5,size(data,1))';
[peaks,indices]=findpeaks(data,"MinPeakDistance",700,"MinPeakHeight",500,"MinPeakProminence",10);
peaktimes=time(indices);
ibi=peaktimes(2:end)-peaktimes(1:end-1);
plot(time,data,peaktimes,peaks,"o")
% first verify from plot
% take data from ibi and paste into excel manually, too lazy to code it