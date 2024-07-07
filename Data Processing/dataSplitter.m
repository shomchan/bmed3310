% dataSplitter.m intended for use on unprocessed data. 
% Inputs 1 minute of EMG data, outputs middle 30s of that data.
clear
[allData,path]=uigetfile("MultiSelect","on");
if ~iscell(allData)==1
    allData={allData};
end
for i=1:size(allData,2)
    data=load([path allData{i}]);
    ID=allData{i}(1:end-4);
    if isstruct(data)
        data=data.(ID);
    end
    n=size(data,1);
    data=data(ceil(n/4):ceil(3*n/4),"Data 1");
    newName=strcat(ID,"_30.mat");
    save(strcat(path,newName),"data");
end