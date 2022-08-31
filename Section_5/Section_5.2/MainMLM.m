function MainMLM()
format short g

% ----Input ----
% Dataset: Original data: mxn format
% PopItems: Average Popularity of the items for the corresponding dataset.
% Features: Feature matrix for the corresponding dataset.
% TopN: TopN recommendation list for the corresponding dataset.
% PredMatrix: Prediction matrix mxn format
load('MLM\FeatureInfo\Features.mat');
load('MLM\RatingMatrix\MLM.mat');
load('MLM\TopNLists\Random.mat');load('MLM\TopNLists\ItemAVG.mat');
load('MLM\TopNLists\MMMF.mat');load('MLM\TopNLists\WMF.mat');
load('MLM\TopNLists\HPF.mat');load('MLM\TopNLists\IBPR.mat');
load('MLM\TopNLists\WBPR.mat');load('MLM\TopNLists\SKM.mat');
load('MLM\TopNLists\NEUMF.mat');load('MLM\TopNLists\VAECF.mat');

[a,RandomResults]=MetricALL(MLM, Random);
[a,ItemAVGResults]=MetricALL(MLM, ItemAVG);
[a,MMMFResults]=MetricALL(MLM, MMMF);
[a,WMFResults]=MetricALL(MLM, WMF);
[a,HPFResults]=MetricALL(MLM, HPF);
[a,IBPRResults]=MetricALL(MLM, IBPR);
[a,WBPRResults]=MetricALL(MLM, WBPR);
[a,SKMResults]=MetricALL(MLM, SKM);
[a,NEUMFResults]=MetricALL(MLM, NEUMF);
[a,VAECFResults]=MetricALL(MLM, VAECF);

%% Construct user groups for size:
S=Features(:,1);
Mu_S = mean(S); Dev_S = std(S); 
S_High = find(S(:,1) > (Mu_S+Dev_S));
S_Mid =  find(S(:,1) > Mu_S-Dev_S & S(:,1)<Mu_S+Dev_S);
S_Low = find(S(:,1) < (Mu_S-Dev_S));

S_Random_High=Construct10Groups(S_High,RandomResults);
S_ItemAVG_High=Construct10Groups(S_High,ItemAVGResults);
S_MMMF_High=Construct10Groups(S_High,MMMFResults);
S_WMF_High=Construct10Groups(S_High,WMFResults);
S_HPF_High=Construct10Groups(S_High,HPFResults);
S_IBPR_High=Construct10Groups(S_High,IBPRResults);
S_WBPR_High=Construct10Groups(S_High,WBPRResults);
S_SKM_High=Construct10Groups(S_High,SKMResults);
S_NEUMF_High=Construct10Groups(S_High,NEUMFResults);
S_VAECF_High=Construct10Groups(S_High,VAECFResults);

S_Random_Mid=Construct10Groups(S_Mid,RandomResults);
S_ItemAVG_Mid=Construct10Groups(S_Mid,ItemAVGResults);
S_MMMF_Mid=Construct10Groups(S_Mid,MMMFResults);
S_WMF_Mid=Construct10Groups(S_Mid,WMFResults);
S_HPF_Mid=Construct10Groups(S_Mid,HPFResults);
S_IBPR_Mid=Construct10Groups(S_Mid,IBPRResults);
S_WBPR_Mid=Construct10Groups(S_Mid,WBPRResults);
S_SKM_Mid=Construct10Groups(S_Mid,SKMResults);
S_NEUMF_Mid=Construct10Groups(S_Mid,NEUMFResults);
S_VAECF_Mid=Construct10Groups(S_Mid,VAECFResults);

%% Construct user groups for mean:
M=Features(:,2);
Mu_M = mean(M); Dev_M = std(M);
M_High = find(M(:,1) > (Mu_M+Dev_M));
M_Mid =  find(M(:,1) > Mu_M-Dev_M & M(:,1)<Mu_M+Dev_M);
M_Low = find(M(:,1) < (Mu_M-Dev_M));

M_Random_High=Construct10Groups(M_High,RandomResults);
M_ItemAVG_High=Construct10Groups(M_High,ItemAVGResults);
M_MMMF_High=Construct10Groups(M_High,MMMFResults);
M_WMF_High=Construct10Groups(M_High,WMFResults);
M_HPF_High=Construct10Groups(M_High,HPFResults);
M_IBPR_High=Construct10Groups(M_High,IBPRResults);
M_WBPR_High=Construct10Groups(M_High,WBPRResults);
M_SKM_High=Construct10Groups(M_High,SKMResults);
M_NEUMF_High=Construct10Groups(M_High,NEUMFResults);
M_VAECF_High=Construct10Groups(M_High,VAECFResults);

M_Random_Mid=Construct10Groups(M_Mid,RandomResults);
M_ItemAVG_Mid=Construct10Groups(M_Mid,ItemAVGResults);
M_MMMF_Mid=Construct10Groups(M_Mid,MMMFResults);
M_WMF_Mid=Construct10Groups(M_Mid,WMFResults);
M_HPF_Mid=Construct10Groups(M_Mid,HPFResults);
M_IBPR_Mid=Construct10Groups(M_Mid,IBPRResults);
M_WBPR_Mid=Construct10Groups(M_Mid,WBPRResults);
M_SKM_Mid=Construct10Groups(M_Mid,SKMResults);
M_NEUMF_Mid=Construct10Groups(M_Mid,NEUMFResults);
M_VAECF_Mid=Construct10Groups(M_Mid,VAECFResults);

M_Random_Low=Construct10Groups(M_Low,RandomResults);
M_ItemAVG_Low=Construct10Groups(M_Low,ItemAVGResults);
M_MMMF_Low=Construct10Groups(M_Low,MMMFResults);
M_WMF_Low=Construct10Groups(M_Low,WMFResults);
M_HPF_Low=Construct10Groups(M_Low,HPFResults);
M_IBPR_Low=Construct10Groups(M_Low,IBPRResults);
M_WBPR_Low=Construct10Groups(M_Low,WBPRResults);
M_SKM_Low=Construct10Groups(M_Low,SKMResults);
M_NEUMF_Low=Construct10Groups(M_Low,NEUMFResults);
M_VAECF_Low=Construct10Groups(M_Low,VAECFResults);

%% Construct user groups for MeanDev:
MD=Features(:,2)+(1-Features(:,3));
Mu_MD = mean(MD); Dev_MD = std(MD);
MD_High = find(MD(:,1) > (Mu_MD+Dev_MD));
MD_Mid =  find(MD(:,1)>Mu_MD-Dev_MD & MD(:,1)<Mu_MD+Dev_MD);
MD_Low = find(MD(:,1) < (Mu_MD-Dev_MD));

MD_Random_High=Construct10Groups(MD_High,RandomResults);
MD_ItemAVG_High=Construct10Groups(MD_High,ItemAVGResults);
MD_MMMF_High=Construct10Groups(MD_High,MMMFResults);
MD_WMF_High=Construct10Groups(MD_High,WMFResults);
MD_HPF_High=Construct10Groups(MD_High,HPFResults);
MD_IBPR_High=Construct10Groups(MD_High,IBPRResults);
MD_WBPR_High=Construct10Groups(MD_High,WBPRResults);
MD_SKM_High=Construct10Groups(MD_High,SKMResults);
MD_NEUMF_High=Construct10Groups(MD_High,NEUMFResults);
MD_VAECF_High=Construct10Groups(MD_High,VAECFResults);

MD_Random_Mid=Construct10Groups(MD_Mid,RandomResults);
MD_ItemAVG_Mid=Construct10Groups(MD_Mid,ItemAVGResults);
MD_MMMF_Mid=Construct10Groups(MD_Mid,MMMFResults);
MD_WMF_Mid=Construct10Groups(MD_Mid,WMFResults);
MD_HPF_Mid=Construct10Groups(MD_Mid,HPFResults);
MD_IBPR_Mid=Construct10Groups(MD_Mid,IBPRResults);
MD_WBPR_Mid=Construct10Groups(MD_Mid,WBPRResults);
MD_SKM_Mid=Construct10Groups(MD_Mid,SKMResults);
MD_NEUMF_Mid=Construct10Groups(MD_Mid,NEUMFResults);
MD_VAECF_Mid=Construct10Groups(MD_Mid,VAECFResults);

MD_Random_Low=Construct10Groups(MD_Low,RandomResults);
MD_ItemAVG_Low=Construct10Groups(MD_Low,ItemAVGResults);
MD_MMMF_Low=Construct10Groups(MD_Low,MMMFResults);
MD_WMF_Low=Construct10Groups(MD_Low,WMFResults);
MD_HPF_Low=Construct10Groups(MD_Low,HPFResults);
MD_IBPR_Low=Construct10Groups(MD_Low,IBPRResults);
MD_WBPR_Low=Construct10Groups(MD_Low,WBPRResults);
MD_SKM_Low=Construct10Groups(MD_Low,SKMResults);
MD_NEUMF_Low=Construct10Groups(MD_Low,NEUMFResults);
MD_VAECF_Low=Construct10Groups(MD_Low,VAECFResults);

%% Construct user groups for MeanEntropy:
ME=Features(:,2)+(1-Features(:,5));
Mu_ME = mean(ME);Dev_ME = std(ME);
ME_High = find(ME(:,1) > (Mu_ME+Dev_ME));
ME_Mid =  find(ME(:,1)>Mu_ME-Dev_ME & ME(:,1)<Mu_ME+Dev_ME);
ME_Low = find(ME(:,1) < (Mu_ME-Dev_ME));

ME_Random_High=Construct10Groups(ME_High,RandomResults);
ME_ItemAVG_High=Construct10Groups(ME_High,ItemAVGResults);
ME_MMMF_High=Construct10Groups(ME_High,MMMFResults);
ME_WMF_High=Construct10Groups(ME_High,WMFResults);
ME_HPF_High=Construct10Groups(ME_High,HPFResults);
ME_IBPR_High=Construct10Groups(ME_High,IBPRResults);
ME_WBPR_High=Construct10Groups(ME_High,WBPRResults);
ME_SKM_High=Construct10Groups(ME_High,SKMResults);
ME_NEUMF_High=Construct10Groups(ME_High,NEUMFResults);
ME_VAECF_High=Construct10Groups(ME_High,VAECFResults);

ME_Random_Mid=Construct10Groups(ME_Mid,RandomResults);
ME_ItemAVG_Mid=Construct10Groups(ME_Mid,ItemAVGResults);
ME_MMMF_Mid=Construct10Groups(ME_Mid,MMMFResults);
ME_WMF_Mid=Construct10Groups(ME_Mid,WMFResults);
ME_HPF_Mid=Construct10Groups(ME_Mid,HPFResults);
ME_IBPR_Mid=Construct10Groups(ME_Mid,IBPRResults);
ME_WBPR_Mid=Construct10Groups(ME_Mid,WBPRResults);
ME_SKM_Mid=Construct10Groups(ME_Mid,SKMResults);
ME_NEUMF_Mid=Construct10Groups(ME_Mid,NEUMFResults);
ME_VAECF_Mid=Construct10Groups(ME_Mid,VAECFResults);

ME_Random_Low=Construct10Groups(ME_Low,RandomResults);
ME_ItemAVG_Low=Construct10Groups(ME_Low,ItemAVGResults);
ME_MMMF_Low=Construct10Groups(ME_Low,MMMFResults);
ME_WMF_Low=Construct10Groups(ME_Low,WMFResults);
ME_HPF_Low=Construct10Groups(ME_Low,HPFResults);
ME_IBPR_Low=Construct10Groups(ME_Low,IBPRResults);
ME_WBPR_Low=Construct10Groups(ME_Low,WBPRResults);
ME_SKM_Low=Construct10Groups(ME_Low,SKMResults);
ME_NEUMF_Low=Construct10Groups(ME_Low,NEUMFResults);
ME_VAECF_Low=Construct10Groups(ME_Low,VAECFResults);

%% Construct user groups for DevEnt:
DE=Features(:,4)+Features(:,5);
Mu_DE = mean(DE);Dev_DE = std(DE); 

DE_High = find(DE(:,1) > (Mu_DE+Dev_DE));
DE_Mid =  find(DE(:,1)>Mu_DE-Dev_DE & DE(:,1)<Mu_DE+Dev_DE);
DE_Low = find(DE(:,1) < (Mu_DE-Dev_DE));

DE_Random_High=Construct10Groups(DE_High,RandomResults);
DE_ItemAVG_High=Construct10Groups(DE_High,ItemAVGResults);
DE_MMMF_High=Construct10Groups(DE_High,MMMFResults);
DE_WMF_High=Construct10Groups(DE_High,WMFResults);
DE_HPF_High=Construct10Groups(DE_High,HPFResults);
DE_IBPR_High=Construct10Groups(DE_High,IBPRResults);
DE_WBPR_High=Construct10Groups(DE_High,WBPRResults);
DE_SKM_High=Construct10Groups(DE_High,SKMResults);
DE_NEUMF_High=Construct10Groups(DE_High,NEUMFResults);
DE_VAECF_High=Construct10Groups(DE_High,VAECFResults);

DE_Random_Mid=Construct10Groups(DE_Mid,RandomResults);
DE_ItemAVG_Mid=Construct10Groups(DE_Mid,ItemAVGResults);
DE_MMMF_Mid=Construct10Groups(DE_Mid,MMMFResults);
DE_WMF_Mid=Construct10Groups(DE_Mid,WMFResults);
DE_HPF_Mid=Construct10Groups(DE_Mid,HPFResults);
DE_IBPR_Mid=Construct10Groups(DE_Mid,IBPRResults);
DE_WBPR_Mid=Construct10Groups(DE_Mid,WBPRResults);
DE_SKM_Mid=Construct10Groups(DE_Mid,SKMResults);
DE_NEUMF_Mid=Construct10Groups(DE_Mid,NEUMFResults);
DE_VAECF_Mid=Construct10Groups(DE_Mid,VAECFResults);

DE_Random_Low=Construct10Groups(DE_Low,RandomResults);
DE_ItemAVG_Low=Construct10Groups(DE_Low,ItemAVGResults);
DE_MMMF_Low=Construct10Groups(DE_Low,MMMFResults);
DE_WMF_Low=Construct10Groups(DE_Low,WMFResults);
DE_HPF_Low=Construct10Groups(DE_Low,HPFResults);
DE_IBPR_Low=Construct10Groups(DE_Low,IBPRResults);
DE_WBPR_Low=Construct10Groups(DE_Low,WBPRResults);
DE_SKM_Low=Construct10Groups(DE_Low,SKMResults);
DE_NEUMF_Low=Construct10Groups(DE_Low,NEUMFResults);
DE_VAECF_Low=Construct10Groups(DE_Low,VAECFResults);

%% Construct user groups for MeanDevEnt:
MED=Features(:,2)+(1-Features(:,4))+(1-Features(:,5));
Mu_MED = mean(MED); Dev_MED = std(MED);
MED_High = find(MED(:,1) > (Mu_MED+Dev_MED));
MED_Mid =  find(MED(:,1)>Mu_MED-Dev_MED & MED(:,1)<Mu_MED+Dev_MED);
MED_Low = find(MED(:,1) < (Mu_MED-Dev_MED));

MED_Random_High=Construct10Groups(MED_High,RandomResults);
MED_ItemAVG_High=Construct10Groups(MED_High,ItemAVGResults);
MED_MMMF_High=Construct10Groups(MED_High,MMMFResults);
MED_WMF_High=Construct10Groups(MED_High,WMFResults);
MED_HPF_High=Construct10Groups(MED_High,HPFResults);
MED_IBPR_High=Construct10Groups(MED_High,IBPRResults);
MED_WBPR_High=Construct10Groups(MED_High,WBPRResults);
MED_SKM_High=Construct10Groups(MED_High,SKMResults);
MED_NEUMF_High=Construct10Groups(MED_High,NEUMFResults);
MED_VAECF_High=Construct10Groups(MED_High,VAECFResults);

MED_Random_Mid=Construct10Groups(MED_Mid,RandomResults);
MED_ItemAVG_Mid=Construct10Groups(MED_Mid,ItemAVGResults);
MED_MMMF_Mid=Construct10Groups(MED_Mid,MMMFResults);
MED_WMF_Mid=Construct10Groups(MED_Mid,WMFResults);
MED_HPF_Mid=Construct10Groups(MED_Mid,HPFResults);
MED_IBPR_Mid=Construct10Groups(MED_Mid,IBPRResults);
MED_WBPR_Mid=Construct10Groups(MED_Mid,WBPRResults);
MED_SKM_Mid=Construct10Groups(MED_Mid,SKMResults);
MED_NEUMF_Mid=Construct10Groups(MED_Mid,NEUMFResults);
MED_VAECF_Mid=Construct10Groups(MED_Mid,VAECFResults);

MED_Random_Low=Construct10Groups(MED_Low,RandomResults);
MED_ItemAVG_Low=Construct10Groups(MED_Low,ItemAVGResults);
MED_MMMF_Low=Construct10Groups(MED_Low,MMMFResults);
MED_WMF_Low=Construct10Groups(MED_Low,WMFResults);
MED_HPF_Low=Construct10Groups(MED_Low,HPFResults);
MED_IBPR_Low=Construct10Groups(MED_Low,IBPRResults);
MED_WBPR_Low=Construct10Groups(MED_Low,WBPRResults);
MED_SKM_Low=Construct10Groups(MED_Low,SKMResults);
MED_NEUMF_Low=Construct10Groups(MED_Low,NEUMFResults);
MED_VAECF_Low=Construct10Groups(MED_Low,VAECFResults);

