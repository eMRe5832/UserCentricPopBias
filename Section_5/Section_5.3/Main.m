function Main()

% ----Input ----
% Dataset: Original data: mxn format
% PopItems: Average Popularity of the items for the corresponding dataset.
% Features: Feature matrix for the corresponding dataset.
% TopN: TopN recommendation list for the corresponding dataset.
% PredMatrix: Prediction matrix mxn format

%Var. 
% load('DB-VaR\Features.mat');
% load('DB-VaR\DB.mat');
% load('DB-VaR\VaR_WMF.mat');
% load('DB-VaR\VaR_IBPR.mat');
% load('DB-VaR\VaR_SKM.mat');
% load('DB-VaR\VaR_VAECF.mat');
% 
% WMF=VaR_WMF; IBPR=VaR_IBPR; SKM=VaR_SKM; VAECF=VaR_VAECF;

%xQuad
% load('DB-xQuad\Features.mat');
% load('DB-xQuad\DB.mat');
% load('DB-xQuad\xQuad_WMF.mat');
% load('DB-xQuad\xQuad_IBPR.mat');
% load('DB-xQuad\xQuad_SKM.mat');
% load('DB-xQuad\xQuad_VAECF.mat');
% 
% WMF=xQuad_WMF; IBPR=xQuad_IBPR; SKM=xQuad_SKM; VAECF=xQuad_VAECF;

% %Aug
% load('DB-Aug\Features.mat');
% load('DB-Aug\DB.mat');
% load('DB-Aug\Aug_WMF.mat');
% load('DB-Aug\Aug_IBPR.mat');
% load('DB-Aug\Aug_SKM.mat');
% load('DB-Aug\Aug_VAECF.mat');
% 
% WMF=Aug_WMF; IBPR=Aug_IBPR; SKM=Aug_SKM; VAECF=Aug_VAECF;

%Aug
load('DB-Mul\Features.mat');
load('DB-Mul\DB.mat');
load('DB-Mul\Mul_WMF.mat');
load('DB-Mul\Mul_IBPR.mat');
load('DB-Mul\Mul_SKM.mat');
load('DB-Mul\Mul_VAECF.mat');

WMF=Mul_WMF; IBPR=Mul_IBPR; SKM=Mul_SKM; VAECF=Mul_VAECF;

[a,WMFResults]=MetricALL(DB, WMF);
[a,IBPRResults]=MetricALL(DB, IBPR);
[a,SKMResults]=MetricALL(DB, SKM);
[a,VAECFResults]=MetricALL(DB, VAECF);

%% Construct user groups for size:
S=Features(:,1);
Mu_S = mean(S); Dev_S = std(S); 
S_High = find(S(:,1) > (Mu_S+Dev_S));
S_Mid =  find(S(:,1) > Mu_S-Dev_S & S(:,1)<Mu_S+Dev_S);
S_Low = find(S(:,1) < (Mu_S-Dev_S));

S_WMF_High=Construct10Groups(S_High,WMFResults);
S_IBPR_High=Construct10Groups(S_High,IBPRResults);
S_SKM_High=Construct10Groups(S_High,SKMResults);
S_VAECF_High=Construct10Groups(S_High,VAECFResults);

S_WMF_Mid=Construct10Groups(S_Mid,WMFResults);
S_IBPR_Mid=Construct10Groups(S_Mid,IBPRResults);
S_SKM_Mid=Construct10Groups(S_Mid,SKMResults);
S_VAECF_Mid=Construct10Groups(S_Mid,VAECFResults);

%% Construct user groups for mean:
M=Features(:,2);
Mu_M = mean(M); Dev_M = std(M);
M_High = find(M(:,1) > (Mu_M+Dev_M));
M_Mid =  find(M(:,1) > Mu_M-Dev_M & M(:,1)<Mu_M+Dev_M);
M_Low = find(M(:,1) < (Mu_M-Dev_M));


M_WMF_High=Construct10Groups(M_High,WMFResults);
M_IBPR_High=Construct10Groups(M_High,IBPRResults);
M_SKM_High=Construct10Groups(M_High,SKMResults);
M_VAECF_High=Construct10Groups(M_High,VAECFResults);

M_WMF_Mid=Construct10Groups(M_Mid,WMFResults);
M_IBPR_Mid=Construct10Groups(M_Mid,IBPRResults);
M_SKM_Mid=Construct10Groups(M_Mid,SKMResults);
M_VAECF_Mid=Construct10Groups(M_Mid,VAECFResults);

M_WMF_Low=Construct10Groups(M_Low,WMFResults);
M_IBPR_Low=Construct10Groups(M_Low,IBPRResults);
M_SKM_Low=Construct10Groups(M_Low,SKMResults);
M_VAECF_Low=Construct10Groups(M_Low,VAECFResults);

%% Construct user groups for MeanDev:
MD=Features(:,2)+(1-Features(:,3));
Mu_MD = mean(MD); Dev_MD = std(MD);
MD_High = find(MD(:,1) > (Mu_MD+Dev_MD));
MD_Mid =  find(MD(:,1)>Mu_MD-Dev_MD & MD(:,1)<Mu_MD+Dev_MD);
MD_Low = find(MD(:,1) < (Mu_MD-Dev_MD));

MD_WMF_High=Construct10Groups(MD_High,WMFResults);
MD_IBPR_High=Construct10Groups(MD_High,IBPRResults);
MD_SKM_High=Construct10Groups(MD_High,SKMResults);
MD_VAECF_High=Construct10Groups(MD_High,VAECFResults);

MD_WMF_Mid=Construct10Groups(MD_Mid,WMFResults);
MD_IBPR_Mid=Construct10Groups(MD_Mid,IBPRResults);
MD_SKM_Mid=Construct10Groups(MD_Mid,SKMResults);
MD_VAECF_Mid=Construct10Groups(MD_Mid,VAECFResults);

MD_WMF_Low=Construct10Groups(MD_Low,WMFResults);
MD_IBPR_Low=Construct10Groups(MD_Low,IBPRResults);
MD_SKM_Low=Construct10Groups(MD_Low,SKMResults);
MD_VAECF_Low=Construct10Groups(MD_Low,VAECFResults);

%% Construct user groups for MeanEntropy:
ME=Features(:,2)+(1-Features(:,5));
Mu_ME = mean(ME);Dev_ME = std(ME);
ME_High = find(ME(:,1) > (Mu_ME+Dev_ME));
ME_Mid =  find(ME(:,1)>Mu_ME-Dev_ME & ME(:,1)<Mu_ME+Dev_ME);
ME_Low = find(ME(:,1) < (Mu_ME-Dev_ME));

ME_WMF_High=Construct10Groups(ME_High,WMFResults);
ME_IBPR_High=Construct10Groups(ME_High,IBPRResults);
ME_SKM_High=Construct10Groups(ME_High,SKMResults);
ME_VAECF_High=Construct10Groups(ME_High,VAECFResults);

ME_WMF_Mid=Construct10Groups(ME_Mid,WMFResults);
ME_IBPR_Mid=Construct10Groups(ME_Mid,IBPRResults);
ME_SKM_Mid=Construct10Groups(ME_Mid,SKMResults);
ME_VAECF_Mid=Construct10Groups(ME_Mid,VAECFResults);

ME_WMF_Low=Construct10Groups(ME_Low,WMFResults);
ME_IBPR_Low=Construct10Groups(ME_Low,IBPRResults);
ME_SKM_Low=Construct10Groups(ME_Low,SKMResults);
ME_VAECF_Low=Construct10Groups(ME_Low,VAECFResults);

%% Construct user groups for DevEnt:
DE=Features(:,4)+Features(:,5);
Mu_DE = mean(DE);Dev_DE = std(DE); 

DE_High = find(DE(:,1) > (Mu_DE+Dev_DE));
DE_Mid =  find(DE(:,1)>Mu_DE-Dev_DE & DE(:,1)<Mu_DE+Dev_DE);
DE_Low = find(DE(:,1) < (Mu_DE-Dev_DE));

DE_WMF_High=Construct10Groups(DE_High,WMFResults);
DE_IBPR_High=Construct10Groups(DE_High,IBPRResults);
DE_SKM_High=Construct10Groups(DE_High,SKMResults);
DE_VAECF_High=Construct10Groups(DE_High,VAECFResults);

