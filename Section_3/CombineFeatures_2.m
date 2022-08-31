function CombineFeatures_2(Features)


Features(:,1)=normalize(Features(:,1),'range');
Features(:,2)=normalize(Features(:,2),'range');
Features(:,3)=normalize(Features(:,3),'range');
Features(:,4)=normalize(Features(:,4),'range');
Features(:,5)=normalize(Features(:,5),'range');

% Determined features - 6# -->  S M DE M(1-D) M(1-E) M(1-D)(1-E) 
S=Features(:,1);
M=Features(:,2);
DE=Features(:,4)+Features(:,5);
MD=Features(:,2)+(1-Features(:,3));
ME=Features(:,2)+(1-Features(:,5));
MED=Features(:,2)+(1-Features(:,4))+(1-Features(:,5));

userNumber=size(Features,1);

% Sorting features
[sortedS,S_ids]=sort(S,'descend');
[sortedM,M_ids]=sort(M,'descend');
[sortedDE,DE_ids]=sort(DE,'descend');
[sortedMD,MD_ids]=sort(MD,'descend');
[sortedME,ME_ids]=sort(ME,'descend');
[sortedMED,MED_ids]=sort(MED,'descend');

% Normalizing all features
Norm_S=normalize(sortedS,'range');
Norm_M=normalize(sortedM,'range');
Norm_DE=normalize(sortedDE,'range');
Norm_MD=normalize(sortedMD,'range');
Norm_ME=normalize(sortedME,'range');
Norm_MED=normalize(sortedMED,'range');



%% Plotting on one Figure
x=transpose(1:userNumber);
figure('DefaultAxesFontSize',18)

plot(x,Norm_S,'Color','#0000FF','LineWidth',2)
hold on

plot(x,Norm_M,'Color','#D95319','LineWidth',2)
hold on

plot(x,Norm_DE,'Color','#EDB120','LineWidth',2)
hold on

plot(x,Norm_MD,'Color','#7E2F8E','LineWidth',2)
hold on

plot(x,Norm_ME,'Color','#77AC30','LineWidth',2)
hold on

% plot(x,Norm_SE,'Color','#4DBEEE','LineWidth',2)
% hold on

plot(x,Norm_MED,'Color','#00FF00','LineWidth',2)
hold on

% plot(x,Norm_DES,'Color','#000000','LineWidth',2)
% hold on

leg=legend ('Size','Mean','DevEnt','Mean(1-Dev)','Mean(1-Ent)','Mean(1-Dev)(1-Ent)')
xlabel('Users (Sorted in descending order based on the corresponding feature)')
ylabel('The value of the corresponding feature)')


return
end