%% Table for DeltaGAP values
Group=["Size-High"; "Size-Mid";"----"; "Mean-High"; "Mean-Mid"; "Mean-Low"; "----"; "MeanDev-High"; "MeanDev-Mid"; "MeanDev-Low"; "----"; "MeanEnt-High"; "MeanEnt-Mid"; "MeanEnt-Low"; "----"; "DevEnt-High"; "DevEnt-Mid"; "DevEnt-Low"; "----"; "MeanDevEnt-High"; "MeanDevEnt-Mid"; "MeanDevEnt-Low"];
Random_ = [DeltaGapCal(S_Random_High(:,1),S_Random_High(:,2)); DeltaGapCal(S_Random_Mid(:,1),S_Random_Mid(:,2));0;DeltaGapCal(M_Random_High(:,1),M_Random_High(:,2)); DeltaGapCal(M_Random_Mid(:,1),M_Random_Mid(:,2)); DeltaGapCal(M_Random_Low(:,1),M_Random_Low(:,2)); 0;DeltaGapCal(MD_Random_High(:,1),MD_Random_High(:,2)); DeltaGapCal(MD_Random_Mid(:,1),MD_Random_Mid(:,2)); DeltaGapCal(MD_Random_Low(:,1),MD_Random_Low(:,2)); 0; DeltaGapCal(ME_Random_High(:,1),ME_Random_High(:,2)); DeltaGapCal(ME_Random_Mid(:,1),ME_Random_Mid(:,2)); DeltaGapCal(ME_Random_Low(:,1),ME_Random_Low(:,2)); 0; DeltaGapCal(DE_Random_High(:,1),DE_Random_High(:,2)); DeltaGapCal(DE_Random_Mid(:,1),DE_Random_Mid(:,2));DeltaGapCal(DE_Random_Low(:,1),DE_Random_Low(:,2)); 0; DeltaGapCal(MED_Random_High(:,1),MED_Random_High(:,2)); DeltaGapCal(MED_Random_Mid(:,1),MED_Random_Mid(:,2)); DeltaGapCal(MED_Random_Low(:,1),MED_Random_Low(:,2))];
ItemAVG_ = [DeltaGapCal(S_ItemAVG_High(:,1),S_ItemAVG_High(:,2)); DeltaGapCal(S_ItemAVG_Mid(:,1),S_ItemAVG_Mid(:,2));0;DeltaGapCal(M_ItemAVG_High(:,1),M_ItemAVG_High(:,2)); DeltaGapCal(M_ItemAVG_Mid(:,1),M_ItemAVG_Mid(:,2)); DeltaGapCal(M_ItemAVG_Low(:,1),M_ItemAVG_Low(:,2)); 0;DeltaGapCal(MD_ItemAVG_High(:,1),MD_ItemAVG_High(:,2)); DeltaGapCal(MD_ItemAVG_Mid(:,1),MD_ItemAVG_Mid(:,2)); DeltaGapCal(MD_ItemAVG_Low(:,1),MD_ItemAVG_Low(:,2)); 0; DeltaGapCal(ME_ItemAVG_High(:,1),ME_ItemAVG_High(:,2)); DeltaGapCal(ME_ItemAVG_Mid(:,1),ME_ItemAVG_Mid(:,2)); DeltaGapCal(ME_ItemAVG_Low(:,1),ME_ItemAVG_Low(:,2)); 0; DeltaGapCal(DE_ItemAVG_High(:,1),DE_ItemAVG_High(:,2)); DeltaGapCal(DE_ItemAVG_Mid(:,1),DE_ItemAVG_Mid(:,2));DeltaGapCal(DE_ItemAVG_Low(:,1),DE_ItemAVG_Low(:,2)); 0; DeltaGapCal(MED_ItemAVG_High(:,1),MED_ItemAVG_High(:,2)); DeltaGapCal(MED_ItemAVG_Mid(:,1),MED_ItemAVG_Mid(:,2)); DeltaGapCal(MED_ItemAVG_Low(:,1),MED_ItemAVG_Low(:,2))];
MMMF_ = [DeltaGapCal(S_MMMF_High(:,1),S_MMMF_High(:,2)); DeltaGapCal(S_MMMF_Mid(:,1),S_MMMF_Mid(:,2));0;DeltaGapCal(M_MMMF_High(:,1),M_MMMF_High(:,2)); DeltaGapCal(M_MMMF_Mid(:,1),M_MMMF_Mid(:,2)); DeltaGapCal(M_MMMF_Low(:,1),M_MMMF_Low(:,2)); 0;DeltaGapCal(MD_MMMF_High(:,1),MD_MMMF_High(:,2)); DeltaGapCal(MD_MMMF_Mid(:,1),MD_MMMF_Mid(:,2)); DeltaGapCal(MD_MMMF_Low(:,1),MD_MMMF_Low(:,2)); 0; DeltaGapCal(ME_MMMF_High(:,1),ME_MMMF_High(:,2)); DeltaGapCal(ME_MMMF_Mid(:,1),ME_MMMF_Mid(:,2)); DeltaGapCal(ME_MMMF_Low(:,1),ME_MMMF_Low(:,2)); 0; DeltaGapCal(DE_MMMF_High(:,1),DE_MMMF_High(:,2)); DeltaGapCal(DE_MMMF_Mid(:,1),DE_MMMF_Mid(:,2));DeltaGapCal(DE_MMMF_Low(:,1),DE_MMMF_Low(:,2)); 0; DeltaGapCal(MED_MMMF_High(:,1),MED_MMMF_High(:,2)); DeltaGapCal(MED_MMMF_Mid(:,1),MED_MMMF_Mid(:,2)); DeltaGapCal(MED_MMMF_Low(:,1),MED_MMMF_Low(:,2))];
WMF_ = [DeltaGapCal(S_WMF_High(:,1),S_WMF_High(:,2)); DeltaGapCal(S_WMF_Mid(:,1),S_WMF_Mid(:,2));0;DeltaGapCal(M_WMF_High(:,1),M_WMF_High(:,2)); DeltaGapCal(M_WMF_Mid(:,1),M_WMF_Mid(:,2)); DeltaGapCal(M_WMF_Low(:,1),M_WMF_Low(:,2)); 0;DeltaGapCal(MD_WMF_High(:,1),MD_WMF_High(:,2)); DeltaGapCal(MD_WMF_Mid(:,1),MD_WMF_Mid(:,2)); DeltaGapCal(MD_WMF_Low(:,1),MD_WMF_Low(:,2)); 0; DeltaGapCal(ME_WMF_High(:,1),ME_WMF_High(:,2)); DeltaGapCal(ME_WMF_Mid(:,1),ME_WMF_Mid(:,2)); DeltaGapCal(ME_WMF_Low(:,1),ME_WMF_Low(:,2)); 0; DeltaGapCal(DE_WMF_High(:,1),DE_WMF_High(:,2)); DeltaGapCal(DE_WMF_Mid(:,1),DE_WMF_Mid(:,2));DeltaGapCal(DE_WMF_Low(:,1),DE_WMF_Low(:,2)); 0; DeltaGapCal(MED_WMF_High(:,1),MED_WMF_High(:,2)); DeltaGapCal(MED_WMF_Mid(:,1),MED_WMF_Mid(:,2)); DeltaGapCal(MED_WMF_Low(:,1),MED_WMF_Low(:,2))];
HPF_ = [DeltaGapCal(S_HPF_High(:,1),S_HPF_High(:,2)); DeltaGapCal(S_HPF_Mid(:,1),S_HPF_Mid(:,2));0;DeltaGapCal(M_HPF_High(:,1),M_HPF_High(:,2)); DeltaGapCal(M_HPF_Mid(:,1),M_HPF_Mid(:,2)); DeltaGapCal(M_HPF_Low(:,1),M_HPF_Low(:,2)); 0;DeltaGapCal(MD_HPF_High(:,1),MD_HPF_High(:,2)); DeltaGapCal(MD_HPF_Mid(:,1),MD_HPF_Mid(:,2)); DeltaGapCal(MD_HPF_Low(:,1),MD_HPF_Low(:,2)); 0; DeltaGapCal(ME_HPF_High(:,1),ME_HPF_High(:,2)); DeltaGapCal(ME_HPF_Mid(:,1),ME_HPF_Mid(:,2)); DeltaGapCal(ME_HPF_Low(:,1),ME_HPF_Low(:,2)); 0; DeltaGapCal(DE_HPF_High(:,1),DE_HPF_High(:,2)); DeltaGapCal(DE_HPF_Mid(:,1),DE_HPF_Mid(:,2));DeltaGapCal(DE_HPF_Low(:,1),DE_HPF_Low(:,2)); 0; DeltaGapCal(MED_HPF_High(:,1),MED_HPF_High(:,2)); DeltaGapCal(MED_HPF_Mid(:,1),MED_HPF_Mid(:,2)); DeltaGapCal(MED_HPF_Low(:,1),MED_HPF_Low(:,2))];
IBPR_ = [DeltaGapCal(S_IBPR_High(:,1),S_IBPR_High(:,2)); DeltaGapCal(S_IBPR_Mid(:,1),S_IBPR_Mid(:,2));0;DeltaGapCal(M_IBPR_High(:,1),M_IBPR_High(:,2)); DeltaGapCal(M_IBPR_Mid(:,1),M_IBPR_Mid(:,2)); DeltaGapCal(M_IBPR_Low(:,1),M_IBPR_Low(:,2)); 0;DeltaGapCal(MD_IBPR_High(:,1),MD_IBPR_High(:,2)); DeltaGapCal(MD_IBPR_Mid(:,1),MD_IBPR_Mid(:,2)); DeltaGapCal(MD_IBPR_Low(:,1),MD_IBPR_Low(:,2)); 0; DeltaGapCal(ME_IBPR_High(:,1),ME_IBPR_High(:,2)); DeltaGapCal(ME_IBPR_Mid(:,1),ME_IBPR_Mid(:,2)); DeltaGapCal(ME_IBPR_Low(:,1),ME_IBPR_Low(:,2)); 0; DeltaGapCal(DE_IBPR_High(:,1),DE_IBPR_High(:,2)); DeltaGapCal(DE_IBPR_Mid(:,1),DE_IBPR_Mid(:,2));DeltaGapCal(DE_IBPR_Low(:,1),DE_IBPR_Low(:,2)); 0; DeltaGapCal(MED_IBPR_High(:,1),MED_IBPR_High(:,2)); DeltaGapCal(MED_IBPR_Mid(:,1),MED_IBPR_Mid(:,2)); DeltaGapCal(MED_IBPR_Low(:,1),MED_IBPR_Low(:,2))];
WBPR_ = [DeltaGapCal(S_WBPR_High(:,1),S_WBPR_High(:,2)); DeltaGapCal(S_WBPR_Mid(:,1),S_WBPR_Mid(:,2));0;DeltaGapCal(M_WBPR_High(:,1),M_WBPR_High(:,2)); DeltaGapCal(M_WBPR_Mid(:,1),M_WBPR_Mid(:,2)); DeltaGapCal(M_WBPR_Low(:,1),M_WBPR_Low(:,2)); 0;DeltaGapCal(MD_WBPR_High(:,1),MD_WBPR_High(:,2)); DeltaGapCal(MD_WBPR_Mid(:,1),MD_WBPR_Mid(:,2)); DeltaGapCal(MD_WBPR_Low(:,1),MD_WBPR_Low(:,2)); 0; DeltaGapCal(ME_WBPR_High(:,1),ME_WBPR_High(:,2)); DeltaGapCal(ME_WBPR_Mid(:,1),ME_WBPR_Mid(:,2)); DeltaGapCal(ME_WBPR_Low(:,1),ME_WBPR_Low(:,2)); 0; DeltaGapCal(DE_WBPR_High(:,1),DE_WBPR_High(:,2)); DeltaGapCal(DE_WBPR_Mid(:,1),DE_WBPR_Mid(:,2));DeltaGapCal(DE_WBPR_Low(:,1),DE_WBPR_Low(:,2)); 0; DeltaGapCal(MED_WBPR_High(:,1),MED_WBPR_High(:,2)); DeltaGapCal(MED_WBPR_Mid(:,1),MED_WBPR_Mid(:,2)); DeltaGapCal(MED_WBPR_Low(:,1),MED_WBPR_Low(:,2))];
SKM_ = [DeltaGapCal(S_SKM_High(:,1),S_SKM_High(:,2)); DeltaGapCal(S_SKM_Mid(:,1),S_SKM_Mid(:,2));0;DeltaGapCal(M_SKM_High(:,1),M_SKM_High(:,2)); DeltaGapCal(M_SKM_Mid(:,1),M_SKM_Mid(:,2)); DeltaGapCal(M_SKM_Low(:,1),M_SKM_Low(:,2)); 0;DeltaGapCal(MD_SKM_High(:,1),MD_SKM_High(:,2)); DeltaGapCal(MD_SKM_Mid(:,1),MD_SKM_Mid(:,2)); DeltaGapCal(MD_SKM_Low(:,1),MD_SKM_Low(:,2)); 0; DeltaGapCal(ME_SKM_High(:,1),ME_SKM_High(:,2)); DeltaGapCal(ME_SKM_Mid(:,1),ME_SKM_Mid(:,2)); DeltaGapCal(ME_SKM_Low(:,1),ME_SKM_Low(:,2)); 0; DeltaGapCal(DE_SKM_High(:,1),DE_SKM_High(:,2)); DeltaGapCal(DE_SKM_Mid(:,1),DE_SKM_Mid(:,2));DeltaGapCal(DE_SKM_Low(:,1),DE_SKM_Low(:,2)); 0; DeltaGapCal(MED_SKM_High(:,1),MED_SKM_High(:,2)); DeltaGapCal(MED_SKM_Mid(:,1),MED_SKM_Mid(:,2)); DeltaGapCal(MED_SKM_Low(:,1),MED_SKM_Low(:,2))];
NEUMF_ = [DeltaGapCal(S_NEUMF_High(:,1),S_NEUMF_High(:,2)); DeltaGapCal(S_NEUMF_Mid(:,1),S_NEUMF_Mid(:,2));0;DeltaGapCal(M_NEUMF_High(:,1),M_NEUMF_High(:,2)); DeltaGapCal(M_NEUMF_Mid(:,1),M_NEUMF_Mid(:,2)); DeltaGapCal(M_NEUMF_Low(:,1),M_NEUMF_Low(:,2)); 0;DeltaGapCal(MD_NEUMF_High(:,1),MD_NEUMF_High(:,2)); DeltaGapCal(MD_NEUMF_Mid(:,1),MD_NEUMF_Mid(:,2)); DeltaGapCal(MD_NEUMF_Low(:,1),MD_NEUMF_Low(:,2)); 0; DeltaGapCal(ME_NEUMF_High(:,1),ME_NEUMF_High(:,2)); DeltaGapCal(ME_NEUMF_Mid(:,1),ME_NEUMF_Mid(:,2)); DeltaGapCal(ME_NEUMF_Low(:,1),ME_NEUMF_Low(:,2)); 0; DeltaGapCal(DE_NEUMF_High(:,1),DE_NEUMF_High(:,2)); DeltaGapCal(DE_NEUMF_Mid(:,1),DE_NEUMF_Mid(:,2));DeltaGapCal(DE_NEUMF_Low(:,1),DE_NEUMF_Low(:,2)); 0; DeltaGapCal(MED_NEUMF_High(:,1),MED_NEUMF_High(:,2)); DeltaGapCal(MED_NEUMF_Mid(:,1),MED_NEUMF_Mid(:,2)); DeltaGapCal(MED_NEUMF_Low(:,1),MED_NEUMF_Low(:,2))];
VAECF_ = [DeltaGapCal(S_VAECF_High(:,1),S_VAECF_High(:,2)); DeltaGapCal(S_VAECF_Mid(:,1),S_VAECF_Mid(:,2));0;DeltaGapCal(M_VAECF_High(:,1),M_VAECF_High(:,2)); DeltaGapCal(M_VAECF_Mid(:,1),M_VAECF_Mid(:,2)); DeltaGapCal(M_VAECF_Low(:,1),M_VAECF_Low(:,2)); 0;DeltaGapCal(MD_VAECF_High(:,1),MD_VAECF_High(:,2)); DeltaGapCal(MD_VAECF_Mid(:,1),MD_VAECF_Mid(:,2)); DeltaGapCal(MD_VAECF_Low(:,1),MD_VAECF_Low(:,2)); 0; DeltaGapCal(ME_VAECF_High(:,1),ME_VAECF_High(:,2)); DeltaGapCal(ME_VAECF_Mid(:,1),ME_VAECF_Mid(:,2)); DeltaGapCal(ME_VAECF_Low(:,1),ME_VAECF_Low(:,2)); 0; DeltaGapCal(DE_VAECF_High(:,1),DE_VAECF_High(:,2)); DeltaGapCal(DE_VAECF_Mid(:,1),DE_VAECF_Mid(:,2));DeltaGapCal(DE_VAECF_Low(:,1),DE_VAECF_Low(:,2)); 0; DeltaGapCal(MED_VAECF_High(:,1),MED_VAECF_High(:,2)); DeltaGapCal(MED_VAECF_Mid(:,1),MED_VAECF_Mid(:,2)); DeltaGapCal(MED_VAECF_Low(:,1),MED_VAECF_Low(:,2))];

DeltaGAP=table(Group, Random_,ItemAVG_, MMMF_, WMF_, HPF_, IBPR_, WBPR_, SKM_, NEUMF_, VAECF_);
save DeltaGAP DeltaGAP