DE_WMF_Mid=Construct10Groups(DE_Mid,WMFResults);
DE_IBPR_Mid=Construct10Groups(DE_Mid,IBPRResults);
DE_SKM_Mid=Construct10Groups(DE_Mid,SKMResults);
DE_VAECF_Mid=Construct10Groups(DE_Mid,VAECFResults);

DE_WMF_Low=Construct10Groups(DE_Low,WMFResults);
DE_IBPR_Low=Construct10Groups(DE_Low,IBPRResults);
DE_SKM_Low=Construct10Groups(DE_Low,SKMResults);
DE_VAECF_Low=Construct10Groups(DE_Low,VAECFResults);

%% Construct user groups for MeanDevEnt:
MED=Features(:,2)+(1-Features(:,4))+(1-Features(:,5));
Mu_MED = mean(MED); Dev_MED = std(MED);
MED_High = find(MED(:,1) > (Mu_MED+Dev_MED));
MED_Mid =  find(MED(:,1)>Mu_MED-Dev_MED & MED(:,1)<Mu_MED+Dev_MED);
MED_Low = find(MED(:,1) < (Mu_MED-Dev_MED));

MED_WMF_High=Construct10Groups(MED_High,WMFResults);
MED_IBPR_High=Construct10Groups(MED_High,IBPRResults);
MED_SKM_High=Construct10Groups(MED_High,SKMResults);
MED_VAECF_High=Construct10Groups(MED_High,VAECFResults);

MED_WMF_Mid=Construct10Groups(MED_Mid,WMFResults);
MED_IBPR_Mid=Construct10Groups(MED_Mid,IBPRResults);
MED_SKM_Mid=Construct10Groups(MED_Mid,SKMResults);
MED_VAECF_Mid=Construct10Groups(MED_Mid,VAECFResults);

MED_WMF_Low=Construct10Groups(MED_Low,WMFResults);
MED_IBPR_Low=Construct10Groups(MED_Low,IBPRResults);
MED_SKM_Low=Construct10Groups(MED_Low,SKMResults);
MED_VAECF_Low=Construct10Groups(MED_Low,VAECFResults);

fprintf('Groups are constructed \n');

%% Table for DeltaGAP values
Group=["Size-High"; "Size-Mid";"----"; "Mean-High"; "Mean-Mid"; "Mean-Low"; "----"; "MeanDev-High"; "MeanDev-Mid"; "MeanDev-Low"; "----"; "MeanEnt-High"; "MeanEnt-Mid"; "MeanEnt-Low"; "----"; "DevEnt-High"; "DevEnt-Mid"; "DevEnt-Low"; "----"; "MeanDevEnt-High"; "MeanDevEnt-Mid"; "MeanDevEnt-Low"];
WMF_ = [DeltaGapCal(S_WMF_High(:,1),S_WMF_High(:,2)); DeltaGapCal(S_WMF_Mid(:,1),S_WMF_Mid(:,2));0;DeltaGapCal(M_WMF_High(:,1),M_WMF_High(:,2)); DeltaGapCal(M_WMF_Mid(:,1),M_WMF_Mid(:,2)); DeltaGapCal(M_WMF_Low(:,1),M_WMF_Low(:,2)); 0;DeltaGapCal(MD_WMF_High(:,1),MD_WMF_High(:,2)); DeltaGapCal(MD_WMF_Mid(:,1),MD_WMF_Mid(:,2)); DeltaGapCal(MD_WMF_Low(:,1),MD_WMF_Low(:,2)); 0; DeltaGapCal(ME_WMF_High(:,1),ME_WMF_High(:,2)); DeltaGapCal(ME_WMF_Mid(:,1),ME_WMF_Mid(:,2)); DeltaGapCal(ME_WMF_Low(:,1),ME_WMF_Low(:,2)); 0; DeltaGapCal(DE_WMF_High(:,1),DE_WMF_High(:,2)); DeltaGapCal(DE_WMF_Mid(:,1),DE_WMF_Mid(:,2));DeltaGapCal(DE_WMF_Low(:,1),DE_WMF_Low(:,2)); 0; DeltaGapCal(MED_WMF_High(:,1),MED_WMF_High(:,2)); DeltaGapCal(MED_WMF_Mid(:,1),MED_WMF_Mid(:,2)); DeltaGapCal(MED_WMF_Low(:,1),MED_WMF_Low(:,2))];
IBPR_ = [DeltaGapCal(S_IBPR_High(:,1),S_IBPR_High(:,2)); DeltaGapCal(S_IBPR_Mid(:,1),S_IBPR_Mid(:,2));0;DeltaGapCal(M_IBPR_High(:,1),M_IBPR_High(:,2)); DeltaGapCal(M_IBPR_Mid(:,1),M_IBPR_Mid(:,2)); DeltaGapCal(M_IBPR_Low(:,1),M_IBPR_Low(:,2)); 0;DeltaGapCal(MD_IBPR_High(:,1),MD_IBPR_High(:,2)); DeltaGapCal(MD_IBPR_Mid(:,1),MD_IBPR_Mid(:,2)); DeltaGapCal(MD_IBPR_Low(:,1),MD_IBPR_Low(:,2)); 0; DeltaGapCal(ME_IBPR_High(:,1),ME_IBPR_High(:,2)); DeltaGapCal(ME_IBPR_Mid(:,1),ME_IBPR_Mid(:,2)); DeltaGapCal(ME_IBPR_Low(:,1),ME_IBPR_Low(:,2)); 0; DeltaGapCal(DE_IBPR_High(:,1),DE_IBPR_High(:,2)); DeltaGapCal(DE_IBPR_Mid(:,1),DE_IBPR_Mid(:,2));DeltaGapCal(DE_IBPR_Low(:,1),DE_IBPR_Low(:,2)); 0; DeltaGapCal(MED_IBPR_High(:,1),MED_IBPR_High(:,2)); DeltaGapCal(MED_IBPR_Mid(:,1),MED_IBPR_Mid(:,2)); DeltaGapCal(MED_IBPR_Low(:,1),MED_IBPR_Low(:,2))];
SKM_ = [DeltaGapCal(S_SKM_High(:,1),S_SKM_High(:,2)); DeltaGapCal(S_SKM_Mid(:,1),S_SKM_Mid(:,2));0;DeltaGapCal(M_SKM_High(:,1),M_SKM_High(:,2)); DeltaGapCal(M_SKM_Mid(:,1),M_SKM_Mid(:,2)); DeltaGapCal(M_SKM_Low(:,1),M_SKM_Low(:,2)); 0;DeltaGapCal(MD_SKM_High(:,1),MD_SKM_High(:,2)); DeltaGapCal(MD_SKM_Mid(:,1),MD_SKM_Mid(:,2)); DeltaGapCal(MD_SKM_Low(:,1),MD_SKM_Low(:,2)); 0; DeltaGapCal(ME_SKM_High(:,1),ME_SKM_High(:,2)); DeltaGapCal(ME_SKM_Mid(:,1),ME_SKM_Mid(:,2)); DeltaGapCal(ME_SKM_Low(:,1),ME_SKM_Low(:,2)); 0; DeltaGapCal(DE_SKM_High(:,1),DE_SKM_High(:,2)); DeltaGapCal(DE_SKM_Mid(:,1),DE_SKM_Mid(:,2));DeltaGapCal(DE_SKM_Low(:,1),DE_SKM_Low(:,2)); 0; DeltaGapCal(MED_SKM_High(:,1),MED_SKM_High(:,2)); DeltaGapCal(MED_SKM_Mid(:,1),MED_SKM_Mid(:,2)); DeltaGapCal(MED_SKM_Low(:,1),MED_SKM_Low(:,2))];
VAECF_ = [DeltaGapCal(S_VAECF_High(:,1),S_VAECF_High(:,2)); DeltaGapCal(S_VAECF_Mid(:,1),S_VAECF_Mid(:,2));0;DeltaGapCal(M_VAECF_High(:,1),M_VAECF_High(:,2)); DeltaGapCal(M_VAECF_Mid(:,1),M_VAECF_Mid(:,2)); DeltaGapCal(M_VAECF_Low(:,1),M_VAECF_Low(:,2)); 0;DeltaGapCal(MD_VAECF_High(:,1),MD_VAECF_High(:,2)); DeltaGapCal(MD_VAECF_Mid(:,1),MD_VAECF_Mid(:,2)); DeltaGapCal(MD_VAECF_Low(:,1),MD_VAECF_Low(:,2)); 0; DeltaGapCal(ME_VAECF_High(:,1),ME_VAECF_High(:,2)); DeltaGapCal(ME_VAECF_Mid(:,1),ME_VAECF_Mid(:,2)); DeltaGapCal(ME_VAECF_Low(:,1),ME_VAECF_Low(:,2)); 0; DeltaGapCal(DE_VAECF_High(:,1),DE_VAECF_High(:,2)); DeltaGapCal(DE_VAECF_Mid(:,1),DE_VAECF_Mid(:,2));DeltaGapCal(DE_VAECF_Low(:,1),DE_VAECF_Low(:,2)); 0; DeltaGapCal(MED_VAECF_High(:,1),MED_VAECF_High(:,2)); DeltaGapCal(MED_VAECF_Mid(:,1),MED_VAECF_Mid(:,2)); DeltaGapCal(MED_VAECF_Low(:,1),MED_VAECF_Low(:,2))];

