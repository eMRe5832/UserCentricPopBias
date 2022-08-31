function [GroupSizes,GroupAvgProfSizes]=Groups_4(Features)

RealFeatures=Features;

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

% Estimate means and stds for each features
Mu_S = mean(S); Mu_M = mean(M); Mu_MD = mean(MD); Mu_ME = mean(ME); Mu_DE = mean(DE); Mu_MED = mean(MED);
Dev_S = std(S); Dev_M = std(M); Dev_MD = std(MD); Dev_ME = std(ME); Dev_DE = std(DE); Dev_MED = std(MED);

S_High = find(S(:,1) > (Mu_S+Dev_S));
S_Mid =  find(S(:,1) > Mu_S-Dev_S & S(:,1)<Mu_S+Dev_S);
S_Low = find(S(:,1) < (Mu_S-Dev_S));

M_High = find(M(:,1) > (Mu_M+Dev_M));
M_Mid =  find(M(:,1) > Mu_M-Dev_M & M(:,1)<Mu_M+Dev_M);
M_Low = find(M(:,1) < (Mu_M-Dev_M));

MD_High = find(MD(:,1) > (Mu_MD+Dev_MD));
MD_Mid =  find(MD(:,1)>Mu_MD-Dev_MD & MD(:,1)<Mu_MD+Dev_MD);
MD_Low = find(MD(:,1) < (Mu_MD-Dev_MD));

ME_High = find(ME(:,1) > (Mu_ME+Dev_ME));
ME_Mid =  find(ME(:,1)>Mu_ME-Dev_ME & ME(:,1)<Mu_ME+Dev_ME);
ME_Low = find(ME(:,1) < (Mu_ME-Dev_ME));

DE_High = find(DE(:,1) > (Mu_DE+Dev_DE));
DE_Mid =  find(DE(:,1)>Mu_DE-Dev_DE & DE(:,1)<Mu_DE+Dev_DE);
DE_Low = find(DE(:,1) < (Mu_DE-Dev_DE));

MED_High = find(MED(:,1) > (Mu_MED+Dev_MED));
MED_Mid =  find(MED(:,1)>Mu_MED-Dev_MED & MED(:,1)<Mu_MED+Dev_MED);
MED_Low = find(MED(:,1) < (Mu_MED-Dev_MED));


GroupSizes=zeros(3,6);
GroupSizes(1,1)=size(S_High,1);
GroupSizes(2,1)=size(S_Mid,1);
GroupSizes(3,1)=size(S_Low,1);

GroupSizes(1,2)=size(M_High,1);
GroupSizes(2,2)=size(M_Mid,1);
GroupSizes(3,2)=size(M_Low,1);

GroupSizes(1,3)=size(DE_High,1);
GroupSizes(2,3)=size(DE_Mid,1);
GroupSizes(3,3)=size(DE_Low,1);

GroupSizes(1,4)=size(MD_High,1);
GroupSizes(2,4)=size(MD_Mid,1);
GroupSizes(3,4)=size(MD_Low,1);

GroupSizes(1,5)=size(ME_High,1);
GroupSizes(2,5)=size(ME_Mid,1);
GroupSizes(3,5)=size(ME_Low,1);

GroupSizes(1,6)=size(MED_High,1);
GroupSizes(2,6)=size(MED_Mid,1);
GroupSizes(3,6)=size(MED_Low,1);



GroupAvgProfSizes=zeros(3,6);
GroupAvgProfSizes(1,1)=FindGroupAverageProfileSize(RealFeatures(:,1),S_High);
GroupAvgProfSizes(2,1)=FindGroupAverageProfileSize(RealFeatures(:,1),S_Mid);
GroupAvgProfSizes(3,1)=FindGroupAverageProfileSize(RealFeatures(:,1),S_Low);

GroupAvgProfSizes(1,2)=FindGroupAverageProfileSize(RealFeatures(:,1),M_High);
GroupAvgProfSizes(2,2)=FindGroupAverageProfileSize(RealFeatures(:,1),M_Mid);
GroupAvgProfSizes(3,2)=FindGroupAverageProfileSize(RealFeatures(:,1),M_Low);

GroupAvgProfSizes(1,3)=FindGroupAverageProfileSize(RealFeatures(:,1),DE_High);
GroupAvgProfSizes(2,3)=FindGroupAverageProfileSize(RealFeatures(:,1),DE_Mid);
GroupAvgProfSizes(3,3)=FindGroupAverageProfileSize(RealFeatures(:,1),DE_Low);

GroupAvgProfSizes(1,4)=FindGroupAverageProfileSize(RealFeatures(:,1),MD_High);
GroupAvgProfSizes(2,4)=FindGroupAverageProfileSize(RealFeatures(:,1),MD_Mid);
GroupAvgProfSizes(3,4)=FindGroupAverageProfileSize(RealFeatures(:,1),MD_Low);

GroupAvgProfSizes(1,5)=FindGroupAverageProfileSize(RealFeatures(:,1),ME_High);
GroupAvgProfSizes(2,5)=FindGroupAverageProfileSize(RealFeatures(:,1),ME_Mid);
GroupAvgProfSizes(3,5)=FindGroupAverageProfileSize(RealFeatures(:,1),ME_Low);

GroupAvgProfSizes(1,6)=FindGroupAverageProfileSize(RealFeatures(:,1),MED_High);
GroupAvgProfSizes(2,6)=FindGroupAverageProfileSize(RealFeatures(:,1),MED_Mid);
GroupAvgProfSizes(3,6)=FindGroupAverageProfileSize(RealFeatures(:,1),MED_Low);

return
end

%% Finding average profile size of a group
function [AvgProfSize] = FindGroupAverageProfileSize(ProfileSizes, GroupIds)

total=0;
for user=1:size(GroupIds,1)
    userID=GroupIds(user,1);
    total=total+ProfileSizes(userID,1);
end
AvgProfSize = total / size(GroupIds,1);

return
end