%% Table for TTEST of DeltaGAP values
Group=["Size-High/Mid"; "----"; "Mean-High/Mid"; "Mean-Mid/Low"; "----"; "MeanDev-High/Mid"; "MeanDev-Mid/Low"; "----"; "MeanEnt-High/Mid"; "MeanEnt-Mid/Low"; "----"; "DevEnt-High/Mid"; "DevEnt-Mid/Low"; "----"; "MeanDevEnt-High/Mid"; "MeanDevEnt-Mid/Low"];
Random_ = [DeltaGAPTest(S_Random_High,S_Random_Mid); 0;DeltaGAPTest(M_Random_High,M_Random_Mid);DeltaGAPTest(M_Random_Mid,M_Random_Low);0;DeltaGAPTest(MD_Random_High,MD_Random_Mid);DeltaGAPTest(MD_Random_Mid,MD_Random_Low);0;DeltaGAPTest(ME_Random_High,ME_Random_Mid);DeltaGAPTest(ME_Random_Mid,ME_Random_Low);0;DeltaGAPTest(DE_Random_High,DE_Random_Mid);DeltaGAPTest(DE_Random_Mid,DE_Random_Low);0;DeltaGAPTest(MED_Random_High,MED_Random_Mid);DeltaGAPTest(MED_Random_Mid,MED_Random_Low)];
ItemAVG_ = [DeltaGAPTest(S_ItemAVG_High,S_ItemAVG_Mid); 0;DeltaGAPTest(M_ItemAVG_High,M_ItemAVG_Mid);DeltaGAPTest(M_ItemAVG_Mid,M_ItemAVG_Low);0;DeltaGAPTest(MD_ItemAVG_High,MD_ItemAVG_Mid);DeltaGAPTest(MD_ItemAVG_Mid,MD_ItemAVG_Low);0;DeltaGAPTest(ME_ItemAVG_High,ME_ItemAVG_Mid);DeltaGAPTest(ME_ItemAVG_Mid,ME_ItemAVG_Low);0;DeltaGAPTest(DE_ItemAVG_High,DE_ItemAVG_Mid);DeltaGAPTest(DE_ItemAVG_Mid,DE_ItemAVG_Low);0;DeltaGAPTest(MED_ItemAVG_High,MED_ItemAVG_Mid);DeltaGAPTest(MED_ItemAVG_Mid,MED_ItemAVG_Low)];
MMMF_ = [DeltaGAPTest(S_MMMF_High,S_MMMF_Mid); 0;DeltaGAPTest(M_MMMF_High,M_MMMF_Mid);DeltaGAPTest(M_MMMF_Mid,M_MMMF_Low);0;DeltaGAPTest(MD_MMMF_High,MD_MMMF_Mid);DeltaGAPTest(MD_MMMF_Mid,MD_MMMF_Low);0;DeltaGAPTest(ME_MMMF_High,ME_MMMF_Mid);DeltaGAPTest(ME_MMMF_Mid,ME_MMMF_Low);0;DeltaGAPTest(DE_MMMF_High,DE_MMMF_Mid);DeltaGAPTest(DE_MMMF_Mid,DE_MMMF_Low);0;DeltaGAPTest(MED_MMMF_High,MED_MMMF_Mid);DeltaGAPTest(MED_MMMF_Mid,MED_MMMF_Low)];
WMF_ = [DeltaGAPTest(S_WMF_High,S_WMF_Mid); 0;DeltaGAPTest(M_WMF_High,M_WMF_Mid);DeltaGAPTest(M_WMF_Mid,M_WMF_Low);0;DeltaGAPTest(MD_WMF_High,MD_WMF_Mid);DeltaGAPTest(MD_WMF_Mid,MD_WMF_Low);0;DeltaGAPTest(ME_WMF_High,ME_WMF_Mid);DeltaGAPTest(ME_WMF_Mid,ME_WMF_Low);0;DeltaGAPTest(DE_WMF_High,DE_WMF_Mid);DeltaGAPTest(DE_WMF_Mid,DE_WMF_Low);0;DeltaGAPTest(MED_WMF_High,MED_WMF_Mid);DeltaGAPTest(MED_WMF_Mid,MED_WMF_Low)];
HPF_ = [DeltaGAPTest(S_HPF_High,S_HPF_Mid); 0;DeltaGAPTest(M_HPF_High,M_HPF_Mid);DeltaGAPTest(M_HPF_Mid,M_HPF_Low);0;DeltaGAPTest(MD_HPF_High,MD_HPF_Mid);DeltaGAPTest(MD_HPF_Mid,MD_HPF_Low);0;DeltaGAPTest(ME_HPF_High,ME_HPF_Mid);DeltaGAPTest(ME_HPF_Mid,ME_HPF_Low);0;DeltaGAPTest(DE_HPF_High,DE_HPF_Mid);DeltaGAPTest(DE_HPF_Mid,DE_HPF_Low);0;DeltaGAPTest(MED_HPF_High,MED_HPF_Mid);DeltaGAPTest(MED_HPF_Mid,MED_HPF_Low)];
IBPR_ = [DeltaGAPTest(S_IBPR_High,S_IBPR_Mid); 0;DeltaGAPTest(M_IBPR_High,M_IBPR_Mid);DeltaGAPTest(M_IBPR_Mid,M_IBPR_Low);0;DeltaGAPTest(MD_IBPR_High,MD_IBPR_Mid);DeltaGAPTest(MD_IBPR_Mid,MD_IBPR_Low);0;DeltaGAPTest(ME_IBPR_High,ME_IBPR_Mid);DeltaGAPTest(ME_IBPR_Mid,ME_IBPR_Low);0;DeltaGAPTest(DE_IBPR_High,DE_IBPR_Mid);DeltaGAPTest(DE_IBPR_Mid,DE_IBPR_Low);0;DeltaGAPTest(MED_IBPR_High,MED_IBPR_Mid);DeltaGAPTest(MED_IBPR_Mid,MED_IBPR_Low)];
WBPR_ = [DeltaGAPTest(S_WBPR_High,S_WBPR_Mid); 0;DeltaGAPTest(M_WBPR_High,M_WBPR_Mid);DeltaGAPTest(M_WBPR_Mid,M_WBPR_Low);0;DeltaGAPTest(MD_WBPR_High,MD_WBPR_Mid);DeltaGAPTest(MD_WBPR_Mid,MD_WBPR_Low);0;DeltaGAPTest(ME_WBPR_High,ME_WBPR_Mid);DeltaGAPTest(ME_WBPR_Mid,ME_WBPR_Low);0;DeltaGAPTest(DE_WBPR_High,DE_WBPR_Mid);DeltaGAPTest(DE_WBPR_Mid,DE_WBPR_Low);0;DeltaGAPTest(MED_WBPR_High,MED_WBPR_Mid);DeltaGAPTest(MED_WBPR_Mid,MED_WBPR_Low)];
SKM_ = [DeltaGAPTest(S_SKM_High,S_SKM_Mid); 0;DeltaGAPTest(M_SKM_High,M_SKM_Mid);DeltaGAPTest(M_SKM_Mid,M_SKM_Low);0;DeltaGAPTest(MD_SKM_High,MD_SKM_Mid);DeltaGAPTest(MD_SKM_Mid,MD_SKM_Low);0;DeltaGAPTest(ME_SKM_High,ME_SKM_Mid);DeltaGAPTest(ME_SKM_Mid,ME_SKM_Low);0;DeltaGAPTest(DE_SKM_High,DE_SKM_Mid);DeltaGAPTest(DE_SKM_Mid,DE_SKM_Low);0;DeltaGAPTest(MED_SKM_High,MED_SKM_Mid);DeltaGAPTest(MED_SKM_Mid,MED_SKM_Low)];
NEUMF_ = [DeltaGAPTest(S_NEUMF_High,S_NEUMF_Mid); 0;DeltaGAPTest(M_NEUMF_High,M_NEUMF_Mid);DeltaGAPTest(M_NEUMF_Mid,M_NEUMF_Low);0;DeltaGAPTest(MD_NEUMF_High,MD_NEUMF_Mid);DeltaGAPTest(MD_NEUMF_Mid,MD_NEUMF_Low);0;DeltaGAPTest(ME_NEUMF_High,ME_NEUMF_Mid);DeltaGAPTest(ME_NEUMF_Mid,ME_NEUMF_Low);0;DeltaGAPTest(DE_NEUMF_High,DE_NEUMF_Mid);DeltaGAPTest(DE_NEUMF_Mid,DE_NEUMF_Low);0;DeltaGAPTest(MED_NEUMF_High,MED_NEUMF_Mid);DeltaGAPTest(MED_NEUMF_Mid,MED_NEUMF_Low)];
VAECF_ = [DeltaGAPTest(S_VAECF_High,S_VAECF_Mid); 0;DeltaGAPTest(M_VAECF_High,M_VAECF_Mid);DeltaGAPTest(M_VAECF_Mid,M_VAECF_Low);0;DeltaGAPTest(MD_VAECF_High,MD_VAECF_Mid);DeltaGAPTest(MD_VAECF_Mid,MD_VAECF_Low);0;DeltaGAPTest(ME_VAECF_High,ME_VAECF_Mid);DeltaGAPTest(ME_VAECF_Mid,ME_VAECF_Low);0;DeltaGAPTest(DE_VAECF_High,DE_VAECF_Mid);DeltaGAPTest(DE_VAECF_Mid,DE_VAECF_Low);0;DeltaGAPTest(MED_VAECF_High,MED_VAECF_Mid);DeltaGAPTest(MED_VAECF_Mid,MED_VAECF_Low)];

DeltaGAPTTest=table(Group, Random_,ItemAVG_, MMMF_, WMF_, HPF_, IBPR_, WBPR_, SKM_, NEUMF_, VAECF_);
save DeltaGAPTTest DeltaGAPTTest



%% Table for nDCG values
Group=["Size-High"; "Size-Mid";"----"; "Mean-High"; "Mean-Mid"; "Mean-Low"; "----"; "MeanDev-High"; "MeanDev-Mid"; "MeanDev-Low"; "----"; "MeanEnt-High"; "MeanEnt-Mid"; "MeanEnt-Low"; "----"; "DevEnt-High"; "DevEnt-Mid"; "DevEnt-Low"; "----"; "MeanDevEnt-High"; "MeanDevEnt-Mid"; "MeanDevEnt-Low"];
Random_ = [nDCGCal(S_Random_High); nDCGCal(S_Random_Mid);0;nDCGCal(M_Random_High); nDCGCal(M_Random_Mid); nDCGCal(M_Random_Low); 0;nDCGCal(MD_Random_High); nDCGCal(MD_Random_Mid); nDCGCal(MD_Random_Low); 0; nDCGCal(ME_Random_High); nDCGCal(ME_Random_Mid); nDCGCal(ME_Random_Low); 0; nDCGCal(DE_Random_High); nDCGCal(DE_Random_Mid);nDCGCal(DE_Random_Low); 0; nDCGCal(MED_Random_High); nDCGCal(MED_Random_Mid); nDCGCal(MED_Random_Low)];
ItemAVG_ = [nDCGCal(S_ItemAVG_High); nDCGCal(S_ItemAVG_Mid);0;nDCGCal(M_ItemAVG_High); nDCGCal(M_ItemAVG_Mid); nDCGCal(M_ItemAVG_Low); 0;nDCGCal(MD_ItemAVG_High); nDCGCal(MD_ItemAVG_Mid); nDCGCal(MD_ItemAVG_Low); 0; nDCGCal(ME_ItemAVG_High); nDCGCal(ME_ItemAVG_Mid); nDCGCal(ME_ItemAVG_Low); 0; nDCGCal(DE_ItemAVG_High); nDCGCal(DE_ItemAVG_Mid);nDCGCal(DE_ItemAVG_Low); 0; nDCGCal(MED_ItemAVG_High); nDCGCal(MED_ItemAVG_Mid); nDCGCal(MED_ItemAVG_Low)];
MMMF_ = [nDCGCal(S_MMMF_High); nDCGCal(S_MMMF_Mid);0;nDCGCal(M_MMMF_High); nDCGCal(M_MMMF_Mid); nDCGCal(M_MMMF_Low); 0;nDCGCal(MD_MMMF_High); nDCGCal(MD_MMMF_Mid); nDCGCal(MD_MMMF_Low); 0; nDCGCal(ME_MMMF_High); nDCGCal(ME_MMMF_Mid); nDCGCal(ME_MMMF_Low); 0; nDCGCal(DE_MMMF_High); nDCGCal(DE_MMMF_Mid);nDCGCal(DE_MMMF_Low); 0; nDCGCal(MED_MMMF_High); nDCGCal(MED_MMMF_Mid); nDCGCal(MED_MMMF_Low)];
WMF_ = [nDCGCal(S_WMF_High); nDCGCal(S_WMF_Mid);0;nDCGCal(M_WMF_High); nDCGCal(M_WMF_Mid); nDCGCal(M_WMF_Low); 0;nDCGCal(MD_WMF_High); nDCGCal(MD_WMF_Mid); nDCGCal(MD_WMF_Low); 0; nDCGCal(ME_WMF_High); nDCGCal(ME_WMF_Mid); nDCGCal(ME_WMF_Low); 0; nDCGCal(DE_WMF_High); nDCGCal(DE_WMF_Mid);nDCGCal(DE_WMF_Low); 0; nDCGCal(MED_WMF_High); nDCGCal(MED_WMF_Mid); nDCGCal(MED_WMF_Low)];
HPF_ = [nDCGCal(S_HPF_High); nDCGCal(S_HPF_Mid);0;nDCGCal(M_HPF_High); nDCGCal(M_HPF_Mid); nDCGCal(M_HPF_Low); 0;nDCGCal(MD_HPF_High); nDCGCal(MD_HPF_Mid); nDCGCal(MD_HPF_Low); 0; nDCGCal(ME_HPF_High); nDCGCal(ME_HPF_Mid); nDCGCal(ME_HPF_Low); 0; nDCGCal(DE_HPF_High); nDCGCal(DE_HPF_Mid);nDCGCal(DE_HPF_Low); 0; nDCGCal(MED_HPF_High); nDCGCal(MED_HPF_Mid); nDCGCal(MED_HPF_Low)];
IBPR_ = [nDCGCal(S_IBPR_High); nDCGCal(S_IBPR_Mid);0;nDCGCal(M_IBPR_High); nDCGCal(M_IBPR_Mid); nDCGCal(M_IBPR_Low); 0;nDCGCal(MD_IBPR_High); nDCGCal(MD_IBPR_Mid); nDCGCal(MD_IBPR_Low); 0; nDCGCal(ME_IBPR_High); nDCGCal(ME_IBPR_Mid); nDCGCal(ME_IBPR_Low); 0; nDCGCal(DE_IBPR_High); nDCGCal(DE_IBPR_Mid);nDCGCal(DE_IBPR_Low); 0; nDCGCal(MED_IBPR_High); nDCGCal(MED_IBPR_Mid); nDCGCal(MED_IBPR_Low)];
WBPR_ = [nDCGCal(S_WBPR_High); nDCGCal(S_WBPR_Mid);0;nDCGCal(M_WBPR_High); nDCGCal(M_WBPR_Mid); nDCGCal(M_WBPR_Low); 0;nDCGCal(MD_WBPR_High); nDCGCal(MD_WBPR_Mid); nDCGCal(MD_WBPR_Low); 0; nDCGCal(ME_WBPR_High); nDCGCal(ME_WBPR_Mid); nDCGCal(ME_WBPR_Low); 0; nDCGCal(DE_WBPR_High); nDCGCal(DE_WBPR_Mid);nDCGCal(DE_WBPR_Low); 0; nDCGCal(MED_WBPR_High); nDCGCal(MED_WBPR_Mid); nDCGCal(MED_WBPR_Low)];
SKM_ = [nDCGCal(S_SKM_High); nDCGCal(S_SKM_Mid);0;nDCGCal(M_SKM_High); nDCGCal(M_SKM_Mid); nDCGCal(M_SKM_Low); 0;nDCGCal(MD_SKM_High); nDCGCal(MD_SKM_Mid); nDCGCal(MD_SKM_Low); 0; nDCGCal(ME_SKM_High); nDCGCal(ME_SKM_Mid); nDCGCal(ME_SKM_Low); 0; nDCGCal(DE_SKM_High); nDCGCal(DE_SKM_Mid);nDCGCal(DE_SKM_Low); 0; nDCGCal(MED_SKM_High); nDCGCal(MED_SKM_Mid); nDCGCal(MED_SKM_Low)];
NEUMF_ = [nDCGCal(S_NEUMF_High); nDCGCal(S_NEUMF_Mid);0;nDCGCal(M_NEUMF_High); nDCGCal(M_NEUMF_Mid); nDCGCal(M_NEUMF_Low); 0;nDCGCal(MD_NEUMF_High); nDCGCal(MD_NEUMF_Mid); nDCGCal(MD_NEUMF_Low); 0; nDCGCal(ME_NEUMF_High); nDCGCal(ME_NEUMF_Mid); nDCGCal(ME_NEUMF_Low); 0; nDCGCal(DE_NEUMF_High); nDCGCal(DE_NEUMF_Mid);nDCGCal(DE_NEUMF_Low); 0; nDCGCal(MED_NEUMF_High); nDCGCal(MED_NEUMF_Mid); nDCGCal(MED_NEUMF_Low)];
VAECF_ = [nDCGCal(S_VAECF_High); nDCGCal(S_VAECF_Mid);0;nDCGCal(M_VAECF_High); nDCGCal(M_VAECF_Mid); nDCGCal(M_VAECF_Low); 0;nDCGCal(MD_VAECF_High); nDCGCal(MD_VAECF_Mid); nDCGCal(MD_VAECF_Low); 0; nDCGCal(ME_VAECF_High); nDCGCal(ME_VAECF_Mid); nDCGCal(ME_VAECF_Low); 0; nDCGCal(DE_VAECF_High); nDCGCal(DE_VAECF_Mid);nDCGCal(DE_VAECF_Low); 0; nDCGCal(MED_VAECF_High); nDCGCal(MED_VAECF_Mid); nDCGCal(MED_VAECF_Low)];

nDCGTable=table(Group, Random_,ItemAVG_, MMMF_, WMF_, HPF_, IBPR_, WBPR_, SKM_, NEUMF_, VAECF_);
save nDCG nDCGTable