DeltaGAP=table(Group, WMF_, IBPR_, SKM_,  VAECF_);
save DeltaGAP DeltaGAP

%% Table for TTEST of DeltaGAP values
Group=["Size-High/Mid"; "----"; "Mean-High/Mid"; "Mean-Mid/Low"; "----"; "MeanDev-High/Mid"; "MeanDev-Mid/Low"; "----"; "MeanEnt-High/Mid"; "MeanEnt-Mid/Low"; "----"; "DevEnt-High/Mid"; "DevEnt-Mid/Low"; "----"; "MeanDevEnt-High/Mid"; "MeanDevEnt-Mid/Low"];
WMF_ = [DeltaGAPTest(S_WMF_High,S_WMF_Mid); 0;DeltaGAPTest(M_WMF_High,M_WMF_Mid);DeltaGAPTest(M_WMF_Mid,M_WMF_Low);0;DeltaGAPTest(MD_WMF_High,MD_WMF_Mid);DeltaGAPTest(MD_WMF_Mid,MD_WMF_Low);0;DeltaGAPTest(ME_WMF_High,ME_WMF_Mid);DeltaGAPTest(ME_WMF_Mid,ME_WMF_Low);0;DeltaGAPTest(DE_WMF_High,DE_WMF_Mid);DeltaGAPTest(DE_WMF_Mid,DE_WMF_Low);0;DeltaGAPTest(MED_WMF_High,MED_WMF_Mid);DeltaGAPTest(MED_WMF_Mid,MED_WMF_Low)];
IBPR_ = [DeltaGAPTest(S_IBPR_High,S_IBPR_Mid); 0;DeltaGAPTest(M_IBPR_High,M_IBPR_Mid);DeltaGAPTest(M_IBPR_Mid,M_IBPR_Low);0;DeltaGAPTest(MD_IBPR_High,MD_IBPR_Mid);DeltaGAPTest(MD_IBPR_Mid,MD_IBPR_Low);0;DeltaGAPTest(ME_IBPR_High,ME_IBPR_Mid);DeltaGAPTest(ME_IBPR_Mid,ME_IBPR_Low);0;DeltaGAPTest(DE_IBPR_High,DE_IBPR_Mid);DeltaGAPTest(DE_IBPR_Mid,DE_IBPR_Low);0;DeltaGAPTest(MED_IBPR_High,MED_IBPR_Mid);DeltaGAPTest(MED_IBPR_Mid,MED_IBPR_Low)];
SKM_ = [DeltaGAPTest(S_SKM_High,S_SKM_Mid); 0;DeltaGAPTest(M_SKM_High,M_SKM_Mid);DeltaGAPTest(M_SKM_Mid,M_SKM_Low);0;DeltaGAPTest(MD_SKM_High,MD_SKM_Mid);DeltaGAPTest(MD_SKM_Mid,MD_SKM_Low);0;DeltaGAPTest(ME_SKM_High,ME_SKM_Mid);DeltaGAPTest(ME_SKM_Mid,ME_SKM_Low);0;DeltaGAPTest(DE_SKM_High,DE_SKM_Mid);DeltaGAPTest(DE_SKM_Mid,DE_SKM_Low);0;DeltaGAPTest(MED_SKM_High,MED_SKM_Mid);DeltaGAPTest(MED_SKM_Mid,MED_SKM_Low)];
VAECF_ = [DeltaGAPTest(S_VAECF_High,S_VAECF_Mid); 0;DeltaGAPTest(M_VAECF_High,M_VAECF_Mid);DeltaGAPTest(M_VAECF_Mid,M_VAECF_Low);0;DeltaGAPTest(MD_VAECF_High,MD_VAECF_Mid);DeltaGAPTest(MD_VAECF_Mid,MD_VAECF_Low);0;DeltaGAPTest(ME_VAECF_High,ME_VAECF_Mid);DeltaGAPTest(ME_VAECF_Mid,ME_VAECF_Low);0;DeltaGAPTest(DE_VAECF_High,DE_VAECF_Mid);DeltaGAPTest(DE_VAECF_Mid,DE_VAECF_Low);0;DeltaGAPTest(MED_VAECF_High,MED_VAECF_Mid);DeltaGAPTest(MED_VAECF_Mid,MED_VAECF_Low)];

DeltaGAPTTest=table(Group, WMF_, IBPR_, SKM_,  VAECF_);
save DeltaGAPTTest DeltaGAPTTest

fprintf('GAP values are calculated \n');


%% Table for nDCG values
Group=["Size-High"; "Size-Mid";"----"; "Mean-High"; "Mean-Mid"; "Mean-Low"; "----"; "MeanDev-High"; "MeanDev-Mid"; "MeanDev-Low"; "----"; "MeanEnt-High"; "MeanEnt-Mid"; "MeanEnt-Low"; "----"; "DevEnt-High"; "DevEnt-Mid"; "DevEnt-Low"; "----"; "MeanDevEnt-High"; "MeanDevEnt-Mid"; "MeanDevEnt-Low"];
WMF_ = [nDCGCal(S_WMF_High); nDCGCal(S_WMF_Mid);0;nDCGCal(M_WMF_High); nDCGCal(M_WMF_Mid); nDCGCal(M_WMF_Low); 0;nDCGCal(MD_WMF_High); nDCGCal(MD_WMF_Mid); nDCGCal(MD_WMF_Low); 0; nDCGCal(ME_WMF_High); nDCGCal(ME_WMF_Mid); nDCGCal(ME_WMF_Low); 0; nDCGCal(DE_WMF_High); nDCGCal(DE_WMF_Mid);nDCGCal(DE_WMF_Low); 0; nDCGCal(MED_WMF_High); nDCGCal(MED_WMF_Mid); nDCGCal(MED_WMF_Low)];
IBPR_ = [nDCGCal(S_IBPR_High); nDCGCal(S_IBPR_Mid);0;nDCGCal(M_IBPR_High); nDCGCal(M_IBPR_Mid); nDCGCal(M_IBPR_Low); 0;nDCGCal(MD_IBPR_High); nDCGCal(MD_IBPR_Mid); nDCGCal(MD_IBPR_Low); 0; nDCGCal(ME_IBPR_High); nDCGCal(ME_IBPR_Mid); nDCGCal(ME_IBPR_Low); 0; nDCGCal(DE_IBPR_High); nDCGCal(DE_IBPR_Mid);nDCGCal(DE_IBPR_Low); 0; nDCGCal(MED_IBPR_High); nDCGCal(MED_IBPR_Mid); nDCGCal(MED_IBPR_Low)];
SKM_ = [nDCGCal(S_SKM_High); nDCGCal(S_SKM_Mid);0;nDCGCal(M_SKM_High); nDCGCal(M_SKM_Mid); nDCGCal(M_SKM_Low); 0;nDCGCal(MD_SKM_High); nDCGCal(MD_SKM_Mid); nDCGCal(MD_SKM_Low); 0; nDCGCal(ME_SKM_High); nDCGCal(ME_SKM_Mid); nDCGCal(ME_SKM_Low); 0; nDCGCal(DE_SKM_High); nDCGCal(DE_SKM_Mid);nDCGCal(DE_SKM_Low); 0; nDCGCal(MED_SKM_High); nDCGCal(MED_SKM_Mid); nDCGCal(MED_SKM_Low)];
VAECF_ = [nDCGCal(S_VAECF_High); nDCGCal(S_VAECF_Mid);0;nDCGCal(M_VAECF_High); nDCGCal(M_VAECF_Mid); nDCGCal(M_VAECF_Low); 0;nDCGCal(MD_VAECF_High); nDCGCal(MD_VAECF_Mid); nDCGCal(MD_VAECF_Low); 0; nDCGCal(ME_VAECF_High); nDCGCal(ME_VAECF_Mid); nDCGCal(ME_VAECF_Low); 0; nDCGCal(DE_VAECF_High); nDCGCal(DE_VAECF_Mid);nDCGCal(DE_VAECF_Low); 0; nDCGCal(MED_VAECF_High); nDCGCal(MED_VAECF_Mid); nDCGCal(MED_VAECF_Low)];

