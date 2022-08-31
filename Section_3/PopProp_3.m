function [AveragePopularityData]=PopProp_3(Data,Features)


%% Determine Average popularity of rated items for Data
% Find item popularities
ItemNumber=max(Data(:,2));
UserNumber=max(Data(:,1));

for i=1:ItemNumber
    Rows=[];
    idx=find(Data(:,2)==i);
    if(isempty(idx))
        PopData(1,i)=0;
    else
        PopData(1,i)=size(idx,1)/UserNumber;
    end
end

ProfileSizeData=zeros(UserNumber,1);

for i=1:UserNumber
    RowsData=[];PopularitySum=0;
    idx=find(Data(:,1)==i);
    if(isempty(idx))
        ProfileSizeData(i,1)=0;
    else
        for k=1:size(idx,1)
            RowsData=[RowsData;Data(idx(k,1),:)];
        end
        
        for item=1:size(RowsData,1)
            itemID=RowsData(item,2);
            PopularitySum=PopularitySum+PopData(1,itemID);
        end

        ProfileSizeData(i,1)=size(RowsData,1);
        AveragePopularityData(i,1)=PopularitySum/size(RowsData,1);
    end
end

fprintf('Popularities are calculated \n');

Features(:,1)=normalize(Features(:,1),'range');
Features(:,2)=normalize(Features(:,2),'range');
Features(:,3)=normalize(Features(:,3),'range');
Features(:,4)=normalize(Features(:,4),'range');
Features(:,5)=normalize(Features(:,5),'range');

% Determined features
% S M DE M(1-D) M(1-E) M(1-D)(1-E) 
S=Features(:,1);
M=Features(:,2);
DE=Features(:,4)+Features(:,5);
MD=Features(:,2)+(1-Features(:,3));
ME=Features(:,2)+(1-Features(:,5));
MED=Features(:,2)+(1-Features(:,4))+(1-Features(:,5));

userNumber=size(Features,1);

% Normalizing all features
Norm_S=normalize(S,'range');
Norm_M=normalize(M,'range');
Norm_DE=normalize(DE,'range');
Norm_MD=normalize(MD,'range');
Norm_ME=normalize(ME,'range');
Norm_MED=normalize(MED,'range');


% Plotting on one Figure
figure('DefaultAxesFontSize',18)
p_Norm_S = polyfit(Norm_S,AveragePopularityData,1); 
f_Norm_S = polyval(p_Norm_S,Norm_S);
[C,P]=corrcoef(AveragePopularityData, Norm_S);
plot(Norm_S,f_Norm_S,'Color','#0000FF','LineWidth',2,'DisplayName',strcat('Size (corr=',sprintf('%.2f',C(1,2)),', p=',sprintf('%.2f',P(1,2)),')')')
hold on

p_Norm_M= polyfit(Norm_M,AveragePopularityData,1); 
f_Norm_M = polyval(p_Norm_M ,Norm_M);
[C,P]=corrcoef(AveragePopularityData, Norm_M);
plot(Norm_M,f_Norm_M,'Color','#D95319','LineWidth',2,'DisplayName',strcat('Mean (corr=',sprintf('%.2f',C(1,2)),', p=',sprintf('%.2f',P(1,2)),')')')
hold on

p_Norm_DE= polyfit(Norm_DE,AveragePopularityData,1); 
f_Norm_DE = polyval(p_Norm_DE ,Norm_DE);
[C,P]=corrcoef(AveragePopularityData, Norm_DE);
plot(Norm_DE,f_Norm_DE,'Color','#EDB120','LineWidth',2,'DisplayName',strcat('DevEnt (corr=',sprintf('%.2f',C(1,2)),', p=',sprintf('%.2f',P(1,2)),')')')
hold on

p_Norm_MD= polyfit(Norm_MD,AveragePopularityData,1); 
f_Norm_MD = polyval(p_Norm_MD ,Norm_MD);
[C,P]=corrcoef(AveragePopularityData, Norm_MD);
plot(Norm_MD,f_Norm_MD,'Color','#77AC30','LineWidth',2,'DisplayName',strcat('Mean(1-Dev) (corr=',sprintf('%.2f',C(1,2)),', p=',sprintf('%.2f',P(1,2)),')')')
hold on

p_Norm_ME= polyfit(Norm_ME,AveragePopularityData,1); 
f_Norm_ME = polyval(p_Norm_ME ,Norm_ME);
[C,P]=corrcoef(AveragePopularityData, Norm_ME);
plot(Norm_ME,f_Norm_ME,'Color','#7E2F8E','LineWidth',2,'DisplayName',strcat('Mean(1-Ent) (corr=',sprintf('%.2f',C(1,2)),', p=',sprintf('%.2f',P(1,2)),')')')
hold on

p_Norm_MED= polyfit(Norm_MED,AveragePopularityData,1); 
f_Norm_MED = polyval(p_Norm_MED ,Norm_MED);
[C,P]=corrcoef(AveragePopularityData, Norm_MED);
plot(Norm_MED,f_Norm_MED,'Color','#00FF00','LineWidth',2,'DisplayName',strcat('Mean(1-Ent)(1-Dev) (corr=',sprintf('%.2f',C(1,2)),', p=',sprintf('%.2f',P(1,2)),')')')
hold on

legend('show')
%leg=legend ('Size','Mean','DevEnt','Mean(1-Dev)','Mean(1-Ent)','Mean(1-Dev)(1-Ent)');
ylabel('Average popularity of rated items')
xlabel('The corresponding feature)')



return
end