%% Table for TTEST of nDCG values
Group=["Size-High/Mid"; "----"; "Mean-High/Mid"; "Mean-Mid/Low"; "----"; "MeanDev-High/Mid"; "MeanDev-Mid/Low"; "----"; "MeanEnt-High/Mid"; "MeanEnt-Mid/Low"; "----"; "DevEnt-High/Mid"; "DevEnt-Mid/Low"; "----"; "MeanDevEnt-High/Mid"; "MeanDevEnt-Mid/Low"];
Random_ = [nDCGTest(S_Random_High,S_Random_Mid); 0;nDCGTest(M_Random_High,M_Random_Mid);nDCGTest(M_Random_Mid,M_Random_Low);0;nDCGTest(MD_Random_High,MD_Random_Mid);nDCGTest(MD_Random_Mid,MD_Random_Low);0;nDCGTest(ME_Random_High,ME_Random_Mid);nDCGTest(ME_Random_Mid,ME_Random_Low);0;nDCGTest(DE_Random_High,DE_Random_Mid);nDCGTest(DE_Random_Mid,DE_Random_Low);0;nDCGTest(MED_Random_High,MED_Random_Mid);nDCGTest(MED_Random_Mid,MED_Random_Low)];
ItemAVG_ = [nDCGTest(S_ItemAVG_High,S_ItemAVG_Mid); 0;nDCGTest(M_ItemAVG_High,M_ItemAVG_Mid);nDCGTest(M_ItemAVG_Mid,M_ItemAVG_Low);0;nDCGTest(MD_ItemAVG_High,MD_ItemAVG_Mid);nDCGTest(MD_ItemAVG_Mid,MD_ItemAVG_Low);0;nDCGTest(ME_ItemAVG_High,ME_ItemAVG_Mid);nDCGTest(ME_ItemAVG_Mid,ME_ItemAVG_Low);0;nDCGTest(DE_ItemAVG_High,DE_ItemAVG_Mid);nDCGTest(DE_ItemAVG_Mid,DE_ItemAVG_Low);0;nDCGTest(MED_ItemAVG_High,MED_ItemAVG_Mid);nDCGTest(MED_ItemAVG_Mid,MED_ItemAVG_Low)];
MMMF_ = [nDCGTest(S_MMMF_High,S_MMMF_Mid); 0;nDCGTest(M_MMMF_High,M_MMMF_Mid);nDCGTest(M_MMMF_Mid,M_MMMF_Low);0;nDCGTest(MD_MMMF_High,MD_MMMF_Mid);nDCGTest(MD_MMMF_Mid,MD_MMMF_Low);0;nDCGTest(ME_MMMF_High,ME_MMMF_Mid);nDCGTest(ME_MMMF_Mid,ME_MMMF_Low);0;nDCGTest(DE_MMMF_High,DE_MMMF_Mid);nDCGTest(DE_MMMF_Mid,DE_MMMF_Low);0;nDCGTest(MED_MMMF_High,MED_MMMF_Mid);nDCGTest(MED_MMMF_Mid,MED_MMMF_Low)];
WMF_ = [nDCGTest(S_WMF_High,S_WMF_Mid); 0;nDCGTest(M_WMF_High,M_WMF_Mid);nDCGTest(M_WMF_Mid,M_WMF_Low);0;nDCGTest(MD_WMF_High,MD_WMF_Mid);nDCGTest(MD_WMF_Mid,MD_WMF_Low);0;nDCGTest(ME_WMF_High,ME_WMF_Mid);nDCGTest(ME_WMF_Mid,ME_WMF_Low);0;nDCGTest(DE_WMF_High,DE_WMF_Mid);nDCGTest(DE_WMF_Mid,DE_WMF_Low);0;nDCGTest(MED_WMF_High,MED_WMF_Mid);nDCGTest(MED_WMF_Mid,MED_WMF_Low)];
HPF_ = [nDCGTest(S_HPF_High,S_HPF_Mid); 0;nDCGTest(M_HPF_High,M_HPF_Mid);nDCGTest(M_HPF_Mid,M_HPF_Low);0;nDCGTest(MD_HPF_High,MD_HPF_Mid);nDCGTest(MD_HPF_Mid,MD_HPF_Low);0;nDCGTest(ME_HPF_High,ME_HPF_Mid);nDCGTest(ME_HPF_Mid,ME_HPF_Low);0;nDCGTest(DE_HPF_High,DE_HPF_Mid);nDCGTest(DE_HPF_Mid,DE_HPF_Low);0;nDCGTest(MED_HPF_High,MED_HPF_Mid);nDCGTest(MED_HPF_Mid,MED_HPF_Low)];
IBPR_ = [nDCGTest(S_IBPR_High,S_IBPR_Mid); 0;nDCGTest(M_IBPR_High,M_IBPR_Mid);nDCGTest(M_IBPR_Mid,M_IBPR_Low);0;nDCGTest(MD_IBPR_High,MD_IBPR_Mid);nDCGTest(MD_IBPR_Mid,MD_IBPR_Low);0;nDCGTest(ME_IBPR_High,ME_IBPR_Mid);nDCGTest(ME_IBPR_Mid,ME_IBPR_Low);0;nDCGTest(DE_IBPR_High,DE_IBPR_Mid);nDCGTest(DE_IBPR_Mid,DE_IBPR_Low);0;nDCGTest(MED_IBPR_High,MED_IBPR_Mid);nDCGTest(MED_IBPR_Mid,MED_IBPR_Low)];
WBPR_ = [nDCGTest(S_WBPR_High,S_WBPR_Mid); 0;nDCGTest(M_WBPR_High,M_WBPR_Mid);nDCGTest(M_WBPR_Mid,M_WBPR_Low);0;nDCGTest(MD_WBPR_High,MD_WBPR_Mid);nDCGTest(MD_WBPR_Mid,MD_WBPR_Low);0;nDCGTest(ME_WBPR_High,ME_WBPR_Mid);nDCGTest(ME_WBPR_Mid,ME_WBPR_Low);0;nDCGTest(DE_WBPR_High,DE_WBPR_Mid);nDCGTest(DE_WBPR_Mid,DE_WBPR_Low);0;nDCGTest(MED_WBPR_High,MED_WBPR_Mid);nDCGTest(MED_WBPR_Mid,MED_WBPR_Low)];
SKM_ = [nDCGTest(S_SKM_High,S_SKM_Mid); 0;nDCGTest(M_SKM_High,M_SKM_Mid);nDCGTest(M_SKM_Mid,M_SKM_Low);0;nDCGTest(MD_SKM_High,MD_SKM_Mid);nDCGTest(MD_SKM_Mid,MD_SKM_Low);0;nDCGTest(ME_SKM_High,ME_SKM_Mid);nDCGTest(ME_SKM_Mid,ME_SKM_Low);0;nDCGTest(DE_SKM_High,DE_SKM_Mid);nDCGTest(DE_SKM_Mid,DE_SKM_Low);0;nDCGTest(MED_SKM_High,MED_SKM_Mid);nDCGTest(MED_SKM_Mid,MED_SKM_Low)];
NEUMF_ = [nDCGTest(S_NEUMF_High,S_NEUMF_Mid); 0;nDCGTest(M_NEUMF_High,M_NEUMF_Mid);nDCGTest(M_NEUMF_Mid,M_NEUMF_Low);0;nDCGTest(MD_NEUMF_High,MD_NEUMF_Mid);nDCGTest(MD_NEUMF_Mid,MD_NEUMF_Low);0;nDCGTest(ME_NEUMF_High,ME_NEUMF_Mid);nDCGTest(ME_NEUMF_Mid,ME_NEUMF_Low);0;nDCGTest(DE_NEUMF_High,DE_NEUMF_Mid);nDCGTest(DE_NEUMF_Mid,DE_NEUMF_Low);0;nDCGTest(MED_NEUMF_High,MED_NEUMF_Mid);nDCGTest(MED_NEUMF_Mid,MED_NEUMF_Low)];
VAECF_ = [nDCGTest(S_VAECF_High,S_VAECF_Mid); 0;nDCGTest(M_VAECF_High,M_VAECF_Mid);nDCGTest(M_VAECF_Mid,M_VAECF_Low);0;nDCGTest(MD_VAECF_High,MD_VAECF_Mid);nDCGTest(MD_VAECF_Mid,MD_VAECF_Low);0;nDCGTest(ME_VAECF_High,ME_VAECF_Mid);nDCGTest(ME_VAECF_Mid,ME_VAECF_Low);0;nDCGTest(DE_VAECF_High,DE_VAECF_Mid);nDCGTest(DE_VAECF_Mid,DE_VAECF_Low);0;nDCGTest(MED_VAECF_High,MED_VAECF_Mid);nDCGTest(MED_VAECF_Mid,MED_VAECF_Low)];

nDCGTTest=table(Group, Random_,ItemAVG_, MMMF_, WMF_, HPF_, IBPR_, WBPR_, SKM_, NEUMF_, VAECF_);
save nDCGTTest nDCGTTest



%% Table for Precision values
Group=["Size-High"; "Size-Mid";"----"; "Mean-High"; "Mean-Mid"; "Mean-Low"; "----"; "MeanDev-High"; "MeanDev-Mid"; "MeanDev-Low"; "----"; "MeanEnt-High"; "MeanEnt-Mid"; "MeanEnt-Low"; "----"; "DevEnt-High"; "DevEnt-Mid"; "DevEnt-Low"; "----"; "MeanDevEnt-High"; "MeanDevEnt-Mid"; "MeanDevEnt-Low"];
Random_ = [PrecCal(S_Random_High); PrecCal(S_Random_Mid);0;PrecCal(M_Random_High); PrecCal(M_Random_Mid); PrecCal(M_Random_Low); 0;PrecCal(MD_Random_High); PrecCal(MD_Random_Mid); PrecCal(MD_Random_Low); 0; PrecCal(ME_Random_High); PrecCal(ME_Random_Mid); PrecCal(ME_Random_Low); 0; PrecCal(DE_Random_High); PrecCal(DE_Random_Mid);PrecCal(DE_Random_Low); 0; PrecCal(MED_Random_High); PrecCal(MED_Random_Mid); PrecCal(MED_Random_Low)];
ItemAVG_ = [PrecCal(S_ItemAVG_High); PrecCal(S_ItemAVG_Mid);0;PrecCal(M_ItemAVG_High); PrecCal(M_ItemAVG_Mid); PrecCal(M_ItemAVG_Low); 0;PrecCal(MD_ItemAVG_High); PrecCal(MD_ItemAVG_Mid); PrecCal(MD_ItemAVG_Low); 0; PrecCal(ME_ItemAVG_High); PrecCal(ME_ItemAVG_Mid); PrecCal(ME_ItemAVG_Low); 0; PrecCal(DE_ItemAVG_High); PrecCal(DE_ItemAVG_Mid);PrecCal(DE_ItemAVG_Low); 0; PrecCal(MED_ItemAVG_High); PrecCal(MED_ItemAVG_Mid); PrecCal(MED_ItemAVG_Low)];
MMMF_ = [PrecCal(S_MMMF_High); PrecCal(S_MMMF_Mid);0;PrecCal(M_MMMF_High); PrecCal(M_MMMF_Mid); PrecCal(M_MMMF_Low); 0;PrecCal(MD_MMMF_High); PrecCal(MD_MMMF_Mid); PrecCal(MD_MMMF_Low); 0; PrecCal(ME_MMMF_High); PrecCal(ME_MMMF_Mid); PrecCal(ME_MMMF_Low); 0; PrecCal(DE_MMMF_High); PrecCal(DE_MMMF_Mid);PrecCal(DE_MMMF_Low); 0; PrecCal(MED_MMMF_High); PrecCal(MED_MMMF_Mid); PrecCal(MED_MMMF_Low)];
WMF_ = [PrecCal(S_WMF_High); PrecCal(S_WMF_Mid);0;PrecCal(M_WMF_High); PrecCal(M_WMF_Mid); PrecCal(M_WMF_Low); 0;PrecCal(MD_WMF_High); PrecCal(MD_WMF_Mid); PrecCal(MD_WMF_Low); 0; PrecCal(ME_WMF_High); PrecCal(ME_WMF_Mid); PrecCal(ME_WMF_Low); 0; PrecCal(DE_WMF_High); PrecCal(DE_WMF_Mid);PrecCal(DE_WMF_Low); 0; PrecCal(MED_WMF_High); PrecCal(MED_WMF_Mid); PrecCal(MED_WMF_Low)];
HPF_ = [PrecCal(S_HPF_High); PrecCal(S_HPF_Mid);0;PrecCal(M_HPF_High); PrecCal(M_HPF_Mid); PrecCal(M_HPF_Low); 0;PrecCal(MD_HPF_High); PrecCal(MD_HPF_Mid); PrecCal(MD_HPF_Low); 0; PrecCal(ME_HPF_High); PrecCal(ME_HPF_Mid); PrecCal(ME_HPF_Low); 0; PrecCal(DE_HPF_High); PrecCal(DE_HPF_Mid);PrecCal(DE_HPF_Low); 0; PrecCal(MED_HPF_High); PrecCal(MED_HPF_Mid); PrecCal(MED_HPF_Low)];
IBPR_ = [PrecCal(S_IBPR_High); PrecCal(S_IBPR_Mid);0;PrecCal(M_IBPR_High); PrecCal(M_IBPR_Mid); PrecCal(M_IBPR_Low); 0;PrecCal(MD_IBPR_High); PrecCal(MD_IBPR_Mid); PrecCal(MD_IBPR_Low); 0; PrecCal(ME_IBPR_High); PrecCal(ME_IBPR_Mid); PrecCal(ME_IBPR_Low); 0; PrecCal(DE_IBPR_High); PrecCal(DE_IBPR_Mid);PrecCal(DE_IBPR_Low); 0; PrecCal(MED_IBPR_High); PrecCal(MED_IBPR_Mid); PrecCal(MED_IBPR_Low)];
WBPR_ = [PrecCal(S_WBPR_High); PrecCal(S_WBPR_Mid);0;PrecCal(M_WBPR_High); PrecCal(M_WBPR_Mid); PrecCal(M_WBPR_Low); 0;PrecCal(MD_WBPR_High); PrecCal(MD_WBPR_Mid); PrecCal(MD_WBPR_Low); 0; PrecCal(ME_WBPR_High); PrecCal(ME_WBPR_Mid); PrecCal(ME_WBPR_Low); 0; PrecCal(DE_WBPR_High); PrecCal(DE_WBPR_Mid);PrecCal(DE_WBPR_Low); 0; PrecCal(MED_WBPR_High); PrecCal(MED_WBPR_Mid); PrecCal(MED_WBPR_Low)];
SKM_ = [PrecCal(S_SKM_High); PrecCal(S_SKM_Mid);0;PrecCal(M_SKM_High); PrecCal(M_SKM_Mid); PrecCal(M_SKM_Low); 0;PrecCal(MD_SKM_High); PrecCal(MD_SKM_Mid); PrecCal(MD_SKM_Low); 0; PrecCal(ME_SKM_High); PrecCal(ME_SKM_Mid); PrecCal(ME_SKM_Low); 0; PrecCal(DE_SKM_High); PrecCal(DE_SKM_Mid);PrecCal(DE_SKM_Low); 0; PrecCal(MED_SKM_High); PrecCal(MED_SKM_Mid); PrecCal(MED_SKM_Low)];
NEUMF_ = [PrecCal(S_NEUMF_High); PrecCal(S_NEUMF_Mid);0;PrecCal(M_NEUMF_High); PrecCal(M_NEUMF_Mid); PrecCal(M_NEUMF_Low); 0;PrecCal(MD_NEUMF_High); PrecCal(MD_NEUMF_Mid); PrecCal(MD_NEUMF_Low); 0; PrecCal(ME_NEUMF_High); PrecCal(ME_NEUMF_Mid); PrecCal(ME_NEUMF_Low); 0; PrecCal(DE_NEUMF_High); PrecCal(DE_NEUMF_Mid);PrecCal(DE_NEUMF_Low); 0; PrecCal(MED_NEUMF_High); PrecCal(MED_NEUMF_Mid); PrecCal(MED_NEUMF_Low)];
VAECF_ = [PrecCal(S_VAECF_High); PrecCal(S_VAECF_Mid);0;PrecCal(M_VAECF_High); PrecCal(M_VAECF_Mid); PrecCal(M_VAECF_Low); 0;PrecCal(MD_VAECF_High); PrecCal(MD_VAECF_Mid); PrecCal(MD_VAECF_Low); 0; PrecCal(ME_VAECF_High); PrecCal(ME_VAECF_Mid); PrecCal(ME_VAECF_Low); 0; PrecCal(DE_VAECF_High); PrecCal(DE_VAECF_Mid);PrecCal(DE_VAECF_Low); 0; PrecCal(MED_VAECF_High); PrecCal(MED_VAECF_Mid); PrecCal(MED_VAECF_Low)];

PrecisionTable=table(Group, Random_,ItemAVG_, MMMF_, WMF_, HPF_, IBPR_, WBPR_, SKM_, NEUMF_, VAECF_);
save Precision PrecisionTable

%% Table for TTEST of Precision values
Group=["Size-High/Mid"; "----"; "Mean-High/Mid"; "Mean-Mid/Low"; "----"; "MeanDev-High/Mid"; "MeanDev-Mid/Low"; "----"; "MeanEnt-High/Mid"; "MeanEnt-Mid/Low"; "----"; "DevEnt-High/Mid"; "DevEnt-Mid/Low"; "----"; "MeanDevEnt-High/Mid"; "MeanDevEnt-Mid/Low"];
Random_ = [PrecTest(S_Random_High,S_Random_Mid); 0;PrecTest(M_Random_High,M_Random_Mid);PrecTest(M_Random_Mid,M_Random_Low);0;PrecTest(MD_Random_High,MD_Random_Mid);PrecTest(MD_Random_Mid,MD_Random_Low);0;PrecTest(ME_Random_High,ME_Random_Mid);PrecTest(ME_Random_Mid,ME_Random_Low);0;PrecTest(DE_Random_High,DE_Random_Mid);PrecTest(DE_Random_Mid,DE_Random_Low);0;PrecTest(MED_Random_High,MED_Random_Mid);PrecTest(MED_Random_Mid,MED_Random_Low)];
ItemAVG_ = [PrecTest(S_ItemAVG_High,S_ItemAVG_Mid); 0;PrecTest(M_ItemAVG_High,M_ItemAVG_Mid);PrecTest(M_ItemAVG_Mid,M_ItemAVG_Low);0;PrecTest(MD_ItemAVG_High,MD_ItemAVG_Mid);PrecTest(MD_ItemAVG_Mid,MD_ItemAVG_Low);0;PrecTest(ME_ItemAVG_High,ME_ItemAVG_Mid);PrecTest(ME_ItemAVG_Mid,ME_ItemAVG_Low);0;PrecTest(DE_ItemAVG_High,DE_ItemAVG_Mid);PrecTest(DE_ItemAVG_Mid,DE_ItemAVG_Low);0;PrecTest(MED_ItemAVG_High,MED_ItemAVG_Mid);PrecTest(MED_ItemAVG_Mid,MED_ItemAVG_Low)];
MMMF_ = [PrecTest(S_MMMF_High,S_MMMF_Mid); 0;PrecTest(M_MMMF_High,M_MMMF_Mid);PrecTest(M_MMMF_Mid,M_MMMF_Low);0;PrecTest(MD_MMMF_High,MD_MMMF_Mid);PrecTest(MD_MMMF_Mid,MD_MMMF_Low);0;PrecTest(ME_MMMF_High,ME_MMMF_Mid);PrecTest(ME_MMMF_Mid,ME_MMMF_Low);0;PrecTest(DE_MMMF_High,DE_MMMF_Mid);PrecTest(DE_MMMF_Mid,DE_MMMF_Low);0;PrecTest(MED_MMMF_High,MED_MMMF_Mid);PrecTest(MED_MMMF_Mid,MED_MMMF_Low)];
WMF_ = [PrecTest(S_WMF_High,S_WMF_Mid); 0;PrecTest(M_WMF_High,M_WMF_Mid);PrecTest(M_WMF_Mid,M_WMF_Low);0;PrecTest(MD_WMF_High,MD_WMF_Mid);PrecTest(MD_WMF_Mid,MD_WMF_Low);0;PrecTest(ME_WMF_High,ME_WMF_Mid);PrecTest(ME_WMF_Mid,ME_WMF_Low);0;PrecTest(DE_WMF_High,DE_WMF_Mid);PrecTest(DE_WMF_Mid,DE_WMF_Low);0;PrecTest(MED_WMF_High,MED_WMF_Mid);PrecTest(MED_WMF_Mid,MED_WMF_Low)];
HPF_ = [PrecTest(S_HPF_High,S_HPF_Mid); 0;PrecTest(M_HPF_High,M_HPF_Mid);PrecTest(M_HPF_Mid,M_HPF_Low);0;PrecTest(MD_HPF_High,MD_HPF_Mid);PrecTest(MD_HPF_Mid,MD_HPF_Low);0;PrecTest(ME_HPF_High,ME_HPF_Mid);PrecTest(ME_HPF_Mid,ME_HPF_Low);0;PrecTest(DE_HPF_High,DE_HPF_Mid);PrecTest(DE_HPF_Mid,DE_HPF_Low);0;PrecTest(MED_HPF_High,MED_HPF_Mid);PrecTest(MED_HPF_Mid,MED_HPF_Low)];
IBPR_ = [PrecTest(S_IBPR_High,S_IBPR_Mid); 0;PrecTest(M_IBPR_High,M_IBPR_Mid);PrecTest(M_IBPR_Mid,M_IBPR_Low);0;PrecTest(MD_IBPR_High,MD_IBPR_Mid);PrecTest(MD_IBPR_Mid,MD_IBPR_Low);0;PrecTest(ME_IBPR_High,ME_IBPR_Mid);PrecTest(ME_IBPR_Mid,ME_IBPR_Low);0;PrecTest(DE_IBPR_High,DE_IBPR_Mid);PrecTest(DE_IBPR_Mid,DE_IBPR_Low);0;PrecTest(MED_IBPR_High,MED_IBPR_Mid);PrecTest(MED_IBPR_Mid,MED_IBPR_Low)];
WBPR_ = [PrecTest(S_WBPR_High,S_WBPR_Mid); 0;PrecTest(M_WBPR_High,M_WBPR_Mid);PrecTest(M_WBPR_Mid,M_WBPR_Low);0;PrecTest(MD_WBPR_High,MD_WBPR_Mid);PrecTest(MD_WBPR_Mid,MD_WBPR_Low);0;PrecTest(ME_WBPR_High,ME_WBPR_Mid);PrecTest(ME_WBPR_Mid,ME_WBPR_Low);0;PrecTest(DE_WBPR_High,DE_WBPR_Mid);PrecTest(DE_WBPR_Mid,DE_WBPR_Low);0;PrecTest(MED_WBPR_High,MED_WBPR_Mid);PrecTest(MED_WBPR_Mid,MED_WBPR_Low)];
SKM_ = [PrecTest(S_SKM_High,S_SKM_Mid); 0;PrecTest(M_SKM_High,M_SKM_Mid);PrecTest(M_SKM_Mid,M_SKM_Low);0;PrecTest(MD_SKM_High,MD_SKM_Mid);PrecTest(MD_SKM_Mid,MD_SKM_Low);0;PrecTest(ME_SKM_High,ME_SKM_Mid);PrecTest(ME_SKM_Mid,ME_SKM_Low);0;PrecTest(DE_SKM_High,DE_SKM_Mid);PrecTest(DE_SKM_Mid,DE_SKM_Low);0;PrecTest(MED_SKM_High,MED_SKM_Mid);PrecTest(MED_SKM_Mid,MED_SKM_Low)];
NEUMF_ = [PrecTest(S_NEUMF_High,S_NEUMF_Mid); 0;PrecTest(M_NEUMF_High,M_NEUMF_Mid);PrecTest(M_NEUMF_Mid,M_NEUMF_Low);0;PrecTest(MD_NEUMF_High,MD_NEUMF_Mid);PrecTest(MD_NEUMF_Mid,MD_NEUMF_Low);0;PrecTest(ME_NEUMF_High,ME_NEUMF_Mid);PrecTest(ME_NEUMF_Mid,ME_NEUMF_Low);0;PrecTest(DE_NEUMF_High,DE_NEUMF_Mid);PrecTest(DE_NEUMF_Mid,DE_NEUMF_Low);0;PrecTest(MED_NEUMF_High,MED_NEUMF_Mid);PrecTest(MED_NEUMF_Mid,MED_NEUMF_Low)];
VAECF_ = [PrecTest(S_VAECF_High,S_VAECF_Mid); 0;PrecTest(M_VAECF_High,M_VAECF_Mid);PrecTest(M_VAECF_Mid,M_VAECF_Low);0;PrecTest(MD_VAECF_High,MD_VAECF_Mid);PrecTest(MD_VAECF_Mid,MD_VAECF_Low);0;PrecTest(ME_VAECF_High,ME_VAECF_Mid);PrecTest(ME_VAECF_Mid,ME_VAECF_Low);0;PrecTest(DE_VAECF_High,DE_VAECF_Mid);PrecTest(DE_VAECF_Mid,DE_VAECF_Low);0;PrecTest(MED_VAECF_High,MED_VAECF_Mid);PrecTest(MED_VAECF_Mid,MED_VAECF_Low)];