nDCGTable=table(Group, WMF_, IBPR_, SKM_,  VAECF_);
save nDCG nDCGTable

%% Table for TTEST of nDCG values
Group=["Size-High/Mid"; "----"; "Mean-High/Mid"; "Mean-Mid/Low"; "----"; "MeanDev-High/Mid"; "MeanDev-Mid/Low"; "----"; "MeanEnt-High/Mid"; "MeanEnt-Mid/Low"; "----"; "DevEnt-High/Mid"; "DevEnt-Mid/Low"; "----"; "MeanDevEnt-High/Mid"; "MeanDevEnt-Mid/Low"];
WMF_ = [nDCGTest(S_WMF_High,S_WMF_Mid); 0;nDCGTest(M_WMF_High,M_WMF_Mid);nDCGTest(M_WMF_Mid,M_WMF_Low);0;nDCGTest(MD_WMF_High,MD_WMF_Mid);nDCGTest(MD_WMF_Mid,MD_WMF_Low);0;nDCGTest(ME_WMF_High,ME_WMF_Mid);nDCGTest(ME_WMF_Mid,ME_WMF_Low);0;nDCGTest(DE_WMF_High,DE_WMF_Mid);nDCGTest(DE_WMF_Mid,DE_WMF_Low);0;nDCGTest(MED_WMF_High,MED_WMF_Mid);nDCGTest(MED_WMF_Mid,MED_WMF_Low)];
IBPR_ = [nDCGTest(S_IBPR_High,S_IBPR_Mid); 0;nDCGTest(M_IBPR_High,M_IBPR_Mid);nDCGTest(M_IBPR_Mid,M_IBPR_Low);0;nDCGTest(MD_IBPR_High,MD_IBPR_Mid);nDCGTest(MD_IBPR_Mid,MD_IBPR_Low);0;nDCGTest(ME_IBPR_High,ME_IBPR_Mid);nDCGTest(ME_IBPR_Mid,ME_IBPR_Low);0;nDCGTest(DE_IBPR_High,DE_IBPR_Mid);nDCGTest(DE_IBPR_Mid,DE_IBPR_Low);0;nDCGTest(MED_IBPR_High,MED_IBPR_Mid);nDCGTest(MED_IBPR_Mid,MED_IBPR_Low)];
SKM_ = [nDCGTest(S_SKM_High,S_SKM_Mid); 0;nDCGTest(M_SKM_High,M_SKM_Mid);nDCGTest(M_SKM_Mid,M_SKM_Low);0;nDCGTest(MD_SKM_High,MD_SKM_Mid);nDCGTest(MD_SKM_Mid,MD_SKM_Low);0;nDCGTest(ME_SKM_High,ME_SKM_Mid);nDCGTest(ME_SKM_Mid,ME_SKM_Low);0;nDCGTest(DE_SKM_High,DE_SKM_Mid);nDCGTest(DE_SKM_Mid,DE_SKM_Low);0;nDCGTest(MED_SKM_High,MED_SKM_Mid);nDCGTest(MED_SKM_Mid,MED_SKM_Low)];
VAECF_ = [nDCGTest(S_VAECF_High,S_VAECF_Mid); 0;nDCGTest(M_VAECF_High,M_VAECF_Mid);nDCGTest(M_VAECF_Mid,M_VAECF_Low);0;nDCGTest(MD_VAECF_High,MD_VAECF_Mid);nDCGTest(MD_VAECF_Mid,MD_VAECF_Low);0;nDCGTest(ME_VAECF_High,ME_VAECF_Mid);nDCGTest(ME_VAECF_Mid,ME_VAECF_Low);0;nDCGTest(DE_VAECF_High,DE_VAECF_Mid);nDCGTest(DE_VAECF_Mid,DE_VAECF_Low);0;nDCGTest(MED_VAECF_High,MED_VAECF_Mid);nDCGTest(MED_VAECF_Mid,MED_VAECF_Low)];

nDCGTTest=table(Group, WMF_, IBPR_, SKM_,  VAECF_);
save nDCGTTest nDCGTTest

fprintf('nDCG values are calculated \n');


%% Table for Precision values
Group=["Size-High"; "Size-Mid";"----"; "Mean-High"; "Mean-Mid"; "Mean-Low"; "----"; "MeanDev-High"; "MeanDev-Mid"; "MeanDev-Low"; "----"; "MeanEnt-High"; "MeanEnt-Mid"; "MeanEnt-Low"; "----"; "DevEnt-High"; "DevEnt-Mid"; "DevEnt-Low"; "----"; "MeanDevEnt-High"; "MeanDevEnt-Mid"; "MeanDevEnt-Low"];
WMF_ = [PrecCal(S_WMF_High); PrecCal(S_WMF_Mid);0;PrecCal(M_WMF_High); PrecCal(M_WMF_Mid); PrecCal(M_WMF_Low); 0;PrecCal(MD_WMF_High); PrecCal(MD_WMF_Mid); PrecCal(MD_WMF_Low); 0; PrecCal(ME_WMF_High); PrecCal(ME_WMF_Mid); PrecCal(ME_WMF_Low); 0; PrecCal(DE_WMF_High); PrecCal(DE_WMF_Mid);PrecCal(DE_WMF_Low); 0; PrecCal(MED_WMF_High); PrecCal(MED_WMF_Mid); PrecCal(MED_WMF_Low)];
IBPR_ = [PrecCal(S_IBPR_High); PrecCal(S_IBPR_Mid);0;PrecCal(M_IBPR_High); PrecCal(M_IBPR_Mid); PrecCal(M_IBPR_Low); 0;PrecCal(MD_IBPR_High); PrecCal(MD_IBPR_Mid); PrecCal(MD_IBPR_Low); 0; PrecCal(ME_IBPR_High); PrecCal(ME_IBPR_Mid); PrecCal(ME_IBPR_Low); 0; PrecCal(DE_IBPR_High); PrecCal(DE_IBPR_Mid);PrecCal(DE_IBPR_Low); 0; PrecCal(MED_IBPR_High); PrecCal(MED_IBPR_Mid); PrecCal(MED_IBPR_Low)];
SKM_ = [PrecCal(S_SKM_High); PrecCal(S_SKM_Mid);0;PrecCal(M_SKM_High); PrecCal(M_SKM_Mid); PrecCal(M_SKM_Low); 0;PrecCal(MD_SKM_High); PrecCal(MD_SKM_Mid); PrecCal(MD_SKM_Low); 0; PrecCal(ME_SKM_High); PrecCal(ME_SKM_Mid); PrecCal(ME_SKM_Low); 0; PrecCal(DE_SKM_High); PrecCal(DE_SKM_Mid);PrecCal(DE_SKM_Low); 0; PrecCal(MED_SKM_High); PrecCal(MED_SKM_Mid); PrecCal(MED_SKM_Low)];
VAECF_ = [PrecCal(S_VAECF_High); PrecCal(S_VAECF_Mid);0;PrecCal(M_VAECF_High); PrecCal(M_VAECF_Mid); PrecCal(M_VAECF_Low); 0;PrecCal(MD_VAECF_High); PrecCal(MD_VAECF_Mid); PrecCal(MD_VAECF_Low); 0; PrecCal(ME_VAECF_High); PrecCal(ME_VAECF_Mid); PrecCal(ME_VAECF_Low); 0; PrecCal(DE_VAECF_High); PrecCal(DE_VAECF_Mid);PrecCal(DE_VAECF_Low); 0; PrecCal(MED_VAECF_High); PrecCal(MED_VAECF_Mid); PrecCal(MED_VAECF_Low)];

PrecisionTable=table(Group, WMF_, IBPR_, SKM_,  VAECF_);
save Precision PrecisionTable

