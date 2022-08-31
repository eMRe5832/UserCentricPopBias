function [DeltaGAPImp, nDCGImp, F1ScoreImp, APLTImp, NoveltyImp] = Compare()
load('OriginalResults\APLT.mat');
load('OriginalResults\DeltaGAP.mat');
load('OriginalResults\F1Score.mat');
load('OriginalResults\nDCG.mat');
load('OriginalResults\Novelty.mat');

S = vartype("numeric");
Or_APLT = APLTTable{1:22,S}; Or_DeltaGAP=DeltaGAP{1:22,S}; Or_F1Score=F1Table{1:22,S}; Or_nDCG=nDCGTable{1:22,S}; Or_Novelty=NoveltyTable{1:22,S}; 

load('DB-VaR\Results\APLT.mat');
load('DB-VaR\Results\DeltaGAP.mat');
load('DB-VaR\Results\F1Score.mat');
load('DB-VaR\Results\nDCG.mat');
load('DB-VaR\Results\Novelty.mat');

Var_APLT = APLTTable{1:22,S}; Var_DeltaGAP=DeltaGAP{1:22,S}; Var_F1Score=F1Table{1:22,S}; Var_nDCG=nDCGTable{1:22,S}; Var_Novelty=NoveltyTable{1:22,S}; 

load('DB-Aug\Results\APLT.mat');
load('DB-Aug\Results\DeltaGAP.mat');
load('DB-Aug\Results\F1Score.mat');
load('DB-Aug\Results\nDCG.mat');
load('DB-Aug\Results\Novelty.mat');

Aug_APLT = APLTTable{1:22,S}; Aug_DeltaGAP=DeltaGAP{1:22,S}; Aug_F1Score=F1Table{1:22,S}; Aug_nDCG=nDCGTable{1:22,S}; Aug_Novelty=NoveltyTable{1:22,S};  

load('DB-Mul\Results\APLT.mat');
load('DB-Mul\Results\DeltaGAP.mat');
load('DB-Mul\Results\F1Score.mat');
load('DB-Mul\Results\nDCG.mat');
load('DB-Mul\Results\Novelty.mat');

Mul_APLT = APLTTable{1:22,S}; Mul_DeltaGAP=DeltaGAP{1:22,S}; Mul_F1Score=F1Table{1:22,S}; Mul_nDCG=nDCGTable{1:22,S}; Mul_Novelty=NoveltyTable{1:22,S}; 

load('DB-xQuad\Results\APLT.mat');
load('DB-xQuad\Results\DeltaGAP.mat');
load('DB-xQuad\Results\F1Score.mat');
load('DB-xQuad\Results\nDCG.mat');
load('DB-xQuad\Results\Novelty.mat');

xQuad_APLT = APLTTable{1:22,S}; xQuad_DeltaGAP=DeltaGAP{1:22,S}; xQuad_F1Score=F1Table{1:22,S}; xQuad_nDCG=nDCGTable{1:22,S}; xQuad_Novelty=NoveltyTable{1:22,S}; 

nDCGImp = zeros(22,7);
nDCGImp(:,1)=Or_nDCG(:,10); nDCGImp(:,2)=Aug_nDCG(:,4); nDCGImp(:,3)=Mul_nDCG(:,4); nDCGImp(:,4)=xQuad_nDCG(:,4);

a=(nDCGImp(:,2)-nDCGImp(:,1));
nDCGImp(:,5)=(a./nDCGImp(:,1))*100;

a=(nDCGImp(:,3)-nDCGImp(:,1));
nDCGImp(:,6)=(a./nDCGImp(:,1))*100;

a=(nDCGImp(:,4)-nDCGImp(:,1));
nDCGImp(:,7)=(a./nDCGImp(:,1))*100;

DeltaGAPImp = zeros(22,7);
DeltaGAPImp(:,1)=Or_DeltaGAP(:,10); DeltaGAPImp(:,2)=Aug_DeltaGAP(:,4); DeltaGAPImp(:,3)=Mul_DeltaGAP(:,4); DeltaGAPImp(:,4)=xQuad_DeltaGAP(:,4);

a=(DeltaGAPImp(:,2)-DeltaGAPImp(:,1));
DeltaGAPImp(:,5)=(a./DeltaGAPImp(:,1))*100;