PrecisionTTest=table(Group, Random_,ItemAVG_, MMMF_, WMF_, HPF_, IBPR_, WBPR_, SKM_, NEUMF_, VAECF_);
save PrecisionTTest PrecisionTTest



%% Table for Recall values
Group=["Size-High"; "Size-Mid";"----"; "Mean-High"; "Mean-Mid"; "Mean-Low"; "----"; "MeanDev-High"; "MeanDev-Mid"; "MeanDev-Low"; "----"; "MeanEnt-High"; "MeanEnt-Mid"; "MeanEnt-Low"; "----"; "DevEnt-High"; "DevEnt-Mid"; "DevEnt-Low"; "----"; "MeanDevEnt-High"; "MeanDevEnt-Mid"; "MeanDevEnt-Low"];
Random_ = [RecallCal(S_Random_High); RecallCal(S_Random_Mid);0;RecallCal(M_Random_High); RecallCal(M_Random_Mid); RecallCal(M_Random_Low); 0;RecallCal(MD_Random_High); RecallCal(MD_Random_Mid); RecallCal(MD_Random_Low); 0; RecallCal(ME_Random_High); RecallCal(ME_Random_Mid); RecallCal(ME_Random_Low); 0; RecallCal(DE_Random_High); RecallCal(DE_Random_Mid);RecallCal(DE_Random_Low); 0; RecallCal(MED_Random_High); RecallCal(MED_Random_Mid); RecallCal(MED_Random_Low)];
ItemAVG_ = [RecallCal(S_ItemAVG_High); RecallCal(S_ItemAVG_Mid);0;RecallCal(M_ItemAVG_High); RecallCal(M_ItemAVG_Mid); RecallCal(M_ItemAVG_Low); 0;RecallCal(MD_ItemAVG_High); RecallCal(MD_ItemAVG_Mid); RecallCal(MD_ItemAVG_Low); 0; RecallCal(ME_ItemAVG_High); RecallCal(ME_ItemAVG_Mid); RecallCal(ME_ItemAVG_Low); 0; RecallCal(DE_ItemAVG_High); RecallCal(DE_ItemAVG_Mid);RecallCal(DE_ItemAVG_Low); 0; RecallCal(MED_ItemAVG_High); RecallCal(MED_ItemAVG_Mid); RecallCal(MED_ItemAVG_Low)];
MMMF_ = [RecallCal(S_MMMF_High); RecallCal(S_MMMF_Mid);0;RecallCal(M_MMMF_High); RecallCal(M_MMMF_Mid); RecallCal(M_MMMF_Low); 0;RecallCal(MD_MMMF_High); RecallCal(MD_MMMF_Mid); RecallCal(MD_MMMF_Low); 0; RecallCal(ME_MMMF_High); RecallCal(ME_MMMF_Mid); RecallCal(ME_MMMF_Low); 0; RecallCal(DE_MMMF_High); RecallCal(DE_MMMF_Mid);RecallCal(DE_MMMF_Low); 0; RecallCal(MED_MMMF_High); RecallCal(MED_MMMF_Mid); RecallCal(MED_MMMF_Low)];
WMF_ = [RecallCal(S_WMF_High); RecallCal(S_WMF_Mid);0;RecallCal(M_WMF_High); RecallCal(M_WMF_Mid); RecallCal(M_WMF_Low); 0;RecallCal(MD_WMF_High); RecallCal(MD_WMF_Mid); RecallCal(MD_WMF_Low); 0; RecallCal(ME_WMF_High); RecallCal(ME_WMF_Mid); RecallCal(ME_WMF_Low); 0; RecallCal(DE_WMF_High); RecallCal(DE_WMF_Mid);RecallCal(DE_WMF_Low); 0; RecallCal(MED_WMF_High); RecallCal(MED_WMF_Mid); RecallCal(MED_WMF_Low)];
HPF_ = [RecallCal(S_HPF_High); RecallCal(S_HPF_Mid);0;RecallCal(M_HPF_High); RecallCal(M_HPF_Mid); RecallCal(M_HPF_Low); 0;RecallCal(MD_HPF_High); RecallCal(MD_HPF_Mid); RecallCal(MD_HPF_Low); 0; RecallCal(ME_HPF_High); RecallCal(ME_HPF_Mid); RecallCal(ME_HPF_Low); 0; RecallCal(DE_HPF_High); RecallCal(DE_HPF_Mid);RecallCal(DE_HPF_Low); 0; RecallCal(MED_HPF_High); RecallCal(MED_HPF_Mid); RecallCal(MED_HPF_Low)];
IBPR_ = [RecallCal(S_IBPR_High); RecallCal(S_IBPR_Mid);0;RecallCal(M_IBPR_High); RecallCal(M_IBPR_Mid); RecallCal(M_IBPR_Low); 0;RecallCal(MD_IBPR_High); RecallCal(MD_IBPR_Mid); RecallCal(MD_IBPR_Low); 0; RecallCal(ME_IBPR_High); RecallCal(ME_IBPR_Mid); RecallCal(ME_IBPR_Low); 0; RecallCal(DE_IBPR_High); RecallCal(DE_IBPR_Mid);RecallCal(DE_IBPR_Low); 0; RecallCal(MED_IBPR_High); RecallCal(MED_IBPR_Mid); RecallCal(MED_IBPR_Low)];
WBPR_ = [RecallCal(S_WBPR_High); RecallCal(S_WBPR_Mid);0;RecallCal(M_WBPR_High); RecallCal(M_WBPR_Mid); RecallCal(M_WBPR_Low); 0;RecallCal(MD_WBPR_High); RecallCal(MD_WBPR_Mid); RecallCal(MD_WBPR_Low); 0; RecallCal(ME_WBPR_High); RecallCal(ME_WBPR_Mid); RecallCal(ME_WBPR_Low); 0; RecallCal(DE_WBPR_High); RecallCal(DE_WBPR_Mid);RecallCal(DE_WBPR_Low); 0; RecallCal(MED_WBPR_High); RecallCal(MED_WBPR_Mid); RecallCal(MED_WBPR_Low)];
SKM_ = [RecallCal(S_SKM_High); RecallCal(S_SKM_Mid);0;RecallCal(M_SKM_High); RecallCal(M_SKM_Mid); RecallCal(M_SKM_Low); 0;RecallCal(MD_SKM_High); RecallCal(MD_SKM_Mid); RecallCal(MD_SKM_Low); 0; RecallCal(ME_SKM_High); RecallCal(ME_SKM_Mid); RecallCal(ME_SKM_Low); 0; RecallCal(DE_SKM_High); RecallCal(DE_SKM_Mid);RecallCal(DE_SKM_Low); 0; RecallCal(MED_SKM_High); RecallCal(MED_SKM_Mid); RecallCal(MED_SKM_Low)];
NEUMF_ = [RecallCal(S_NEUMF_High); RecallCal(S_NEUMF_Mid);0;RecallCal(M_NEUMF_High); RecallCal(M_NEUMF_Mid); RecallCal(M_NEUMF_Low); 0;RecallCal(MD_NEUMF_High); RecallCal(MD_NEUMF_Mid); RecallCal(MD_NEUMF_Low); 0; RecallCal(ME_NEUMF_High); RecallCal(ME_NEUMF_Mid); RecallCal(ME_NEUMF_Low); 0; RecallCal(DE_NEUMF_High); RecallCal(DE_NEUMF_Mid);RecallCal(DE_NEUMF_Low); 0; RecallCal(MED_NEUMF_High); RecallCal(MED_NEUMF_Mid); RecallCal(MED_NEUMF_Low)];
VAECF_ = [RecallCal(S_VAECF_High); RecallCal(S_VAECF_Mid);0;RecallCal(M_VAECF_High); RecallCal(M_VAECF_Mid); RecallCal(M_VAECF_Low); 0;RecallCal(MD_VAECF_High); RecallCal(MD_VAECF_Mid); RecallCal(MD_VAECF_Low); 0; RecallCal(ME_VAECF_High); RecallCal(ME_VAECF_Mid); RecallCal(ME_VAECF_Low); 0; RecallCal(DE_VAECF_High); RecallCal(DE_VAECF_Mid);RecallCal(DE_VAECF_Low); 0; RecallCal(MED_VAECF_High); RecallCal(MED_VAECF_Mid); RecallCal(MED_VAECF_Low)];

RecallTable=table(Group, Random_,ItemAVG_, MMMF_, WMF_, HPF_, IBPR_, WBPR_, SKM_, NEUMF_, VAECF_);
save Recall RecallTable

%% Table for TTEST of Recall values
Group=["Size-High/Mid"; "----"; "Mean-High/Mid"; "Mean-Mid/Low"; "----"; "MeanDev-High/Mid"; "MeanDev-Mid/Low"; "----"; "MeanEnt-High/Mid"; "MeanEnt-Mid/Low"; "----"; "DevEnt-High/Mid"; "DevEnt-Mid/Low"; "----"; "MeanDevEnt-High/Mid"; "MeanDevEnt-Mid/Low"];
Random_ = [RecallTest(S_Random_High,S_Random_Mid); 0;RecallTest(M_Random_High,M_Random_Mid);RecallTest(M_Random_Mid,M_Random_Low);0;RecallTest(MD_Random_High,MD_Random_Mid);RecallTest(MD_Random_Mid,MD_Random_Low);0;RecallTest(ME_Random_High,ME_Random_Mid);RecallTest(ME_Random_Mid,ME_Random_Low);0;RecallTest(DE_Random_High,DE_Random_Mid);RecallTest(DE_Random_Mid,DE_Random_Low);0;RecallTest(MED_Random_High,MED_Random_Mid);RecallTest(MED_Random_Mid,MED_Random_Low)];
ItemAVG_ = [RecallTest(S_ItemAVG_High,S_ItemAVG_Mid); 0;RecallTest(M_ItemAVG_High,M_ItemAVG_Mid);RecallTest(M_ItemAVG_Mid,M_ItemAVG_Low);0;RecallTest(MD_ItemAVG_High,MD_ItemAVG_Mid);RecallTest(MD_ItemAVG_Mid,MD_ItemAVG_Low);0;RecallTest(ME_ItemAVG_High,ME_ItemAVG_Mid);RecallTest(ME_ItemAVG_Mid,ME_ItemAVG_Low);0;RecallTest(DE_ItemAVG_High,DE_ItemAVG_Mid);RecallTest(DE_ItemAVG_Mid,DE_ItemAVG_Low);0;RecallTest(MED_ItemAVG_High,MED_ItemAVG_Mid);RecallTest(MED_ItemAVG_Mid,MED_ItemAVG_Low)];
MMMF_ = [RecallTest(S_MMMF_High,S_MMMF_Mid); 0;RecallTest(M_MMMF_High,M_MMMF_Mid);RecallTest(M_MMMF_Mid,M_MMMF_Low);0;RecallTest(MD_MMMF_High,MD_MMMF_Mid);RecallTest(MD_MMMF_Mid,MD_MMMF_Low);0;RecallTest(ME_MMMF_High,ME_MMMF_Mid);RecallTest(ME_MMMF_Mid,ME_MMMF_Low);0;RecallTest(DE_MMMF_High,DE_MMMF_Mid);RecallTest(DE_MMMF_Mid,DE_MMMF_Low);0;RecallTest(MED_MMMF_High,MED_MMMF_Mid);RecallTest(MED_MMMF_Mid,MED_MMMF_Low)];
WMF_ = [RecallTest(S_WMF_High,S_WMF_Mid); 0;RecallTest(M_WMF_High,M_WMF_Mid);RecallTest(M_WMF_Mid,M_WMF_Low);0;RecallTest(MD_WMF_High,MD_WMF_Mid);RecallTest(MD_WMF_Mid,MD_WMF_Low);0;RecallTest(ME_WMF_High,ME_WMF_Mid);RecallTest(ME_WMF_Mid,ME_WMF_Low);0;RecallTest(DE_WMF_High,DE_WMF_Mid);RecallTest(DE_WMF_Mid,DE_WMF_Low);0;RecallTest(MED_WMF_High,MED_WMF_Mid);RecallTest(MED_WMF_Mid,MED_WMF_Low)];
HPF_ = [RecallTest(S_HPF_High,S_HPF_Mid); 0;RecallTest(M_HPF_High,M_HPF_Mid);RecallTest(M_HPF_Mid,M_HPF_Low);0;RecallTest(MD_HPF_High,MD_HPF_Mid);RecallTest(MD_HPF_Mid,MD_HPF_Low);0;RecallTest(ME_HPF_High,ME_HPF_Mid);RecallTest(ME_HPF_Mid,ME_HPF_Low);0;RecallTest(DE_HPF_High,DE_HPF_Mid);RecallTest(DE_HPF_Mid,DE_HPF_Low);0;RecallTest(MED_HPF_High,MED_HPF_Mid);RecallTest(MED_HPF_Mid,MED_HPF_Low)];
IBPR_ = [RecallTest(S_IBPR_High,S_IBPR_Mid); 0;RecallTest(M_IBPR_High,M_IBPR_Mid);RecallTest(M_IBPR_Mid,M_IBPR_Low);0;RecallTest(MD_IBPR_High,MD_IBPR_Mid);RecallTest(MD_IBPR_Mid,MD_IBPR_Low);0;RecallTest(ME_IBPR_High,ME_IBPR_Mid);RecallTest(ME_IBPR_Mid,ME_IBPR_Low);0;RecallTest(DE_IBPR_High,DE_IBPR_Mid);RecallTest(DE_IBPR_Mid,DE_IBPR_Low);0;RecallTest(MED_IBPR_High,MED_IBPR_Mid);RecallTest(MED_IBPR_Mid,MED_IBPR_Low)];
WBPR_ = [RecallTest(S_WBPR_High,S_WBPR_Mid); 0;RecallTest(M_WBPR_High,M_WBPR_Mid);RecallTest(M_WBPR_Mid,M_WBPR_Low);0;RecallTest(MD_WBPR_High,MD_WBPR_Mid);RecallTest(MD_WBPR_Mid,MD_WBPR_Low);0;RecallTest(ME_WBPR_High,ME_WBPR_Mid);RecallTest(ME_WBPR_Mid,ME_WBPR_Low);0;RecallTest(DE_WBPR_High,DE_WBPR_Mid);RecallTest(DE_WBPR_Mid,DE_WBPR_Low);0;RecallTest(MED_WBPR_High,MED_WBPR_Mid);RecallTest(MED_WBPR_Mid,MED_WBPR_Low)];
SKM_ = [RecallTest(S_SKM_High,S_SKM_Mid); 0;RecallTest(M_SKM_High,M_SKM_Mid);RecallTest(M_SKM_Mid,M_SKM_Low);0;RecallTest(MD_SKM_High,MD_SKM_Mid);RecallTest(MD_SKM_Mid,MD_SKM_Low);0;RecallTest(ME_SKM_High,ME_SKM_Mid);RecallTest(ME_SKM_Mid,ME_SKM_Low);0;RecallTest(DE_SKM_High,DE_SKM_Mid);RecallTest(DE_SKM_Mid,DE_SKM_Low);0;RecallTest(MED_SKM_High,MED_SKM_Mid);RecallTest(MED_SKM_Mid,MED_SKM_Low)];
NEUMF_ = [RecallTest(S_NEUMF_High,S_NEUMF_Mid); 0;RecallTest(M_NEUMF_High,M_NEUMF_Mid);RecallTest(M_NEUMF_Mid,M_NEUMF_Low);0;RecallTest(MD_NEUMF_High,MD_NEUMF_Mid);RecallTest(MD_NEUMF_Mid,MD_NEUMF_Low);0;RecallTest(ME_NEUMF_High,ME_NEUMF_Mid);RecallTest(ME_NEUMF_Mid,ME_NEUMF_Low);0;RecallTest(DE_NEUMF_High,DE_NEUMF_Mid);RecallTest(DE_NEUMF_Mid,DE_NEUMF_Low);0;RecallTest(MED_NEUMF_High,MED_NEUMF_Mid);RecallTest(MED_NEUMF_Mid,MED_NEUMF_Low)];
VAECF_ = [RecallTest(S_VAECF_High,S_VAECF_Mid); 0;RecallTest(M_VAECF_High,M_VAECF_Mid);RecallTest(M_VAECF_Mid,M_VAECF_Low);0;RecallTest(MD_VAECF_High,MD_VAECF_Mid);RecallTest(MD_VAECF_Mid,MD_VAECF_Low);0;RecallTest(ME_VAECF_High,ME_VAECF_Mid);RecallTest(ME_VAECF_Mid,ME_VAECF_Low);0;RecallTest(DE_VAECF_High,DE_VAECF_Mid);RecallTest(DE_VAECF_Mid,DE_VAECF_Low);0;RecallTest(MED_VAECF_High,MED_VAECF_Mid);RecallTest(MED_VAECF_Mid,MED_VAECF_Low)];