%% Table for TTEST of Precision values
Group=["Size-High/Mid"; "----"; "Mean-High/Mid"; "Mean-Mid/Low"; "----"; "MeanDev-High/Mid"; "MeanDev-Mid/Low"; "----"; "MeanEnt-High/Mid"; "MeanEnt-Mid/Low"; "----"; "DevEnt-High/Mid"; "DevEnt-Mid/Low"; "----"; "MeanDevEnt-High/Mid"; "MeanDevEnt-Mid/Low"];
WMF_ = [PrecTest(S_WMF_High,S_WMF_Mid); 0;PrecTest(M_WMF_High,M_WMF_Mid);PrecTest(M_WMF_Mid,M_WMF_Low);0;PrecTest(MD_WMF_High,MD_WMF_Mid);PrecTest(MD_WMF_Mid,MD_WMF_Low);0;PrecTest(ME_WMF_High,ME_WMF_Mid);PrecTest(ME_WMF_Mid,ME_WMF_Low);0;PrecTest(DE_WMF_High,DE_WMF_Mid);PrecTest(DE_WMF_Mid,DE_WMF_Low);0;PrecTest(MED_WMF_High,MED_WMF_Mid);PrecTest(MED_WMF_Mid,MED_WMF_Low)];
IBPR_ = [PrecTest(S_IBPR_High,S_IBPR_Mid); 0;PrecTest(M_IBPR_High,M_IBPR_Mid);PrecTest(M_IBPR_Mid,M_IBPR_Low);0;PrecTest(MD_IBPR_High,MD_IBPR_Mid);PrecTest(MD_IBPR_Mid,MD_IBPR_Low);0;PrecTest(ME_IBPR_High,ME_IBPR_Mid);PrecTest(ME_IBPR_Mid,ME_IBPR_Low);0;PrecTest(DE_IBPR_High,DE_IBPR_Mid);PrecTest(DE_IBPR_Mid,DE_IBPR_Low);0;PrecTest(MED_IBPR_High,MED_IBPR_Mid);PrecTest(MED_IBPR_Mid,MED_IBPR_Low)];
SKM_ = [PrecTest(S_SKM_High,S_SKM_Mid); 0;PrecTest(M_SKM_High,M_SKM_Mid);PrecTest(M_SKM_Mid,M_SKM_Low);0;PrecTest(MD_SKM_High,MD_SKM_Mid);PrecTest(MD_SKM_Mid,MD_SKM_Low);0;PrecTest(ME_SKM_High,ME_SKM_Mid);PrecTest(ME_SKM_Mid,ME_SKM_Low);0;PrecTest(DE_SKM_High,DE_SKM_Mid);PrecTest(DE_SKM_Mid,DE_SKM_Low);0;PrecTest(MED_SKM_High,MED_SKM_Mid);PrecTest(MED_SKM_Mid,MED_SKM_Low)];
VAECF_ = [PrecTest(S_VAECF_High,S_VAECF_Mid); 0;PrecTest(M_VAECF_High,M_VAECF_Mid);PrecTest(M_VAECF_Mid,M_VAECF_Low);0;PrecTest(MD_VAECF_High,MD_VAECF_Mid);PrecTest(MD_VAECF_Mid,MD_VAECF_Low);0;PrecTest(ME_VAECF_High,ME_VAECF_Mid);PrecTest(ME_VAECF_Mid,ME_VAECF_Low);0;PrecTest(DE_VAECF_High,DE_VAECF_Mid);PrecTest(DE_VAECF_Mid,DE_VAECF_Low);0;PrecTest(MED_VAECF_High,MED_VAECF_Mid);PrecTest(MED_VAECF_Mid,MED_VAECF_Low)];

PrecisionTTest=table(Group, WMF_, IBPR_, SKM_,  VAECF_);
save PrecisionTTest PrecisionTTest

fprintf('Precision values are calculated \n');

%% Table for Recall values
Group=["Size-High"; "Size-Mid";"----"; "Mean-High"; "Mean-Mid"; "Mean-Low"; "----"; "MeanDev-High"; "MeanDev-Mid"; "MeanDev-Low"; "----"; "MeanEnt-High"; "MeanEnt-Mid"; "MeanEnt-Low"; "----"; "DevEnt-High"; "DevEnt-Mid"; "DevEnt-Low"; "----"; "MeanDevEnt-High"; "MeanDevEnt-Mid"; "MeanDevEnt-Low"];
WMF_ = [RecallCal(S_WMF_High); RecallCal(S_WMF_Mid);0;RecallCal(M_WMF_High); RecallCal(M_WMF_Mid); RecallCal(M_WMF_Low); 0;RecallCal(MD_WMF_High); RecallCal(MD_WMF_Mid); RecallCal(MD_WMF_Low); 0; RecallCal(ME_WMF_High); RecallCal(ME_WMF_Mid); RecallCal(ME_WMF_Low); 0; RecallCal(DE_WMF_High); RecallCal(DE_WMF_Mid);RecallCal(DE_WMF_Low); 0; RecallCal(MED_WMF_High); RecallCal(MED_WMF_Mid); RecallCal(MED_WMF_Low)];
IBPR_ = [RecallCal(S_IBPR_High); RecallCal(S_IBPR_Mid);0;RecallCal(M_IBPR_High); RecallCal(M_IBPR_Mid); RecallCal(M_IBPR_Low); 0;RecallCal(MD_IBPR_High); RecallCal(MD_IBPR_Mid); RecallCal(MD_IBPR_Low); 0; RecallCal(ME_IBPR_High); RecallCal(ME_IBPR_Mid); RecallCal(ME_IBPR_Low); 0; RecallCal(DE_IBPR_High); RecallCal(DE_IBPR_Mid);RecallCal(DE_IBPR_Low); 0; RecallCal(MED_IBPR_High); RecallCal(MED_IBPR_Mid); RecallCal(MED_IBPR_Low)];
SKM_ = [RecallCal(S_SKM_High); RecallCal(S_SKM_Mid);0;RecallCal(M_SKM_High); RecallCal(M_SKM_Mid); RecallCal(M_SKM_Low); 0;RecallCal(MD_SKM_High); RecallCal(MD_SKM_Mid); RecallCal(MD_SKM_Low); 0; RecallCal(ME_SKM_High); RecallCal(ME_SKM_Mid); RecallCal(ME_SKM_Low); 0; RecallCal(DE_SKM_High); RecallCal(DE_SKM_Mid);RecallCal(DE_SKM_Low); 0; RecallCal(MED_SKM_High); RecallCal(MED_SKM_Mid); RecallCal(MED_SKM_Low)];
VAECF_ = [RecallCal(S_VAECF_High); RecallCal(S_VAECF_Mid);0;RecallCal(M_VAECF_High); RecallCal(M_VAECF_Mid); RecallCal(M_VAECF_Low); 0;RecallCal(MD_VAECF_High); RecallCal(MD_VAECF_Mid); RecallCal(MD_VAECF_Low); 0; RecallCal(ME_VAECF_High); RecallCal(ME_VAECF_Mid); RecallCal(ME_VAECF_Low); 0; RecallCal(DE_VAECF_High); RecallCal(DE_VAECF_Mid);RecallCal(DE_VAECF_Low); 0; RecallCal(MED_VAECF_High); RecallCal(MED_VAECF_Mid); RecallCal(MED_VAECF_Low)];

RecallTable=table(Group, WMF_, IBPR_, SKM_,  VAECF_);
save Recall RecallTable

