% dataProcessor_EMG.m intended for use on "split" data. 
% Inputs EMG data, outputs metric for each subject on activation levels.
clear
[loadData,path]=uigetfile("MultiSelect","on");
if ~iscell(loadData)==1
    loadData={loadData};
end
% initializing storage variable
finalData=cell(size(loadData,2),2);
% col1= name of source  col2= EMG metric
% setting epoch size for processing later
epochSize=100;
% epochSize=input("Set number of points per epoch:");
for i=1:size(loadData,2)
    currentFile=load([path loadData{i}]);
    currentData=table2array(currentFile.data);
    finalData{i,1}=loadData{i}(1:5);
    n=1;
    maxValue=[];
    while n<size(currentFile,1)+epochSize
        currentEpoch=currentData(n:n+epochSize,:);
        maxValue=[maxValue; max(currentEpoch)];
        n=n+epochSize+1;
    end
    finalData{i,2}=mean(maxValue);
end
% For copy paste convenience use these:
absences=finalData(1:2:end,:);
presences=finalData(2:2:end,:);