RecallTTest=table(Group, Random_,ItemAVG_, MMMF_, WMF_, HPF_, IBPR_, WBPR_, SKM_, NEUMF_, VAECF_);
save RecallTTest RecallTTest



%% Table for APLT values
Group=["Size-High"; "Size-Mid";"----"; "Mean-High"; "Mean-Mid"; "Mean-Low"; "----"; "MeanDev-High"; "MeanDev-Mid"; "MeanDev-Low"; "----"; "MeanEnt-High"; "MeanEnt-Mid"; "MeanEnt-Low"; "----"; "DevEnt-High"; "DevEnt-Mid"; "DevEnt-Low"; "----"; "MeanDevEnt-High"; "MeanDevEnt-Mid"; "MeanDevEnt-Low"];
Random_ = [APLTCal(S_Random_High); APLTCal(S_Random_Mid);0;APLTCal(M_Random_High); APLTCal(M_Random_Mid); APLTCal(M_Random_Low); 0;APLTCal(MD_Random_High); APLTCal(MD_Random_Mid); APLTCal(MD_Random_Low); 0; APLTCal(ME_Random_High); APLTCal(ME_Random_Mid); APLTCal(ME_Random_Low); 0; APLTCal(DE_Random_High); APLTCal(DE_Random_Mid);APLTCal(DE_Random_Low); 0; APLTCal(MED_Random_High); APLTCal(MED_Random_Mid); APLTCal(MED_Random_Low)];
ItemAVG_ = [APLTCal(S_ItemAVG_High); APLTCal(S_ItemAVG_Mid);0;APLTCal(M_ItemAVG_High); APLTCal(M_ItemAVG_Mid); APLTCal(M_ItemAVG_Low); 0;APLTCal(MD_ItemAVG_High); APLTCal(MD_ItemAVG_Mid); APLTCal(MD_ItemAVG_Low); 0; APLTCal(ME_ItemAVG_High); APLTCal(ME_ItemAVG_Mid); APLTCal(ME_ItemAVG_Low); 0; APLTCal(DE_ItemAVG_High); APLTCal(DE_ItemAVG_Mid);APLTCal(DE_ItemAVG_Low); 0; APLTCal(MED_ItemAVG_High); APLTCal(MED_ItemAVG_Mid); APLTCal(MED_ItemAVG_Low)];
MMMF_ = [APLTCal(S_MMMF_High); APLTCal(S_MMMF_Mid);0;APLTCal(M_MMMF_High); APLTCal(M_MMMF_Mid); APLTCal(M_MMMF_Low); 0;APLTCal(MD_MMMF_High); APLTCal(MD_MMMF_Mid); APLTCal(MD_MMMF_Low); 0; APLTCal(ME_MMMF_High); APLTCal(ME_MMMF_Mid); APLTCal(ME_MMMF_Low); 0; APLTCal(DE_MMMF_High); APLTCal(DE_MMMF_Mid);APLTCal(DE_MMMF_Low); 0; APLTCal(MED_MMMF_High); APLTCal(MED_MMMF_Mid); APLTCal(MED_MMMF_Low)];
WMF_ = [APLTCal(S_WMF_High); APLTCal(S_WMF_Mid);0;APLTCal(M_WMF_High); APLTCal(M_WMF_Mid); APLTCal(M_WMF_Low); 0;APLTCal(MD_WMF_High); APLTCal(MD_WMF_Mid); APLTCal(MD_WMF_Low); 0; APLTCal(ME_WMF_High); APLTCal(ME_WMF_Mid); APLTCal(ME_WMF_Low); 0; APLTCal(DE_WMF_High); APLTCal(DE_WMF_Mid);APLTCal(DE_WMF_Low); 0; APLTCal(MED_WMF_High); APLTCal(MED_WMF_Mid); APLTCal(MED_WMF_Low)];
HPF_ = [APLTCal(S_HPF_High); APLTCal(S_HPF_Mid);0;APLTCal(M_HPF_High); APLTCal(M_HPF_Mid); APLTCal(M_HPF_Low); 0;APLTCal(MD_HPF_High); APLTCal(MD_HPF_Mid); APLTCal(MD_HPF_Low); 0; APLTCal(ME_HPF_High); APLTCal(ME_HPF_Mid); APLTCal(ME_HPF_Low); 0; APLTCal(DE_HPF_High); APLTCal(DE_HPF_Mid);APLTCal(DE_HPF_Low); 0; APLTCal(MED_HPF_High); APLTCal(MED_HPF_Mid); APLTCal(MED_HPF_Low)];
IBPR_ = [APLTCal(S_IBPR_High); APLTCal(S_IBPR_Mid);0;APLTCal(M_IBPR_High); APLTCal(M_IBPR_Mid); APLTCal(M_IBPR_Low); 0;APLTCal(MD_IBPR_High); APLTCal(MD_IBPR_Mid); APLTCal(MD_IBPR_Low); 0; APLTCal(ME_IBPR_High); APLTCal(ME_IBPR_Mid); APLTCal(ME_IBPR_Low); 0; APLTCal(DE_IBPR_High); APLTCal(DE_IBPR_Mid);APLTCal(DE_IBPR_Low); 0; APLTCal(MED_IBPR_High); APLTCal(MED_IBPR_Mid); APLTCal(MED_IBPR_Low)];
WBPR_ = [APLTCal(S_WBPR_High); APLTCal(S_WBPR_Mid);0;APLTCal(M_WBPR_High); APLTCal(M_WBPR_Mid); APLTCal(M_WBPR_Low); 0;APLTCal(MD_WBPR_High); APLTCal(MD_WBPR_Mid); APLTCal(MD_WBPR_Low); 0; APLTCal(ME_WBPR_High); APLTCal(ME_WBPR_Mid); APLTCal(ME_WBPR_Low); 0; APLTCal(DE_WBPR_High); APLTCal(DE_WBPR_Mid);APLTCal(DE_WBPR_Low); 0; APLTCal(MED_WBPR_High); APLTCal(MED_WBPR_Mid); APLTCal(MED_WBPR_Low)];
SKM_ = [APLTCal(S_SKM_High); APLTCal(S_SKM_Mid);0;APLTCal(M_SKM_High); APLTCal(M_SKM_Mid); APLTCal(M_SKM_Low); 0;APLTCal(MD_SKM_High); APLTCal(MD_SKM_Mid); APLTCal(MD_SKM_Low); 0; APLTCal(ME_SKM_High); APLTCal(ME_SKM_Mid); APLTCal(ME_SKM_Low); 0; APLTCal(DE_SKM_High); APLTCal(DE_SKM_Mid);APLTCal(DE_SKM_Low); 0; APLTCal(MED_SKM_High); APLTCal(MED_SKM_Mid); APLTCal(MED_SKM_Low)];
NEUMF_ = [APLTCal(S_NEUMF_High); APLTCal(S_NEUMF_Mid);0;APLTCal(M_NEUMF_High); APLTCal(M_NEUMF_Mid); APLTCal(M_NEUMF_Low); 0;APLTCal(MD_NEUMF_High); APLTCal(MD_NEUMF_Mid); APLTCal(MD_NEUMF_Low); 0; APLTCal(ME_NEUMF_High); APLTCal(ME_NEUMF_Mid); APLTCal(ME_NEUMF_Low); 0; APLTCal(DE_NEUMF_High); APLTCal(DE_NEUMF_Mid);APLTCal(DE_NEUMF_Low); 0; APLTCal(MED_NEUMF_High); APLTCal(MED_NEUMF_Mid); APLTCal(MED_NEUMF_Low)];
VAECF_ = [APLTCal(S_VAECF_High); APLTCal(S_VAECF_Mid);0;APLTCal(M_VAECF_High); APLTCal(M_VAECF_Mid); APLTCal(M_VAECF_Low); 0;APLTCal(MD_VAECF_High); APLTCal(MD_VAECF_Mid); APLTCal(MD_VAECF_Low); 0; APLTCal(ME_VAECF_High); APLTCal(ME_VAECF_Mid); APLTCal(ME_VAECF_Low); 0; APLTCal(DE_VAECF_High); APLTCal(DE_VAECF_Mid);APLTCal(DE_VAECF_Low); 0; APLTCal(MED_VAECF_High); APLTCal(MED_VAECF_Mid); APLTCal(MED_VAECF_Low)];

APLTTable=table(Group, Random_,ItemAVG_, MMMF_, WMF_, HPF_, IBPR_, WBPR_, SKM_, NEUMF_, VAECF_);
save APLT APLTTable

%% Table for TTEST of APLT values
Group=["Size-High/Mid"; "----"; "Mean-High/Mid"; "Mean-Mid/Low"; "----"; "MeanDev-High/Mid"; "MeanDev-Mid/Low"; "----"; "MeanEnt-High/Mid"; "MeanEnt-Mid/Low"; "----"; "DevEnt-High/Mid"; "DevEnt-Mid/Low"; "----"; "MeanDevEnt-High/Mid"; "MeanDevEnt-Mid/Low"];
Random_ = [APLTTest(S_Random_High,S_Random_Mid); 0;APLTTest(M_Random_High,M_Random_Mid);APLTTest(M_Random_Mid,M_Random_Low);0;APLTTest(MD_Random_High,MD_Random_Mid);APLTTest(MD_Random_Mid,MD_Random_Low);0;APLTTest(ME_Random_High,ME_Random_Mid);APLTTest(ME_Random_Mid,ME_Random_Low);0;APLTTest(DE_Random_High,DE_Random_Mid);APLTTest(DE_Random_Mid,DE_Random_Low);0;APLTTest(MED_Random_High,MED_Random_Mid);APLTTest(MED_Random_Mid,MED_Random_Low)];
ItemAVG_ = [APLTTest(S_ItemAVG_High,S_ItemAVG_Mid); 0;APLTTest(M_ItemAVG_High,M_ItemAVG_Mid);APLTTest(M_ItemAVG_Mid,M_ItemAVG_Low);0;APLTTest(MD_ItemAVG_High,MD_ItemAVG_Mid);APLTTest(MD_ItemAVG_Mid,MD_ItemAVG_Low);0;APLTTest(ME_ItemAVG_High,ME_ItemAVG_Mid);APLTTest(ME_ItemAVG_Mid,ME_ItemAVG_Low);0;APLTTest(DE_ItemAVG_High,DE_ItemAVG_Mid);APLTTest(DE_ItemAVG_Mid,DE_ItemAVG_Low);0;APLTTest(MED_ItemAVG_High,MED_ItemAVG_Mid);APLTTest(MED_ItemAVG_Mid,MED_ItemAVG_Low)];
MMMF_ = [APLTTest(S_MMMF_High,S_MMMF_Mid); 0;APLTTest(M_MMMF_High,M_MMMF_Mid);APLTTest(M_MMMF_Mid,M_MMMF_Low);0;APLTTest(MD_MMMF_High,MD_MMMF_Mid);APLTTest(MD_MMMF_Mid,MD_MMMF_Low);0;APLTTest(ME_MMMF_High,ME_MMMF_Mid);APLTTest(ME_MMMF_Mid,ME_MMMF_Low);0;APLTTest(DE_MMMF_High,DE_MMMF_Mid);APLTTest(DE_MMMF_Mid,DE_MMMF_Low);0;APLTTest(MED_MMMF_High,MED_MMMF_Mid);APLTTest(MED_MMMF_Mid,MED_MMMF_Low)];
WMF_ = [APLTTest(S_WMF_High,S_WMF_Mid); 0;APLTTest(M_WMF_High,M_WMF_Mid);APLTTest(M_WMF_Mid,M_WMF_Low);0;APLTTest(MD_WMF_High,MD_WMF_Mid);APLTTest(MD_WMF_Mid,MD_WMF_Low);0;APLTTest(ME_WMF_High,ME_WMF_Mid);APLTTest(ME_WMF_Mid,ME_WMF_Low);0;APLTTest(DE_WMF_High,DE_WMF_Mid);APLTTest(DE_WMF_Mid,DE_WMF_Low);0;APLTTest(MED_WMF_High,MED_WMF_Mid);APLTTest(MED_WMF_Mid,MED_WMF_Low)];
HPF_ = [APLTTest(S_HPF_High,S_HPF_Mid); 0;APLTTest(M_HPF_High,M_HPF_Mid);APLTTest(M_HPF_Mid,M_HPF_Low);0;APLTTest(MD_HPF_High,MD_HPF_Mid);APLTTest(MD_HPF_Mid,MD_HPF_Low);0;APLTTest(ME_HPF_High,ME_HPF_Mid);APLTTest(ME_HPF_Mid,ME_HPF_Low);0;APLTTest(DE_HPF_High,DE_HPF_Mid);APLTTest(DE_HPF_Mid,DE_HPF_Low);0;APLTTest(MED_HPF_High,MED_HPF_Mid);APLTTest(MED_HPF_Mid,MED_HPF_Low)];
IBPR_ = [APLTTest(S_IBPR_High,S_IBPR_Mid); 0;APLTTest(M_IBPR_High,M_IBPR_Mid);APLTTest(M_IBPR_Mid,M_IBPR_Low);0;APLTTest(MD_IBPR_High,MD_IBPR_Mid);APLTTest(MD_IBPR_Mid,MD_IBPR_Low);0;APLTTest(ME_IBPR_High,ME_IBPR_Mid);APLTTest(ME_IBPR_Mid,ME_IBPR_Low);0;APLTTest(DE_IBPR_High,DE_IBPR_Mid);APLTTest(DE_IBPR_Mid,DE_IBPR_Low);0;APLTTest(MED_IBPR_High,MED_IBPR_Mid);APLTTest(MED_IBPR_Mid,MED_IBPR_Low)];
WBPR_ = [APLTTest(S_WBPR_High,S_WBPR_Mid); 0;APLTTest(M_WBPR_High,M_WBPR_Mid);APLTTest(M_WBPR_Mid,M_WBPR_Low);0;APLTTest(MD_WBPR_High,MD_WBPR_Mid);APLTTest(MD_WBPR_Mid,MD_WBPR_Low);0;APLTTest(ME_WBPR_High,ME_WBPR_Mid);APLTTest(ME_WBPR_Mid,ME_WBPR_Low);0;APLTTest(DE_WBPR_High,DE_WBPR_Mid);APLTTest(DE_WBPR_Mid,DE_WBPR_Low);0;APLTTest(MED_WBPR_High,MED_WBPR_Mid);APLTTest(MED_WBPR_Mid,MED_WBPR_Low)];
SKM_ = [APLTTest(S_SKM_High,S_SKM_Mid); 0;APLTTest(M_SKM_High,M_SKM_Mid);APLTTest(M_SKM_Mid,M_SKM_Low);0;APLTTest(MD_SKM_High,MD_SKM_Mid);APLTTest(MD_SKM_Mid,MD_SKM_Low);0;APLTTest(ME_SKM_High,ME_SKM_Mid);APLTTest(ME_SKM_Mid,ME_SKM_Low);0;APLTTest(DE_SKM_High,DE_SKM_Mid);APLTTest(DE_SKM_Mid,DE_SKM_Low);0;APLTTest(MED_SKM_High,MED_SKM_Mid);APLTTest(MED_SKM_Mid,MED_SKM_Low)];
NEUMF_ = [APLTTest(S_NEUMF_High,S_NEUMF_Mid); 0;APLTTest(M_NEUMF_High,M_NEUMF_Mid);APLTTest(M_NEUMF_Mid,M_NEUMF_Low);0;APLTTest(MD_NEUMF_High,MD_NEUMF_Mid);APLTTest(MD_NEUMF_Mid,MD_NEUMF_Low);0;APLTTest(ME_NEUMF_High,ME_NEUMF_Mid);APLTTest(ME_NEUMF_Mid,ME_NEUMF_Low);0;APLTTest(DE_NEUMF_High,DE_NEUMF_Mid);APLTTest(DE_NEUMF_Mid,DE_NEUMF_Low);0;APLTTest(MED_NEUMF_High,MED_NEUMF_Mid);APLTTest(MED_NEUMF_Mid,MED_NEUMF_Low)];
VAECF_ = [APLTTest(S_VAECF_High,S_VAECF_Mid); 0;APLTTest(M_VAECF_High,M_VAECF_Mid);APLTTest(M_VAECF_Mid,M_VAECF_Low);0;APLTTest(MD_VAECF_High,MD_VAECF_Mid);APLTTest(MD_VAECF_Mid,MD_VAECF_Low);0;APLTTest(ME_VAECF_High,ME_VAECF_Mid);APLTTest(ME_VAECF_Mid,ME_VAECF_Low);0;APLTTest(DE_VAECF_High,DE_VAECF_Mid);APLTTest(DE_VAECF_Mid,DE_VAECF_Low);0;APLTTest(MED_VAECF_High,MED_VAECF_Mid);APLTTest(MED_VAECF_Mid,MED_VAECF_Low)];

APLTTTest=table(Group, Random_,ItemAVG_, MMMF_, WMF_, HPF_, IBPR_, WBPR_, SKM_, NEUMF_, VAECF_);
save APLTTTest APLTTTest