%% Table for TTEST of Recall values
Group=["Size-High/Mid"; "----"; "Mean-High/Mid"; "Mean-Mid/Low"; "----"; "MeanDev-High/Mid"; "MeanDev-Mid/Low"; "----"; "MeanEnt-High/Mid"; "MeanEnt-Mid/Low"; "----"; "DevEnt-High/Mid"; "DevEnt-Mid/Low"; "----"; "MeanDevEnt-High/Mid"; "MeanDevEnt-Mid/Low"];
WMF_ = [RecallTest(S_WMF_High,S_WMF_Mid); 0;RecallTest(M_WMF_High,M_WMF_Mid);RecallTest(M_WMF_Mid,M_WMF_Low);0;RecallTest(MD_WMF_High,MD_WMF_Mid);RecallTest(MD_WMF_Mid,MD_WMF_Low);0;RecallTest(ME_WMF_High,ME_WMF_Mid);RecallTest(ME_WMF_Mid,ME_WMF_Low);0;RecallTest(DE_WMF_High,DE_WMF_Mid);RecallTest(DE_WMF_Mid,DE_WMF_Low);0;RecallTest(MED_WMF_High,MED_WMF_Mid);RecallTest(MED_WMF_Mid,MED_WMF_Low)];
IBPR_ = [RecallTest(S_IBPR_High,S_IBPR_Mid); 0;RecallTest(M_IBPR_High,M_IBPR_Mid);RecallTest(M_IBPR_Mid,M_IBPR_Low);0;RecallTest(MD_IBPR_High,MD_IBPR_Mid);RecallTest(MD_IBPR_Mid,MD_IBPR_Low);0;RecallTest(ME_IBPR_High,ME_IBPR_Mid);RecallTest(ME_IBPR_Mid,ME_IBPR_Low);0;RecallTest(DE_IBPR_High,DE_IBPR_Mid);RecallTest(DE_IBPR_Mid,DE_IBPR_Low);0;RecallTest(MED_IBPR_High,MED_IBPR_Mid);RecallTest(MED_IBPR_Mid,MED_IBPR_Low)];
SKM_ = [RecallTest(S_SKM_High,S_SKM_Mid); 0;RecallTest(M_SKM_High,M_SKM_Mid);RecallTest(M_SKM_Mid,M_SKM_Low);0;RecallTest(MD_SKM_High,MD_SKM_Mid);RecallTest(MD_SKM_Mid,MD_SKM_Low);0;RecallTest(ME_SKM_High,ME_SKM_Mid);RecallTest(ME_SKM_Mid,ME_SKM_Low);0;RecallTest(DE_SKM_High,DE_SKM_Mid);RecallTest(DE_SKM_Mid,DE_SKM_Low);0;RecallTest(MED_SKM_High,MED_SKM_Mid);RecallTest(MED_SKM_Mid,MED_SKM_Low)];
VAECF_ = [RecallTest(S_VAECF_High,S_VAECF_Mid); 0;RecallTest(M_VAECF_High,M_VAECF_Mid);RecallTest(M_VAECF_Mid,M_VAECF_Low);0;RecallTest(MD_VAECF_High,MD_VAECF_Mid);RecallTest(MD_VAECF_Mid,MD_VAECF_Low);0;RecallTest(ME_VAECF_High,ME_VAECF_Mid);RecallTest(ME_VAECF_Mid,ME_VAECF_Low);0;RecallTest(DE_VAECF_High,DE_VAECF_Mid);RecallTest(DE_VAECF_Mid,DE_VAECF_Low);0;RecallTest(MED_VAECF_High,MED_VAECF_Mid);RecallTest(MED_VAECF_Mid,MED_VAECF_Low)];

RecallTTest=table(Group, WMF_, IBPR_, SKM_,  VAECF_);
save RecallTTest RecallTTest

fprintf('Recall values are calculated \n');

%% Table for APLT values
Group=["Size-High"; "Size-Mid";"----"; "Mean-High"; "Mean-Mid"; "Mean-Low"; "----"; "MeanDev-High"; "MeanDev-Mid"; "MeanDev-Low"; "----"; "MeanEnt-High"; "MeanEnt-Mid"; "MeanEnt-Low"; "----"; "DevEnt-High"; "DevEnt-Mid"; "DevEnt-Low"; "----"; "MeanDevEnt-High"; "MeanDevEnt-Mid"; "MeanDevEnt-Low"];
WMF_ = [APLTCal(S_WMF_High); APLTCal(S_WMF_Mid);0;APLTCal(M_WMF_High); APLTCal(M_WMF_Mid); APLTCal(M_WMF_Low); 0;APLTCal(MD_WMF_High); APLTCal(MD_WMF_Mid); APLTCal(MD_WMF_Low); 0; APLTCal(ME_WMF_High); APLTCal(ME_WMF_Mid); APLTCal(ME_WMF_Low); 0; APLTCal(DE_WMF_High); APLTCal(DE_WMF_Mid);APLTCal(DE_WMF_Low); 0; APLTCal(MED_WMF_High); APLTCal(MED_WMF_Mid); APLTCal(MED_WMF_Low)];
IBPR_ = [APLTCal(S_IBPR_High); APLTCal(S_IBPR_Mid);0;APLTCal(M_IBPR_High); APLTCal(M_IBPR_Mid); APLTCal(M_IBPR_Low); 0;APLTCal(MD_IBPR_High); APLTCal(MD_IBPR_Mid); APLTCal(MD_IBPR_Low); 0; APLTCal(ME_IBPR_High); APLTCal(ME_IBPR_Mid); APLTCal(ME_IBPR_Low); 0; APLTCal(DE_IBPR_High); APLTCal(DE_IBPR_Mid);APLTCal(DE_IBPR_Low); 0; APLTCal(MED_IBPR_High); APLTCal(MED_IBPR_Mid); APLTCal(MED_IBPR_Low)];
SKM_ = [APLTCal(S_SKM_High); APLTCal(S_SKM_Mid);0;APLTCal(M_SKM_High); APLTCal(M_SKM_Mid); APLTCal(M_SKM_Low); 0;APLTCal(MD_SKM_High); APLTCal(MD_SKM_Mid); APLTCal(MD_SKM_Low); 0; APLTCal(ME_SKM_High); APLTCal(ME_SKM_Mid); APLTCal(ME_SKM_Low); 0; APLTCal(DE_SKM_High); APLTCal(DE_SKM_Mid);APLTCal(DE_SKM_Low); 0; APLTCal(MED_SKM_High); APLTCal(MED_SKM_Mid); APLTCal(MED_SKM_Low)];
VAECF_ = [APLTCal(S_VAECF_High); APLTCal(S_VAECF_Mid);0;APLTCal(M_VAECF_High); APLTCal(M_VAECF_Mid); APLTCal(M_VAECF_Low); 0;APLTCal(MD_VAECF_High); APLTCal(MD_VAECF_Mid); APLTCal(MD_VAECF_Low); 0; APLTCal(ME_VAECF_High); APLTCal(ME_VAECF_Mid); APLTCal(ME_VAECF_Low); 0; APLTCal(DE_VAECF_High); APLTCal(DE_VAECF_Mid);APLTCal(DE_VAECF_Low); 0; APLTCal(MED_VAECF_High); APLTCal(MED_VAECF_Mid); APLTCal(MED_VAECF_Low)];

APLTTable=table(Group, WMF_, IBPR_, SKM_,  VAECF_);
save APLT APLTTable

%% Table for TTEST of APLT values
Group=["Size-High/Mid"; "----"; "Mean-High/Mid"; "Mean-Mid/Low"; "----"; "MeanDev-High/Mid"; "MeanDev-Mid/Low"; "----"; "MeanEnt-High/Mid"; "MeanEnt-Mid/Low"; "----"; "DevEnt-High/Mid"; "DevEnt-Mid/Low"; "----"; "MeanDevEnt-High/Mid"; "MeanDevEnt-Mid/Low"];
WMF_ = [APLTTest(S_WMF_High,S_WMF_Mid); 0;APLTTest(M_WMF_High,M_WMF_Mid);APLTTest(M_WMF_Mid,M_WMF_Low);0;APLTTest(MD_WMF_High,MD_WMF_Mid);APLTTest(MD_WMF_Mid,MD_WMF_Low);0;APLTTest(ME_WMF_High,ME_WMF_Mid);APLTTest(ME_WMF_Mid,ME_WMF_Low);0;APLTTest(DE_WMF_High,DE_WMF_Mid);APLTTest(DE_WMF_Mid,DE_WMF_Low);0;APLTTest(MED_WMF_High,MED_WMF_Mid);APLTTest(MED_WMF_Mid,MED_WMF_Low)];
IBPR_ = [APLTTest(S_IBPR_High,S_IBPR_Mid); 0;APLTTest(M_IBPR_High,M_IBPR_Mid);APLTTest(M_IBPR_Mid,M_IBPR_Low);0;APLTTest(MD_IBPR_High,MD_IBPR_Mid);APLTTest(MD_IBPR_Mid,MD_IBPR_Low);0;APLTTest(ME_IBPR_High,ME_IBPR_Mid);APLTTest(ME_IBPR_Mid,ME_IBPR_Low);0;APLTTest(DE_IBPR_High,DE_IBPR_Mid);APLTTest(DE_IBPR_Mid,DE_IBPR_Low);0;APLTTest(MED_IBPR_High,MED_IBPR_Mid);APLTTest(MED_IBPR_Mid,MED_IBPR_Low)];
SKM_ = [APLTTest(S_SKM_High,S_SKM_Mid); 0;APLTTest(M_SKM_High,M_SKM_Mid);APLTTest(M_SKM_Mid,M_SKM_Low);0;APLTTest(MD_SKM_High,MD_SKM_Mid);APLTTest(MD_SKM_Mid,MD_SKM_Low);0;APLTTest(ME_SKM_High,ME_SKM_Mid);APLTTest(ME_SKM_Mid,ME_SKM_Low);0;APLTTest(DE_SKM_High,DE_SKM_Mid);APLTTest(DE_SKM_Mid,DE_SKM_Low);0;APLTTest(MED_SKM_High,MED_SKM_Mid);APLTTest(MED_SKM_Mid,MED_SKM_Low)];
VAECF_ = [APLTTest(S_VAECF_High,S_VAECF_Mid); 0;APLTTest(M_VAECF_High,M_VAECF_Mid);APLTTest(M_VAECF_Mid,M_VAECF_Low);0;APLTTest(MD_VAECF_High,MD_VAECF_Mid);APLTTest(MD_VAECF_Mid,MD_VAECF_Low);0;APLTTest(ME_VAECF_High,ME_VAECF_Mid);APLTTest(ME_VAECF_Mid,ME_VAECF_Low);0;APLTTest(DE_VAECF_High,DE_VAECF_Mid);APLTTest(DE_VAECF_Mid,DE_VAECF_Low);0;APLTTest(MED_VAECF_High,MED_VAECF_Mid);APLTTest(MED_VAECF_Mid,MED_VAECF_Low)];

