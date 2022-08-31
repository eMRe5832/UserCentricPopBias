function  [Avg,Results]=MetricALL(Dataset, TopN)
format short g
% ----Input ----
% Dataset: Original data: mxn format
% PopItems: Average Popularity of the items for the corresponding dataset.
% Features: Feature matrix for the corresponding dataset.
% TopN: TopN recommendation list for the corresponding dataset.
% PredMatrix: Prediction matrix mxn format

%% Construct tail item set
Pop=sum(Dataset~=0);
PopItems=Pop/size(Dataset,1);
[outPop,idxPop]=sort(Pop,'descend');
LimitHead=(sum(Pop))*20/100;
top=0;HeadIDX=[]; TailIDX=[];
for i=1:size(idxPop,2)
    if (top<=LimitHead)
        top=top+outPop(1,i);
        HeadIDX = [HeadIDX; idxPop(1,i)];
    else
        top=top+outPop(1,i);
        TailIDX = [TailIDX; idxPop(1,i)];
    end
end

%% Calculate metrics for all users:
GAPp=zeros(size(Dataset,1),1);
GAPr=zeros(size(Dataset,1),1);
NDCG=zeros(size(Dataset,1),1);
Precision=zeros(size(Dataset,1),1);
Recall=zeros(size(Dataset,1),1);
F1=zeros(size(Dataset,1),1);
APLT=zeros(size(Dataset,1),1);
Novelty=zeros(size(Dataset,1),1);

for user=1:size(Dataset,1)
    GAPp(user,1)=GAPProfileFunc(Dataset(user,:),PopItems);
    GAPr(user,1)=GAPRecFunc(TopN(user,:),PopItems);
    NDCG(user,1)=NDCGFunc(Dataset(user,:),TopN(user,:));
    [Precision(user,1),Recall(user,1),F1(user,1)] = PrecRecallFunc(Dataset(user,:),TopN(user,:));
    APLT(user,1) = APLTFunction(TailIDX,TopN(user,:));
    Novelty(user,1) = NoveltyFunction(Dataset(user,:),TopN(user,:));
end

Results(:,1)=GAPp(:,1);
Results(:,2)=GAPr(:,1);
Results(:,3)=NDCG(:,1);
Results(:,4)=Precision(:,1);
Results(:,5)=Recall(:,1);
Results(:,6)=APLT(:,1);
Results(:,7)=Novelty(:,1);
Results(:,8)=F1(:,1);

Avg = mean(Results);

return
end


function [GAPp] = GAPProfileFunc(Profile, PopItems)
% --- Input ---
% Profile: User profile vector 1xn
% PopItems: Popularity of items 1xn

idx=find(Profile(1,:)~=0); total=0;
for i=1:size(idx,2)
    ItemID=idx(1,i);
    total=total+PopItems(1,ItemID);
end
GAPp=total/size(idx,2);
return
end

function [GAPr] = GAPRecFunc(TopN, PopItems)
% --- Input ---
% TopN: TopN recommendation list 1xN
% PopItems: Popularity of items nx1

total=0;
for i=1:size(TopN,2)
    ItemID=TopN(1,i);
    total=total+PopItems(1,ItemID);
end
GAPr=total/size(TopN,2);
return
end

function [nDCG] = NDCGFunc(Profile, TopN)
% --- Input ---
% Profile: User profile vector 1xn
% TopN: TopN recommendation list for the user 1xN
DCG=0; IDCG=0;
i=1;
[val,idx]=maxk(Profile(1,:),size(TopN,2));
for item=1:size(TopN,2)
    itemID=TopN(1,item);
    if(i==1)
        DCG=Profile(1,itemID);
        IDCG=val(1,item);
        i=i+1;
    else
        DCG=DCG+(Profile(1,itemID)/log2(item));
        IDCG=IDCG+(val(1,item)/log2(item));
    end
end

nDCG=DCG/IDCG;

return
end

function [prec,recall,f1] = PrecRecallFunc(Profile, TopN)
% --- Input ---
% Profile: User profile vector 1xn
% TopN: TopN recommendation list for the user 1xN

count=0;
for i=1:size(TopN,2)
    itemID=TopN(1,i);
    if(Profile(1,itemID)>=4)
        count=count+1;
    end
end

prec=count/size(TopN,2);
AllGood = size(find(Profile(1,:)>=4),2);
if(AllGood==0)
    recall=0;
else
    recall=count/AllGood;
end

if(prec+recall~=0)
    f1=(2*prec*recall)/(prec+recall);
else
    f1=0;
end

return
end

function [aplt] = APLTFunction (TailSet, TopN)
% --- Input ---
% TailSet: The set of tail items nx1
% TopN: TopN recommendation list for the user 1xN
count=0;
for item=1:size(TopN,2)
    itemID=TopN(1,item);
    if(ismember(itemID,TailSet))
        count=count+1;
    end
end

aplt=count/size(TopN,2);

return
end

function [novelty] = NoveltyFunction(Profile, TopN)
% --- Input ---
% Profile: User profile vector 1xn
% TopN: TopN recommendation list for the user 1xN
count=0;
for item=1:size(TopN,2)
    itemID=TopN(1,item);
    if(Profile(1,itemID)==0)
        count=count+1;
    end
end

novelty = count / size(TopN,2);

return
end