%% Table for Novelty values
Group=["Size-High"; "Size-Mid";"----"; "Mean-High"; "Mean-Mid"; "Mean-Low"; "----"; "MeanDev-High"; "MeanDev-Mid"; "MeanDev-Low"; "----"; "MeanEnt-High"; "MeanEnt-Mid"; "MeanEnt-Low"; "----"; "DevEnt-High"; "DevEnt-Mid"; "DevEnt-Low"; "----"; "MeanDevEnt-High"; "MeanDevEnt-Mid"; "MeanDevEnt-Low"];
Random_ = [NoveltyCal(S_Random_High); NoveltyCal(S_Random_Mid);0;NoveltyCal(M_Random_High); NoveltyCal(M_Random_Mid); NoveltyCal(M_Random_Low); 0;NoveltyCal(MD_Random_High); NoveltyCal(MD_Random_Mid); NoveltyCal(MD_Random_Low); 0; NoveltyCal(ME_Random_High); NoveltyCal(ME_Random_Mid); NoveltyCal(ME_Random_Low); 0; NoveltyCal(DE_Random_High); NoveltyCal(DE_Random_Mid);NoveltyCal(DE_Random_Low); 0; NoveltyCal(MED_Random_High); NoveltyCal(MED_Random_Mid); NoveltyCal(MED_Random_Low)];
ItemAVG_ = [NoveltyCal(S_ItemAVG_High); NoveltyCal(S_ItemAVG_Mid);0;NoveltyCal(M_ItemAVG_High); NoveltyCal(M_ItemAVG_Mid); NoveltyCal(M_ItemAVG_Low); 0;NoveltyCal(MD_ItemAVG_High); NoveltyCal(MD_ItemAVG_Mid); NoveltyCal(MD_ItemAVG_Low); 0; NoveltyCal(ME_ItemAVG_High); NoveltyCal(ME_ItemAVG_Mid); NoveltyCal(ME_ItemAVG_Low); 0; NoveltyCal(DE_ItemAVG_High); NoveltyCal(DE_ItemAVG_Mid);NoveltyCal(DE_ItemAVG_Low); 0; NoveltyCal(MED_ItemAVG_High); NoveltyCal(MED_ItemAVG_Mid); NoveltyCal(MED_ItemAVG_Low)];
MMMF_ = [NoveltyCal(S_MMMF_High); NoveltyCal(S_MMMF_Mid);0;NoveltyCal(M_MMMF_High); NoveltyCal(M_MMMF_Mid); NoveltyCal(M_MMMF_Low); 0;NoveltyCal(MD_MMMF_High); NoveltyCal(MD_MMMF_Mid); NoveltyCal(MD_MMMF_Low); 0; NoveltyCal(ME_MMMF_High); NoveltyCal(ME_MMMF_Mid); NoveltyCal(ME_MMMF_Low); 0; NoveltyCal(DE_MMMF_High); NoveltyCal(DE_MMMF_Mid);NoveltyCal(DE_MMMF_Low); 0; NoveltyCal(MED_MMMF_High); NoveltyCal(MED_MMMF_Mid); NoveltyCal(MED_MMMF_Low)];
WMF_ = [NoveltyCal(S_WMF_High); NoveltyCal(S_WMF_Mid);0;NoveltyCal(M_WMF_High); NoveltyCal(M_WMF_Mid); NoveltyCal(M_WMF_Low); 0;NoveltyCal(MD_WMF_High); NoveltyCal(MD_WMF_Mid); NoveltyCal(MD_WMF_Low); 0; NoveltyCal(ME_WMF_High); NoveltyCal(ME_WMF_Mid); NoveltyCal(ME_WMF_Low); 0; NoveltyCal(DE_WMF_High); NoveltyCal(DE_WMF_Mid);NoveltyCal(DE_WMF_Low); 0; NoveltyCal(MED_WMF_High); NoveltyCal(MED_WMF_Mid); NoveltyCal(MED_WMF_Low)];
HPF_ = [NoveltyCal(S_HPF_High); NoveltyCal(S_HPF_Mid);0;NoveltyCal(M_HPF_High); NoveltyCal(M_HPF_Mid); NoveltyCal(M_HPF_Low); 0;NoveltyCal(MD_HPF_High); NoveltyCal(MD_HPF_Mid); NoveltyCal(MD_HPF_Low); 0; NoveltyCal(ME_HPF_High); NoveltyCal(ME_HPF_Mid); NoveltyCal(ME_HPF_Low); 0; NoveltyCal(DE_HPF_High); NoveltyCal(DE_HPF_Mid);NoveltyCal(DE_HPF_Low); 0; NoveltyCal(MED_HPF_High); NoveltyCal(MED_HPF_Mid); NoveltyCal(MED_HPF_Low)];
IBPR_ = [NoveltyCal(S_IBPR_High); NoveltyCal(S_IBPR_Mid);0;NoveltyCal(M_IBPR_High); NoveltyCal(M_IBPR_Mid); NoveltyCal(M_IBPR_Low); 0;NoveltyCal(MD_IBPR_High); NoveltyCal(MD_IBPR_Mid); NoveltyCal(MD_IBPR_Low); 0; NoveltyCal(ME_IBPR_High); NoveltyCal(ME_IBPR_Mid); NoveltyCal(ME_IBPR_Low); 0; NoveltyCal(DE_IBPR_High); NoveltyCal(DE_IBPR_Mid);NoveltyCal(DE_IBPR_Low); 0; NoveltyCal(MED_IBPR_High); NoveltyCal(MED_IBPR_Mid); NoveltyCal(MED_IBPR_Low)];
WBPR_ = [NoveltyCal(S_WBPR_High); NoveltyCal(S_WBPR_Mid);0;NoveltyCal(M_WBPR_High); NoveltyCal(M_WBPR_Mid); NoveltyCal(M_WBPR_Low); 0;NoveltyCal(MD_WBPR_High); NoveltyCal(MD_WBPR_Mid); NoveltyCal(MD_WBPR_Low); 0; NoveltyCal(ME_WBPR_High); NoveltyCal(ME_WBPR_Mid); NoveltyCal(ME_WBPR_Low); 0; NoveltyCal(DE_WBPR_High); NoveltyCal(DE_WBPR_Mid);NoveltyCal(DE_WBPR_Low); 0; NoveltyCal(MED_WBPR_High); NoveltyCal(MED_WBPR_Mid); NoveltyCal(MED_WBPR_Low)];
SKM_ = [NoveltyCal(S_SKM_High); NoveltyCal(S_SKM_Mid);0;NoveltyCal(M_SKM_High); NoveltyCal(M_SKM_Mid); NoveltyCal(M_SKM_Low); 0;NoveltyCal(MD_SKM_High); NoveltyCal(MD_SKM_Mid); NoveltyCal(MD_SKM_Low); 0; NoveltyCal(ME_SKM_High); NoveltyCal(ME_SKM_Mid); NoveltyCal(ME_SKM_Low); 0; NoveltyCal(DE_SKM_High); NoveltyCal(DE_SKM_Mid);NoveltyCal(DE_SKM_Low); 0; NoveltyCal(MED_SKM_High); NoveltyCal(MED_SKM_Mid); NoveltyCal(MED_SKM_Low)];
NEUMF_ = [NoveltyCal(S_NEUMF_High); NoveltyCal(S_NEUMF_Mid);0;NoveltyCal(M_NEUMF_High); NoveltyCal(M_NEUMF_Mid); NoveltyCal(M_NEUMF_Low); 0;NoveltyCal(MD_NEUMF_High); NoveltyCal(MD_NEUMF_Mid); NoveltyCal(MD_NEUMF_Low); 0; NoveltyCal(ME_NEUMF_High); NoveltyCal(ME_NEUMF_Mid); NoveltyCal(ME_NEUMF_Low); 0; NoveltyCal(DE_NEUMF_High); NoveltyCal(DE_NEUMF_Mid);NoveltyCal(DE_NEUMF_Low); 0; NoveltyCal(MED_NEUMF_High); NoveltyCal(MED_NEUMF_Mid); NoveltyCal(MED_NEUMF_Low)];
VAECF_ = [NoveltyCal(S_VAECF_High); NoveltyCal(S_VAECF_Mid);0;NoveltyCal(M_VAECF_High); NoveltyCal(M_VAECF_Mid); NoveltyCal(M_VAECF_Low); 0;NoveltyCal(MD_VAECF_High); NoveltyCal(MD_VAECF_Mid); NoveltyCal(MD_VAECF_Low); 0; NoveltyCal(ME_VAECF_High); NoveltyCal(ME_VAECF_Mid); NoveltyCal(ME_VAECF_Low); 0; NoveltyCal(DE_VAECF_High); NoveltyCal(DE_VAECF_Mid);NoveltyCal(DE_VAECF_Low); 0; NoveltyCal(MED_VAECF_High); NoveltyCal(MED_VAECF_Mid); NoveltyCal(MED_VAECF_Low)];

NoveltyTable=table(Group, Random_,ItemAVG_, MMMF_, WMF_, HPF_, IBPR_, WBPR_, SKM_, NEUMF_, VAECF_);
save Novelty NoveltyTable

%% Table for TTEST of Novelty values
Group=["Size-High/Mid"; "----"; "Mean-High/Mid"; "Mean-Mid/Low"; "----"; "MeanDev-High/Mid"; "MeanDev-Mid/Low"; "----"; "MeanEnt-High/Mid"; "MeanEnt-Mid/Low"; "----"; "DevEnt-High/Mid"; "DevEnt-Mid/Low"; "----"; "MeanDevEnt-High/Mid"; "MeanDevEnt-Mid/Low"];
Random_ = [NoveltyTest(S_Random_High,S_Random_Mid); 0;NoveltyTest(M_Random_High,M_Random_Mid);NoveltyTest(M_Random_Mid,M_Random_Low);0;NoveltyTest(MD_Random_High,MD_Random_Mid);NoveltyTest(MD_Random_Mid,MD_Random_Low);0;NoveltyTest(ME_Random_High,ME_Random_Mid);NoveltyTest(ME_Random_Mid,ME_Random_Low);0;NoveltyTest(DE_Random_High,DE_Random_Mid);NoveltyTest(DE_Random_Mid,DE_Random_Low);0;NoveltyTest(MED_Random_High,MED_Random_Mid);NoveltyTest(MED_Random_Mid,MED_Random_Low)];
ItemAVG_ = [NoveltyTest(S_ItemAVG_High,S_ItemAVG_Mid); 0;NoveltyTest(M_ItemAVG_High,M_ItemAVG_Mid);NoveltyTest(M_ItemAVG_Mid,M_ItemAVG_Low);0;NoveltyTest(MD_ItemAVG_High,MD_ItemAVG_Mid);NoveltyTest(MD_ItemAVG_Mid,MD_ItemAVG_Low);0;NoveltyTest(ME_ItemAVG_High,ME_ItemAVG_Mid);NoveltyTest(ME_ItemAVG_Mid,ME_ItemAVG_Low);0;NoveltyTest(DE_ItemAVG_High,DE_ItemAVG_Mid);NoveltyTest(DE_ItemAVG_Mid,DE_ItemAVG_Low);0;NoveltyTest(MED_ItemAVG_High,MED_ItemAVG_Mid);NoveltyTest(MED_ItemAVG_Mid,MED_ItemAVG_Low)];
MMMF_ = [NoveltyTest(S_MMMF_High,S_MMMF_Mid); 0;NoveltyTest(M_MMMF_High,M_MMMF_Mid);NoveltyTest(M_MMMF_Mid,M_MMMF_Low);0;NoveltyTest(MD_MMMF_High,MD_MMMF_Mid);NoveltyTest(MD_MMMF_Mid,MD_MMMF_Low);0;NoveltyTest(ME_MMMF_High,ME_MMMF_Mid);NoveltyTest(ME_MMMF_Mid,ME_MMMF_Low);0;NoveltyTest(DE_MMMF_High,DE_MMMF_Mid);NoveltyTest(DE_MMMF_Mid,DE_MMMF_Low);0;NoveltyTest(MED_MMMF_High,MED_MMMF_Mid);NoveltyTest(MED_MMMF_Mid,MED_MMMF_Low)];
WMF_ = [NoveltyTest(S_WMF_High,S_WMF_Mid); 0;NoveltyTest(M_WMF_High,M_WMF_Mid);NoveltyTest(M_WMF_Mid,M_WMF_Low);0;NoveltyTest(MD_WMF_High,MD_WMF_Mid);NoveltyTest(MD_WMF_Mid,MD_WMF_Low);0;NoveltyTest(ME_WMF_High,ME_WMF_Mid);NoveltyTest(ME_WMF_Mid,ME_WMF_Low);0;NoveltyTest(DE_WMF_High,DE_WMF_Mid);NoveltyTest(DE_WMF_Mid,DE_WMF_Low);0;NoveltyTest(MED_WMF_High,MED_WMF_Mid);NoveltyTest(MED_WMF_Mid,MED_WMF_Low)];
HPF_ = [NoveltyTest(S_HPF_High,S_HPF_Mid); 0;NoveltyTest(M_HPF_High,M_HPF_Mid);NoveltyTest(M_HPF_Mid,M_HPF_Low);0;NoveltyTest(MD_HPF_High,MD_HPF_Mid);NoveltyTest(MD_HPF_Mid,MD_HPF_Low);0;NoveltyTest(ME_HPF_High,ME_HPF_Mid);NoveltyTest(ME_HPF_Mid,ME_HPF_Low);0;NoveltyTest(DE_HPF_High,DE_HPF_Mid);NoveltyTest(DE_HPF_Mid,DE_HPF_Low);0;NoveltyTest(MED_HPF_High,MED_HPF_Mid);NoveltyTest(MED_HPF_Mid,MED_HPF_Low)];
IBPR_ = [NoveltyTest(S_IBPR_High,S_IBPR_Mid); 0;NoveltyTest(M_IBPR_High,M_IBPR_Mid);NoveltyTest(M_IBPR_Mid,M_IBPR_Low);0;NoveltyTest(MD_IBPR_High,MD_IBPR_Mid);NoveltyTest(MD_IBPR_Mid,MD_IBPR_Low);0;NoveltyTest(ME_IBPR_High,ME_IBPR_Mid);NoveltyTest(ME_IBPR_Mid,ME_IBPR_Low);0;NoveltyTest(DE_IBPR_High,DE_IBPR_Mid);NoveltyTest(DE_IBPR_Mid,DE_IBPR_Low);0;NoveltyTest(MED_IBPR_High,MED_IBPR_Mid);NoveltyTest(MED_IBPR_Mid,MED_IBPR_Low)];
WBPR_ = [NoveltyTest(S_WBPR_High,S_WBPR_Mid); 0;NoveltyTest(M_WBPR_High,M_WBPR_Mid);NoveltyTest(M_WBPR_Mid,M_WBPR_Low);0;NoveltyTest(MD_WBPR_High,MD_WBPR_Mid);NoveltyTest(MD_WBPR_Mid,MD_WBPR_Low);0;NoveltyTest(ME_WBPR_High,ME_WBPR_Mid);NoveltyTest(ME_WBPR_Mid,ME_WBPR_Low);0;NoveltyTest(DE_WBPR_High,DE_WBPR_Mid);NoveltyTest(DE_WBPR_Mid,DE_WBPR_Low);0;NoveltyTest(MED_WBPR_High,MED_WBPR_Mid);NoveltyTest(MED_WBPR_Mid,MED_WBPR_Low)];
SKM_ = [NoveltyTest(S_SKM_High,S_SKM_Mid); 0;NoveltyTest(M_SKM_High,M_SKM_Mid);NoveltyTest(M_SKM_Mid,M_SKM_Low);0;NoveltyTest(MD_SKM_High,MD_SKM_Mid);NoveltyTest(MD_SKM_Mid,MD_SKM_Low);0;NoveltyTest(ME_SKM_High,ME_SKM_Mid);NoveltyTest(ME_SKM_Mid,ME_SKM_Low);0;NoveltyTest(DE_SKM_High,DE_SKM_Mid);NoveltyTest(DE_SKM_Mid,DE_SKM_Low);0;NoveltyTest(MED_SKM_High,MED_SKM_Mid);NoveltyTest(MED_SKM_Mid,MED_SKM_Low)];
NEUMF_ = [NoveltyTest(S_NEUMF_High,S_NEUMF_Mid); 0;NoveltyTest(M_NEUMF_High,M_NEUMF_Mid);NoveltyTest(M_NEUMF_Mid,M_NEUMF_Low);0;NoveltyTest(MD_NEUMF_High,MD_NEUMF_Mid);NoveltyTest(MD_NEUMF_Mid,MD_NEUMF_Low);0;NoveltyTest(ME_NEUMF_High,ME_NEUMF_Mid);NoveltyTest(ME_NEUMF_Mid,ME_NEUMF_Low);0;NoveltyTest(DE_NEUMF_High,DE_NEUMF_Mid);NoveltyTest(DE_NEUMF_Mid,DE_NEUMF_Low);0;NoveltyTest(MED_NEUMF_High,MED_NEUMF_Mid);NoveltyTest(MED_NEUMF_Mid,MED_NEUMF_Low)];
VAECF_ = [NoveltyTest(S_VAECF_High,S_VAECF_Mid); 0;NoveltyTest(M_VAECF_High,M_VAECF_Mid);NoveltyTest(M_VAECF_Mid,M_VAECF_Low);0;NoveltyTest(MD_VAECF_High,MD_VAECF_Mid);NoveltyTest(MD_VAECF_Mid,MD_VAECF_Low);0;NoveltyTest(ME_VAECF_High,ME_VAECF_Mid);NoveltyTest(ME_VAECF_Mid,ME_VAECF_Low);0;NoveltyTest(DE_VAECF_High,DE_VAECF_Mid);NoveltyTest(DE_VAECF_Mid,DE_VAECF_Low);0;NoveltyTest(MED_VAECF_High,MED_VAECF_Mid);NoveltyTest(MED_VAECF_Mid,MED_VAECF_Low)];

NoveltyTTest=table(Group, Random_,ItemAVG_, MMMF_, WMF_, HPF_, IBPR_, WBPR_, SKM_, NEUMF_, VAECF_);
save NoveltyTTest NoveltyTTest


%% Table for F1 values
Group=["Size-High"; "Size-Mid";"----"; "Mean-High"; "Mean-Mid"; "Mean-Low"; "----"; "MeanDev-High"; "MeanDev-Mid"; "MeanDev-Low"; "----"; "MeanEnt-High"; "MeanEnt-Mid"; "MeanEnt-Low"; "----"; "DevEnt-High"; "DevEnt-Mid"; "DevEnt-Low"; "----"; "MeanDevEnt-High"; "MeanDevEnt-Mid"; "MeanDevEnt-Low"];