APLTTTest=table(Group, WMF_, IBPR_, SKM_,  VAECF_);
save APLTTTest APLTTTest

fprintf('APLT values are calculated \n');

%% Table for Novelty values
Group=["Size-High"; "Size-Mid";"----"; "Mean-High"; "Mean-Mid"; "Mean-Low"; "----"; "MeanDev-High"; "MeanDev-Mid"; "MeanDev-Low"; "----"; "MeanEnt-High"; "MeanEnt-Mid"; "MeanEnt-Low"; "----"; "DevEnt-High"; "DevEnt-Mid"; "DevEnt-Low"; "----"; "MeanDevEnt-High"; "MeanDevEnt-Mid"; "MeanDevEnt-Low"];
WMF_ = [NoveltyCal(S_WMF_High); NoveltyCal(S_WMF_Mid);0;NoveltyCal(M_WMF_High); NoveltyCal(M_WMF_Mid); NoveltyCal(M_WMF_Low); 0;NoveltyCal(MD_WMF_High); NoveltyCal(MD_WMF_Mid); NoveltyCal(MD_WMF_Low); 0; NoveltyCal(ME_WMF_High); NoveltyCal(ME_WMF_Mid); NoveltyCal(ME_WMF_Low); 0; NoveltyCal(DE_WMF_High); NoveltyCal(DE_WMF_Mid);NoveltyCal(DE_WMF_Low); 0; NoveltyCal(MED_WMF_High); NoveltyCal(MED_WMF_Mid); NoveltyCal(MED_WMF_Low)];
IBPR_ = [NoveltyCal(S_IBPR_High); NoveltyCal(S_IBPR_Mid);0;NoveltyCal(M_IBPR_High); NoveltyCal(M_IBPR_Mid); NoveltyCal(M_IBPR_Low); 0;NoveltyCal(MD_IBPR_High); NoveltyCal(MD_IBPR_Mid); NoveltyCal(MD_IBPR_Low); 0; NoveltyCal(ME_IBPR_High); NoveltyCal(ME_IBPR_Mid); NoveltyCal(ME_IBPR_Low); 0; NoveltyCal(DE_IBPR_High); NoveltyCal(DE_IBPR_Mid);NoveltyCal(DE_IBPR_Low); 0; NoveltyCal(MED_IBPR_High); NoveltyCal(MED_IBPR_Mid); NoveltyCal(MED_IBPR_Low)];
SKM_ = [NoveltyCal(S_SKM_High); NoveltyCal(S_SKM_Mid);0;NoveltyCal(M_SKM_High); NoveltyCal(M_SKM_Mid); NoveltyCal(M_SKM_Low); 0;NoveltyCal(MD_SKM_High); NoveltyCal(MD_SKM_Mid); NoveltyCal(MD_SKM_Low); 0; NoveltyCal(ME_SKM_High); NoveltyCal(ME_SKM_Mid); NoveltyCal(ME_SKM_Low); 0; NoveltyCal(DE_SKM_High); NoveltyCal(DE_SKM_Mid);NoveltyCal(DE_SKM_Low); 0; NoveltyCal(MED_SKM_High); NoveltyCal(MED_SKM_Mid); NoveltyCal(MED_SKM_Low)];
VAECF_ = [NoveltyCal(S_VAECF_High); NoveltyCal(S_VAECF_Mid);0;NoveltyCal(M_VAECF_High); NoveltyCal(M_VAECF_Mid); NoveltyCal(M_VAECF_Low); 0;NoveltyCal(MD_VAECF_High); NoveltyCal(MD_VAECF_Mid); NoveltyCal(MD_VAECF_Low); 0; NoveltyCal(ME_VAECF_High); NoveltyCal(ME_VAECF_Mid); NoveltyCal(ME_VAECF_Low); 0; NoveltyCal(DE_VAECF_High); NoveltyCal(DE_VAECF_Mid);NoveltyCal(DE_VAECF_Low); 0; NoveltyCal(MED_VAECF_High); NoveltyCal(MED_VAECF_Mid); NoveltyCal(MED_VAECF_Low)];

NoveltyTable=table(Group, WMF_, IBPR_, SKM_,  VAECF_);
save Novelty NoveltyTable

%% Table for TTEST of Novelty values
Group=["Size-High/Mid"; "----"; "Mean-High/Mid"; "Mean-Mid/Low"; "----"; "MeanDev-High/Mid"; "MeanDev-Mid/Low"; "----"; "MeanEnt-High/Mid"; "MeanEnt-Mid/Low"; "----"; "DevEnt-High/Mid"; "DevEnt-Mid/Low"; "----"; "MeanDevEnt-High/Mid"; "MeanDevEnt-Mid/Low"];
WMF_ = [NoveltyTest(S_WMF_High,S_WMF_Mid); 0;NoveltyTest(M_WMF_High,M_WMF_Mid);NoveltyTest(M_WMF_Mid,M_WMF_Low);0;NoveltyTest(MD_WMF_High,MD_WMF_Mid);NoveltyTest(MD_WMF_Mid,MD_WMF_Low);0;NoveltyTest(ME_WMF_High,ME_WMF_Mid);NoveltyTest(ME_WMF_Mid,ME_WMF_Low);0;NoveltyTest(DE_WMF_High,DE_WMF_Mid);NoveltyTest(DE_WMF_Mid,DE_WMF_Low);0;NoveltyTest(MED_WMF_High,MED_WMF_Mid);NoveltyTest(MED_WMF_Mid,MED_WMF_Low)];
IBPR_ = [NoveltyTest(S_IBPR_High,S_IBPR_Mid); 0;NoveltyTest(M_IBPR_High,M_IBPR_Mid);NoveltyTest(M_IBPR_Mid,M_IBPR_Low);0;NoveltyTest(MD_IBPR_High,MD_IBPR_Mid);NoveltyTest(MD_IBPR_Mid,MD_IBPR_Low);0;NoveltyTest(ME_IBPR_High,ME_IBPR_Mid);NoveltyTest(ME_IBPR_Mid,ME_IBPR_Low);0;NoveltyTest(DE_IBPR_High,DE_IBPR_Mid);NoveltyTest(DE_IBPR_Mid,DE_IBPR_Low);0;NoveltyTest(MED_IBPR_High,MED_IBPR_Mid);NoveltyTest(MED_IBPR_Mid,MED_IBPR_Low)];
SKM_ = [NoveltyTest(S_SKM_High,S_SKM_Mid); 0;NoveltyTest(M_SKM_High,M_SKM_Mid);NoveltyTest(M_SKM_Mid,M_SKM_Low);0;NoveltyTest(MD_SKM_High,MD_SKM_Mid);NoveltyTest(MD_SKM_Mid,MD_SKM_Low);0;NoveltyTest(ME_SKM_High,ME_SKM_Mid);NoveltyTest(ME_SKM_Mid,ME_SKM_Low);0;NoveltyTest(DE_SKM_High,DE_SKM_Mid);NoveltyTest(DE_SKM_Mid,DE_SKM_Low);0;NoveltyTest(MED_SKM_High,MED_SKM_Mid);NoveltyTest(MED_SKM_Mid,MED_SKM_Low)];
VAECF_ = [NoveltyTest(S_VAECF_High,S_VAECF_Mid); 0;NoveltyTest(M_VAECF_High,M_VAECF_Mid);NoveltyTest(M_VAECF_Mid,M_VAECF_Low);0;NoveltyTest(MD_VAECF_High,MD_VAECF_Mid);NoveltyTest(MD_VAECF_Mid,MD_VAECF_Low);0;NoveltyTest(ME_VAECF_High,ME_VAECF_Mid);NoveltyTest(ME_VAECF_Mid,ME_VAECF_Low);0;NoveltyTest(DE_VAECF_High,DE_VAECF_Mid);NoveltyTest(DE_VAECF_Mid,DE_VAECF_Low);0;NoveltyTest(MED_VAECF_High,MED_VAECF_Mid);NoveltyTest(MED_VAECF_Mid,MED_VAECF_Low)];