a=(DeltaGAPImp(:,3)-DeltaGAPImp(:,1));
DeltaGAPImp(:,6)=(a./DeltaGAPImp(:,1))*100;

a=(DeltaGAPImp(:,4)-DeltaGAPImp(:,1));
DeltaGAPImp(:,7)=(a./DeltaGAPImp(:,1))*100;

F1ScoreImp = zeros(22,7);
F1ScoreImp(:,1)=Or_F1Score(:,10); F1ScoreImp(:,2)=Aug_F1Score(:,4); F1ScoreImp(:,3)=Mul_F1Score(:,4); F1ScoreImp(:,4)=xQuad_F1Score(:,4);

a=(F1ScoreImp(:,2)-F1ScoreImp(:,1));
F1ScoreImp(:,5)=(a./F1ScoreImp(:,1))*100;

a=(F1ScoreImp(:,3)-F1ScoreImp(:,1));
F1ScoreImp(:,6)=(a./F1ScoreImp(:,1))*100;

a=(F1ScoreImp(:,4)-F1ScoreImp(:,1));
F1ScoreImp(:,7)=(a./F1ScoreImp(:,1))*100;

NoveltyImp = zeros(22,7);
NoveltyImp(:,1)=Or_Novelty(:,10); NoveltyImp(:,2)=Aug_Novelty(:,4); NoveltyImp(:,3)=Mul_Novelty(:,4); NoveltyImp(:,4)=xQuad_Novelty(:,4);

a=(NoveltyImp(:,2)-NoveltyImp(:,1));
NoveltyImp(:,5)=(a./NoveltyImp(:,1))*100;

a=(NoveltyImp(:,3)-NoveltyImp(:,1));
NoveltyImp(:,6)=(a./NoveltyImp(:,1))*100;

a=(NoveltyImp(:,4)-NoveltyImp(:,1));
NoveltyImp(:,7)=(a./NoveltyImp(:,1))*100;


APLTImp = zeros(22,7);
APLTImp(:,1)=Or_APLT(:,10); APLTImp(:,2)=Aug_APLT(:,4); APLTImp(:,3)=Mul_APLT(:,4); APLTImp(:,4)=xQuad_APLT(:,4);

a=(APLTImp(:,2)-APLTImp(:,1));
APLTImp(:,5)=(a./APLTImp(:,1))*100;

a=(APLTImp(:,3)-APLTImp(:,1));
APLTImp(:,6)=(a./APLTImp(:,1))*100;

a=(APLTImp(:,4)-APLTImp(:,1));
APLTImp(:,7)=(a./APLTImp(:,1))*100;

DeltaGAPImp(:,1)=[];DeltaGAPImp(:,1)=[];DeltaGAPImp(:,1)=[];DeltaGAPImp(:,1)=[];
nDCGImp(:,1)=[];nDCGImp(:,1)=[];nDCGImp(:,1)=[];nDCGImp(:,1)=[];
F1ScoreImp(:,1)=[];F1ScoreImp(:,1)=[];F1ScoreImp(:,1)=[];F1ScoreImp(:,1)=[];
APLTImp(:,1)=[];APLTImp(:,1)=[];APLTImp(:,1)=[];APLTImp(:,1)=[];
NoveltyImp(:,1)=[];NoveltyImp(:,1)=[];NoveltyImp(:,1)=[];NoveltyImp(:,1)=[];

titles = {'Aug' 'Mul' 'xQuad'};
C1 = [titles; num2cell(DeltaGAPImp)];
writecell(C1,'GAP-Imp.csv','Delimiter',';');

titles = {'Aug' 'Mul' 'xQuad'};
C1 = [titles; num2cell(nDCGImp)];
writecell(C1,'nDCG-Imp.csv','Delimiter',';');

titles = {'Aug' 'Mul' 'xQuad'};
C1 = [titles; num2cell(F1ScoreImp)];
writecell(C1,'F1-Imp.csv','Delimiter',';');

titles = {'Aug' 'Mul' 'xQuad'};
C1 = [titles; num2cell(APLTImp)];
writecell(C1,'APLT-Imp.csv','Delimiter',';');

titles = {'Aug' 'Mul' 'xQuad'};
C1 = [titles; num2cell(NoveltyImp)];
writecell(C1,'Novelty-Imp.csv','Delimiter',';');

return
end