ibis=readcell("Module 1 processed data.xlsx");
ibis=ibis(2:end,:);
rmssd=zeros(size(ibis,2),1);
for i=1:size(ibis,2) % Loops through every column of input data
    differences=zeros(0,0);
    j=2;
    column=ibis(:,i);
    while j<=size(ibis,1) % Finding differences between IBIs
        if isnumeric(column{j})
            differences(j-1,1)=column{j}-column{j-1};
            j=j+1;
        else
            break
        end
    end
    n=size(differences,1);
    rmssd(i)=sqrt(sum(differences.^2)/n);
end
BLindex=1:3:i;
SAindex=2:3:i;
PAindex=3:3:i;
BLdata=rmssd(BLindex)*1000;
SAdata=rmssd(SAindex)*1000;
PAdata=rmssd(PAindex)*1000;

mean(BLdata)
mean(SAdata)
mean(PAdata)
std(BLdata)
std(SAdata)
std(PAdata)

%%
labels=[{"Baseline"},{"Sympathetic"},{"Parasympathetic"}];
boxplot([BLdata,SAdata,PAdata],labels,Notch="on")
ylabel("HRV distribution (ms)")
title("HRV of BMED 3110 students calculated via RMSSD during Sympathetic and Parasympathetic Activation")