Random_ = [F1Cal(S_Random_High); F1Cal(S_Random_Mid);0;F1Cal(M_Random_High); F1Cal(M_Random_Mid); F1Cal(M_Random_Low); 0;F1Cal(MD_Random_High); F1Cal(MD_Random_Mid); F1Cal(MD_Random_Low); 0; F1Cal(ME_Random_High); F1Cal(ME_Random_Mid); F1Cal(ME_Random_Low); 0; F1Cal(DE_Random_High); F1Cal(DE_Random_Mid);F1Cal(DE_Random_Low); 0; F1Cal(MED_Random_High); F1Cal(MED_Random_Mid); F1Cal(MED_Random_Low)];
ItemAVG_ = [F1Cal(S_ItemAVG_High); F1Cal(S_ItemAVG_Mid);0;F1Cal(M_ItemAVG_High); F1Cal(M_ItemAVG_Mid); F1Cal(M_ItemAVG_Low); 0;F1Cal(MD_ItemAVG_High); F1Cal(MD_ItemAVG_Mid); F1Cal(MD_ItemAVG_Low); 0; F1Cal(ME_ItemAVG_High); F1Cal(ME_ItemAVG_Mid); F1Cal(ME_ItemAVG_Low); 0; F1Cal(DE_ItemAVG_High); F1Cal(DE_ItemAVG_Mid);F1Cal(DE_ItemAVG_Low); 0; F1Cal(MED_ItemAVG_High); F1Cal(MED_ItemAVG_Mid); F1Cal(MED_ItemAVG_Low)];
MMMF_ = [F1Cal(S_MMMF_High); F1Cal(S_MMMF_Mid);0;F1Cal(M_MMMF_High); F1Cal(M_MMMF_Mid); F1Cal(M_MMMF_Low); 0;F1Cal(MD_MMMF_High); F1Cal(MD_MMMF_Mid); F1Cal(MD_MMMF_Low); 0; F1Cal(ME_MMMF_High); F1Cal(ME_MMMF_Mid); F1Cal(ME_MMMF_Low); 0; F1Cal(DE_MMMF_High); F1Cal(DE_MMMF_Mid);F1Cal(DE_MMMF_Low); 0; F1Cal(MED_MMMF_High); F1Cal(MED_MMMF_Mid); F1Cal(MED_MMMF_Low)];
WMF_ = [F1Cal(S_WMF_High); F1Cal(S_WMF_Mid);0;F1Cal(M_WMF_High); F1Cal(M_WMF_Mid); F1Cal(M_WMF_Low); 0;F1Cal(MD_WMF_High); F1Cal(MD_WMF_Mid); F1Cal(MD_WMF_Low); 0; F1Cal(ME_WMF_High); F1Cal(ME_WMF_Mid); F1Cal(ME_WMF_Low); 0; F1Cal(DE_WMF_High); F1Cal(DE_WMF_Mid);F1Cal(DE_WMF_Low); 0; F1Cal(MED_WMF_High); F1Cal(MED_WMF_Mid); F1Cal(MED_WMF_Low)];
HPF_ = [F1Cal(S_HPF_High); F1Cal(S_HPF_Mid);0;F1Cal(M_HPF_High); F1Cal(M_HPF_Mid); F1Cal(M_HPF_Low); 0;F1Cal(MD_HPF_High); F1Cal(MD_HPF_Mid); F1Cal(MD_HPF_Low); 0; F1Cal(ME_HPF_High); F1Cal(ME_HPF_Mid); F1Cal(ME_HPF_Low); 0; F1Cal(DE_HPF_High); F1Cal(DE_HPF_Mid);F1Cal(DE_HPF_Low); 0; F1Cal(MED_HPF_High); F1Cal(MED_HPF_Mid); F1Cal(MED_HPF_Low)];
IBPR_ = [F1Cal(S_IBPR_High); F1Cal(S_IBPR_Mid);0;F1Cal(M_IBPR_High); F1Cal(M_IBPR_Mid); F1Cal(M_IBPR_Low); 0;F1Cal(MD_IBPR_High); F1Cal(MD_IBPR_Mid); F1Cal(MD_IBPR_Low); 0; F1Cal(ME_IBPR_High); F1Cal(ME_IBPR_Mid); F1Cal(ME_IBPR_Low); 0; F1Cal(DE_IBPR_High); F1Cal(DE_IBPR_Mid);F1Cal(DE_IBPR_Low); 0; F1Cal(MED_IBPR_High); F1Cal(MED_IBPR_Mid); F1Cal(MED_IBPR_Low)];
WBPR_ = [F1Cal(S_WBPR_High); F1Cal(S_WBPR_Mid);0;F1Cal(M_WBPR_High); F1Cal(M_WBPR_Mid); F1Cal(M_WBPR_Low); 0;F1Cal(MD_WBPR_High); F1Cal(MD_WBPR_Mid); F1Cal(MD_WBPR_Low); 0; F1Cal(ME_WBPR_High); F1Cal(ME_WBPR_Mid); F1Cal(ME_WBPR_Low); 0; F1Cal(DE_WBPR_High); F1Cal(DE_WBPR_Mid);F1Cal(DE_WBPR_Low); 0; F1Cal(MED_WBPR_High); F1Cal(MED_WBPR_Mid); F1Cal(MED_WBPR_Low)];
SKM_ = [F1Cal(S_SKM_High); F1Cal(S_SKM_Mid);0;F1Cal(M_SKM_High); F1Cal(M_SKM_Mid); F1Cal(M_SKM_Low); 0;F1Cal(MD_SKM_High); F1Cal(MD_SKM_Mid); F1Cal(MD_SKM_Low); 0; F1Cal(ME_SKM_High); F1Cal(ME_SKM_Mid); F1Cal(ME_SKM_Low); 0; F1Cal(DE_SKM_High); F1Cal(DE_SKM_Mid);F1Cal(DE_SKM_Low); 0; F1Cal(MED_SKM_High); F1Cal(MED_SKM_Mid); F1Cal(MED_SKM_Low)];
NEUMF_ = [F1Cal(S_NEUMF_High); F1Cal(S_NEUMF_Mid);0;F1Cal(M_NEUMF_High); F1Cal(M_NEUMF_Mid); F1Cal(M_NEUMF_Low); 0;F1Cal(MD_NEUMF_High); F1Cal(MD_NEUMF_Mid); F1Cal(MD_NEUMF_Low); 0; F1Cal(ME_NEUMF_High); F1Cal(ME_NEUMF_Mid); F1Cal(ME_NEUMF_Low); 0; F1Cal(DE_NEUMF_High); F1Cal(DE_NEUMF_Mid);F1Cal(DE_NEUMF_Low); 0; F1Cal(MED_NEUMF_High); F1Cal(MED_NEUMF_Mid); F1Cal(MED_NEUMF_Low)];
VAECF_ = [F1Cal(S_VAECF_High); F1Cal(S_VAECF_Mid);0;F1Cal(M_VAECF_High); F1Cal(M_VAECF_Mid); F1Cal(M_VAECF_Low); 0;F1Cal(MD_VAECF_High); F1Cal(MD_VAECF_Mid); F1Cal(MD_VAECF_Low); 0; F1Cal(ME_VAECF_High); F1Cal(ME_VAECF_Mid); F1Cal(ME_VAECF_Low); 0; F1Cal(DE_VAECF_High); F1Cal(DE_VAECF_Mid);F1Cal(DE_VAECF_Low); 0; F1Cal(MED_VAECF_High); F1Cal(MED_VAECF_Mid); F1Cal(MED_VAECF_Low)];

F1Table=table(Group, Random_,ItemAVG_, MMMF_, WMF_, HPF_, IBPR_, WBPR_, SKM_, NEUMF_, VAECF_);
save F1Score F1Table

%% Table for TTEST of F1 values
Group=["Size-High/Mid"; "----"; "Mean-High/Mid"; "Mean-Mid/Low"; "----"; "MeanDev-High/Mid"; "MeanDev-Mid/Low"; "----"; "MeanEnt-High/Mid"; "MeanEnt-Mid/Low"; "----"; "DevEnt-High/Mid"; "DevEnt-Mid/Low"; "----"; "MeanDevEnt-High/Mid"; "MeanDevEnt-Mid/Low"];
Random_ = [F1TTest(S_Random_High,S_Random_Mid); 0;F1TTest(M_Random_High,M_Random_Mid);F1TTest(M_Random_Mid,M_Random_Low);0;F1TTest(MD_Random_High,MD_Random_Mid);F1TTest(MD_Random_Mid,MD_Random_Low);0;F1TTest(ME_Random_High,ME_Random_Mid);F1TTest(ME_Random_Mid,ME_Random_Low);0;F1TTest(DE_Random_High,DE_Random_Mid);F1TTest(DE_Random_Mid,DE_Random_Low);0;F1TTest(MED_Random_High,MED_Random_Mid);F1TTest(MED_Random_Mid,MED_Random_Low)];
ItemAVG_ = [F1TTest(S_ItemAVG_High,S_ItemAVG_Mid); 0;F1TTest(M_ItemAVG_High,M_ItemAVG_Mid);F1TTest(M_ItemAVG_Mid,M_ItemAVG_Low);0;F1TTest(MD_ItemAVG_High,MD_ItemAVG_Mid);F1TTest(MD_ItemAVG_Mid,MD_ItemAVG_Low);0;F1TTest(ME_ItemAVG_High,ME_ItemAVG_Mid);F1TTest(ME_ItemAVG_Mid,ME_ItemAVG_Low);0;F1TTest(DE_ItemAVG_High,DE_ItemAVG_Mid);F1TTest(DE_ItemAVG_Mid,DE_ItemAVG_Low);0;F1TTest(MED_ItemAVG_High,MED_ItemAVG_Mid);F1TTest(MED_ItemAVG_Mid,MED_ItemAVG_Low)];
MMMF_ = [F1TTest(S_MMMF_High,S_MMMF_Mid); 0;F1TTest(M_MMMF_High,M_MMMF_Mid);F1TTest(M_MMMF_Mid,M_MMMF_Low);0;F1TTest(MD_MMMF_High,MD_MMMF_Mid);F1TTest(MD_MMMF_Mid,MD_MMMF_Low);0;F1TTest(ME_MMMF_High,ME_MMMF_Mid);F1TTest(ME_MMMF_Mid,ME_MMMF_Low);0;F1TTest(DE_MMMF_High,DE_MMMF_Mid);F1TTest(DE_MMMF_Mid,DE_MMMF_Low);0;F1TTest(MED_MMMF_High,MED_MMMF_Mid);F1TTest(MED_MMMF_Mid,MED_MMMF_Low)];
WMF_ = [F1TTest(S_WMF_High,S_WMF_Mid); 0;F1TTest(M_WMF_High,M_WMF_Mid);F1TTest(M_WMF_Mid,M_WMF_Low);0;F1TTest(MD_WMF_High,MD_WMF_Mid);F1TTest(MD_WMF_Mid,MD_WMF_Low);0;F1TTest(ME_WMF_High,ME_WMF_Mid);F1TTest(ME_WMF_Mid,ME_WMF_Low);0;F1TTest(DE_WMF_High,DE_WMF_Mid);F1TTest(DE_WMF_Mid,DE_WMF_Low);0;F1TTest(MED_WMF_High,MED_WMF_Mid);F1TTest(MED_WMF_Mid,MED_WMF_Low)];
HPF_ = [F1TTest(S_HPF_High,S_HPF_Mid); 0;F1TTest(M_HPF_High,M_HPF_Mid);F1TTest(M_HPF_Mid,M_HPF_Low);0;F1TTest(MD_HPF_High,MD_HPF_Mid);F1TTest(MD_HPF_Mid,MD_HPF_Low);0;F1TTest(ME_HPF_High,ME_HPF_Mid);F1TTest(ME_HPF_Mid,ME_HPF_Low);0;F1TTest(DE_HPF_High,DE_HPF_Mid);F1TTest(DE_HPF_Mid,DE_HPF_Low);0;F1TTest(MED_HPF_High,MED_HPF_Mid);F1TTest(MED_HPF_Mid,MED_HPF_Low)];
IBPR_ = [F1TTest(S_IBPR_High,S_IBPR_Mid); 0;F1TTest(M_IBPR_High,M_IBPR_Mid);F1TTest(M_IBPR_Mid,M_IBPR_Low);0;F1TTest(MD_IBPR_High,MD_IBPR_Mid);F1TTest(MD_IBPR_Mid,MD_IBPR_Low);0;F1TTest(ME_IBPR_High,ME_IBPR_Mid);F1TTest(ME_IBPR_Mid,ME_IBPR_Low);0;F1TTest(DE_IBPR_High,DE_IBPR_Mid);F1TTest(DE_IBPR_Mid,DE_IBPR_Low);0;F1TTest(MED_IBPR_High,MED_IBPR_Mid);F1TTest(MED_IBPR_Mid,MED_IBPR_Low)];
WBPR_ = [F1TTest(S_WBPR_High,S_WBPR_Mid); 0;F1TTest(M_WBPR_High,M_WBPR_Mid);F1TTest(M_WBPR_Mid,M_WBPR_Low);0;F1TTest(MD_WBPR_High,MD_WBPR_Mid);F1TTest(MD_WBPR_Mid,MD_WBPR_Low);0;F1TTest(ME_WBPR_High,ME_WBPR_Mid);F1TTest(ME_WBPR_Mid,ME_WBPR_Low);0;F1TTest(DE_WBPR_High,DE_WBPR_Mid);F1TTest(DE_WBPR_Mid,DE_WBPR_Low);0;F1TTest(MED_WBPR_High,MED_WBPR_Mid);F1TTest(MED_WBPR_Mid,MED_WBPR_Low)];
SKM_ = [F1TTest(S_SKM_High,S_SKM_Mid); 0;F1TTest(M_SKM_High,M_SKM_Mid);F1TTest(M_SKM_Mid,M_SKM_Low);0;F1TTest(MD_SKM_High,MD_SKM_Mid);F1TTest(MD_SKM_Mid,MD_SKM_Low);0;F1TTest(ME_SKM_High,ME_SKM_Mid);F1TTest(ME_SKM_Mid,ME_SKM_Low);0;F1TTest(DE_SKM_High,DE_SKM_Mid);F1TTest(DE_SKM_Mid,DE_SKM_Low);0;F1TTest(MED_SKM_High,MED_SKM_Mid);F1TTest(MED_SKM_Mid,MED_SKM_Low)];
NEUMF_ = [F1TTest(S_NEUMF_High,S_NEUMF_Mid); 0;F1TTest(M_NEUMF_High,M_NEUMF_Mid);F1TTest(M_NEUMF_Mid,M_NEUMF_Low);0;F1TTest(MD_NEUMF_High,MD_NEUMF_Mid);F1TTest(MD_NEUMF_Mid,MD_NEUMF_Low);0;F1TTest(ME_NEUMF_High,ME_NEUMF_Mid);F1TTest(ME_NEUMF_Mid,ME_NEUMF_Low);0;F1TTest(DE_NEUMF_High,DE_NEUMF_Mid);F1TTest(DE_NEUMF_Mid,DE_NEUMF_Low);0;F1TTest(MED_NEUMF_High,MED_NEUMF_Mid);F1TTest(MED_NEUMF_Mid,MED_NEUMF_Low)];
VAECF_ = [F1TTest(S_VAECF_High,S_VAECF_Mid); 0;F1TTest(M_VAECF_High,M_VAECF_Mid);F1TTest(M_VAECF_Mid,M_VAECF_Low);0;F1TTest(MD_VAECF_High,MD_VAECF_Mid);F1TTest(MD_VAECF_Mid,MD_VAECF_Low);0;F1TTest(ME_VAECF_High,ME_VAECF_Mid);F1TTest(ME_VAECF_Mid,ME_VAECF_Low);0;F1TTest(DE_VAECF_High,DE_VAECF_Mid);F1TTest(DE_VAECF_Mid,DE_VAECF_Low);0;F1TTest(MED_VAECF_High,MED_VAECF_Mid);F1TTest(MED_VAECF_Mid,MED_VAECF_Low)];

F1TTestTable=table(Group, Random_,ItemAVG_, MMMF_, WMF_, HPF_, IBPR_, WBPR_, SKM_, NEUMF_, VAECF_);
save F1ScoreTTest F1TTestTable

return
end

function [GroupResults] = Construct10Groups(Group, TopNResults)
% Input 
% Group (nx1 group info with userIDs)
% TopNResults : MetricResult
% Output:
% GroupResults : gx7 --> g:10

if mod(numel(Group),10)
  Group(end+1:ceil(numel(Group)/10)*10) = 0;
end
ConsGroups=reshape(Group,10,[]);

GroupMatrix=zeros(10,8);GroupResults=zeros(10,8);
for g=1:size(ConsGroups,1)
    for user=1:size(ConsGroups,2)
        userID=ConsGroups(g,user);
        if(userID~=0)
            GroupMatrix(g,:)=GroupMatrix(g,:)+TopNResults(userID,:);
        end
    end
    GroupResults(g,:)=GroupMatrix(g,:)/size(nonzeros(ConsGroups(g,:)),1);
end

return
end

function [DeltaGAP] = DeltaGapCal (GapP, GapR)
% Calculation of DeltaGAP scores for given GAPp and GapR
DeltaGAP=bsxfun(@rdivide,(GapR(:,1)-GapP(:,1)),GapP(:,1))*100;
DeltaGAP=mean(DeltaGAP);
return
end

function [tValue] = DeltaGAPTest(Group1, Group2)
GapP=Group1(:,1);GapR=Group1(:,2);
DeltaGAP1=bsxfun(@rdivide,(GapR(:,1)-GapP(:,1)),GapP(:,1))*100;

GapP=Group2(:,1);GapR=Group2(:,2);
DeltaGAP2=bsxfun(@rdivide,(GapR(:,1)-GapP(:,1)),GapP(:,1))*100;

if(mean(DeltaGAP1)>mean(DeltaGAP2))
    tValue=ttest(DeltaGAP1,DeltaGAP2);
else
    tValue=-ttest(DeltaGAP1,DeltaGAP2);
end

return
end

function [nDCG] = nDCGCal(Group)
nDCG=mean(Group(:,3));
return 
end

function [tValue] = nDCGTest(Group1, Group2)

if(mean(Group1(:,3))>mean(Group2(:,3)))
    tValue=ttest(Group1(:,3),Group2(:,3));
else
    tValue=-ttest(Group1(:,3),Group2(:,3));
end


return
end

function [prec] = PrecCal(Group)
prec=mean(Group(:,4));
return 
end

function [tValue] = PrecTest(Group1, Group2)

if(mean(Group1(:,4))>mean(Group2(:,4)))
    tValue=ttest(Group1(:,4),Group2(:,4));
else
    tValue=-ttest(Group1(:,4),Group2(:,4));
end


return
end

function [recall] = RecallCal(Group)
recall=mean(Group(:,5));
return 
end

function [tValue] = RecallTest(Group1, Group2)

if(mean(Group1(:,5))>mean(Group2(:,5)))
    tValue=ttest(Group1(:,5),Group2(:,5));
else
    tValue=-ttest(Group1(:,5),Group2(:,5));
end


return
end

function [aplt] = APLTCal(Group)
aplt=mean(Group(:,6));
return 
end

function [tValue] = APLTTest(Group1, Group2)

if((mean(Group1(:,6))==0 && mean(Group2(:,6))==0) || (mean(Group1(:,6))==1 && mean(Group2(:,6))==1))
    tValue=0;
else
    if(mean(Group1(:,3))>mean(Group2(:,3)))
        tValue=ttest(Group1(:,6),Group2(:,6));
    else
        tValue=-ttest(Group1(:,6),Group2(:,6));
    end
end

return
end

function [novelty] = NoveltyCal(Group)
novelty=mean(Group(:,7));
return 
end

function [tValue] = NoveltyTest(Group1, Group2)

if((mean(Group1(:,7))==0 && mean(Group2(:,7))==0) || (mean(Group1(:,7))==1 && mean(Group2(:,7))==1))
    tValue=0;
else
    if(mean(Group1(:,7))>mean(Group2(:,7)))
        tValue=ttest(Group1(:,7),Group2(:,7));
    else
        tValue=-ttest(Group1(:,7),Group2(:,7));
    end
end

return
end

function [f1] = F1Cal(Group)
f1=mean(Group(:,8));
return 
end

function [tValue] = F1TTest(Group1, Group2)

    if(mean(Group1(:,8))>mean(Group2(:,8)))
        tValue=ttest(Group1(:,8),Group2(:,8));
    else
        tValue=-ttest(Group1(:,8),Group2(:,8));
    end

return
end