NoveltyTTest=table(Group, WMF_, IBPR_, SKM_,  VAECF_);
save NoveltyTTest NoveltyTTest

fprintf('Novelty values are calculated \n');


%% Table for F1 values
Group=["Size-High"; "Size-Mid";"----"; "Mean-High"; "Mean-Mid"; "Mean-Low"; "----"; "MeanDev-High"; "MeanDev-Mid"; "MeanDev-Low"; "----"; "MeanEnt-High"; "MeanEnt-Mid"; "MeanEnt-Low"; "----"; "DevEnt-High"; "DevEnt-Mid"; "DevEnt-Low"; "----"; "MeanDevEnt-High"; "MeanDevEnt-Mid"; "MeanDevEnt-Low"];

WMF_ = [F1Cal(S_WMF_High); F1Cal(S_WMF_Mid);0;F1Cal(M_WMF_High); F1Cal(M_WMF_Mid); F1Cal(M_WMF_Low); 0;F1Cal(MD_WMF_High); F1Cal(MD_WMF_Mid); F1Cal(MD_WMF_Low); 0; F1Cal(ME_WMF_High); F1Cal(ME_WMF_Mid); F1Cal(ME_WMF_Low); 0; F1Cal(DE_WMF_High); F1Cal(DE_WMF_Mid);F1Cal(DE_WMF_Low); 0; F1Cal(MED_WMF_High); F1Cal(MED_WMF_Mid); F1Cal(MED_WMF_Low)];
IBPR_ = [F1Cal(S_IBPR_High); F1Cal(S_IBPR_Mid);0;F1Cal(M_IBPR_High); F1Cal(M_IBPR_Mid); F1Cal(M_IBPR_Low); 0;F1Cal(MD_IBPR_High); F1Cal(MD_IBPR_Mid); F1Cal(MD_IBPR_Low); 0; F1Cal(ME_IBPR_High); F1Cal(ME_IBPR_Mid); F1Cal(ME_IBPR_Low); 0; F1Cal(DE_IBPR_High); F1Cal(DE_IBPR_Mid);F1Cal(DE_IBPR_Low); 0; F1Cal(MED_IBPR_High); F1Cal(MED_IBPR_Mid); F1Cal(MED_IBPR_Low)];
SKM_ = [F1Cal(S_SKM_High); F1Cal(S_SKM_Mid);0;F1Cal(M_SKM_High); F1Cal(M_SKM_Mid); F1Cal(M_SKM_Low); 0;F1Cal(MD_SKM_High); F1Cal(MD_SKM_Mid); F1Cal(MD_SKM_Low); 0; F1Cal(ME_SKM_High); F1Cal(ME_SKM_Mid); F1Cal(ME_SKM_Low); 0; F1Cal(DE_SKM_High); F1Cal(DE_SKM_Mid);F1Cal(DE_SKM_Low); 0; F1Cal(MED_SKM_High); F1Cal(MED_SKM_Mid); F1Cal(MED_SKM_Low)];
VAECF_ = [F1Cal(S_VAECF_High); F1Cal(S_VAECF_Mid);0;F1Cal(M_VAECF_High); F1Cal(M_VAECF_Mid); F1Cal(M_VAECF_Low); 0;F1Cal(MD_VAECF_High); F1Cal(MD_VAECF_Mid); F1Cal(MD_VAECF_Low); 0; F1Cal(ME_VAECF_High); F1Cal(ME_VAECF_Mid); F1Cal(ME_VAECF_Low); 0; F1Cal(DE_VAECF_High); F1Cal(DE_VAECF_Mid);F1Cal(DE_VAECF_Low); 0; F1Cal(MED_VAECF_High); F1Cal(MED_VAECF_Mid); F1Cal(MED_VAECF_Low)];

F1Table=table(Group, WMF_, IBPR_, SKM_,  VAECF_);
save F1Score F1Table

%% Table for TTEST of F1 values
Group=["Size-High/Mid"; "----"; "Mean-High/Mid"; "Mean-Mid/Low"; "----"; "MeanDev-High/Mid"; "MeanDev-Mid/Low"; "----"; "MeanEnt-High/Mid"; "MeanEnt-Mid/Low"; "----"; "DevEnt-High/Mid"; "DevEnt-Mid/Low"; "----"; "MeanDevEnt-High/Mid"; "MeanDevEnt-Mid/Low"];
WMF_ = [F1TTest(S_WMF_High,S_WMF_Mid); 0;F1TTest(M_WMF_High,M_WMF_Mid);F1TTest(M_WMF_Mid,M_WMF_Low);0;F1TTest(MD_WMF_High,MD_WMF_Mid);F1TTest(MD_WMF_Mid,MD_WMF_Low);0;F1TTest(ME_WMF_High,ME_WMF_Mid);F1TTest(ME_WMF_Mid,ME_WMF_Low);0;F1TTest(DE_WMF_High,DE_WMF_Mid);F1TTest(DE_WMF_Mid,DE_WMF_Low);0;F1TTest(MED_WMF_High,MED_WMF_Mid);F1TTest(MED_WMF_Mid,MED_WMF_Low)];
IBPR_ = [F1TTest(S_IBPR_High,S_IBPR_Mid); 0;F1TTest(M_IBPR_High,M_IBPR_Mid);F1TTest(M_IBPR_Mid,M_IBPR_Low);0;F1TTest(MD_IBPR_High,MD_IBPR_Mid);F1TTest(MD_IBPR_Mid,MD_IBPR_Low);0;F1TTest(ME_IBPR_High,ME_IBPR_Mid);F1TTest(ME_IBPR_Mid,ME_IBPR_Low);0;F1TTest(DE_IBPR_High,DE_IBPR_Mid);F1TTest(DE_IBPR_Mid,DE_IBPR_Low);0;F1TTest(MED_IBPR_High,MED_IBPR_Mid);F1TTest(MED_IBPR_Mid,MED_IBPR_Low)];
SKM_ = [F1TTest(S_SKM_High,S_SKM_Mid); 0;F1TTest(M_SKM_High,M_SKM_Mid);F1TTest(M_SKM_Mid,M_SKM_Low);0;F1TTest(MD_SKM_High,MD_SKM_Mid);F1TTest(MD_SKM_Mid,MD_SKM_Low);0;F1TTest(ME_SKM_High,ME_SKM_Mid);F1TTest(ME_SKM_Mid,ME_SKM_Low);0;F1TTest(DE_SKM_High,DE_SKM_Mid);F1TTest(DE_SKM_Mid,DE_SKM_Low);0;F1TTest(MED_SKM_High,MED_SKM_Mid);F1TTest(MED_SKM_Mid,MED_SKM_Low)];
VAECF_ = [F1TTest(S_VAECF_High,S_VAECF_Mid); 0;F1TTest(M_VAECF_High,M_VAECF_Mid);F1TTest(M_VAECF_Mid,M_VAECF_Low);0;F1TTest(MD_VAECF_High,MD_VAECF_Mid);F1TTest(MD_VAECF_Mid,MD_VAECF_Low);0;F1TTest(ME_VAECF_High,ME_VAECF_Mid);F1TTest(ME_VAECF_Mid,ME_VAECF_Low);0;F1TTest(DE_VAECF_High,DE_VAECF_Mid);F1TTest(DE_VAECF_Mid,DE_VAECF_Low);0;F1TTest(MED_VAECF_High,MED_VAECF_Mid);F1TTest(MED_VAECF_Mid,MED_VAECF_Low)];

F1TTestTable=table(Group, WMF_, IBPR_, SKM_,  VAECF_);
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
