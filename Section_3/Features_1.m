function [Features,CorMatrix,pMatrix]=Features_1(Data)

UserNumber=max(Data(:,1)); ItemNumber=max(Data(:,2));

% Calculating means of items -- for anomaly computing
MeanItem=zeros(1,ItemNumber);
for i=1:ItemNumber
    fprintf('%d -\n',i);
    RowsItem=[];
    idx=find(Data(:,2)==i);
    if(isempty(idx))
        MeanItem(1,i)=0;
    else
        for k=1:size(idx,1)
            RowsItem=[RowsItem;Data(idx(k,1),:)];
        end
        MeanItem(1,i)=mean(RowsItem(:,3));
    end
end


%% Determine profile size-mean-anomaly-deviation 
PSize=zeros(UserNumber,1);
PMean=zeros(UserNumber,1);
PAnomaly=zeros(UserNumber,1);
PDeviation=zeros(UserNumber,1);
PEntropy=zeros(UserNumber,1);

for i=1:UserNumber
    fprintf('%d -\n',i);
    Rows=[]; 
    totalAnomaly=0;
    idx=find(Data(:,1)==i);
    %for entropy;
    counts=zeros(5,2); count1=0; count2=0; count3=0; count4=0; count5=0; entropy=0;
    if(isempty(idx))
        PSize(i,1)=0; PMean(i,1)=0; PAnomaly(i,1)=0;  PDeviation(i,1)=0; PEntropy(i,1)=0;
    else
        for k=1:size(idx,1)
            Rows=[Rows;Data(idx(k,1),:)];            
        end

        PSize(i,1)=size(Rows,1);
        PMean(i,1)=mean(Rows(:,3));
        PDeviation(i,1)=std(Rows(:,3));

        % for anomaly
        
            for item=1:size(Rows,1)
                itemID=Rows(item,2);
                totalAnomaly=totalAnomaly+abs(Rows(item,3)-MeanItem(1,itemID));
            end

        PAnomaly(i,1)=totalAnomaly/size(Rows,1);
        
        %for entropy
        for r=1:size(Rows,1)
            if(Rows(r,3)==1)
                count1=count1+1;
            elseif(Rows(r,3)==2)
                count2=count2+1;
            elseif(Rows(r,3)==3)
                count3=count3+1;
            elseif(Rows(r,3)==4)
                count4=count4+1;
            elseif(Rows(r,3)==5)
                count5=count5+1;
            end
        end

        counts(1,1)=count1;counts(2,1)=count2;counts(3,1)=count3;counts(4,1)=count4;counts(5,1)=count5;
        counts(1,2)=counts(1,1)/sum(counts(:,1));
        counts(2,2)=counts(2,1)/sum(counts(:,1));
        counts(3,2)=counts(3,1)/sum(counts(:,1));
        counts(4,2)=counts(4,1)/sum(counts(:,1));
        counts(5,2)=counts(5,1)/sum(counts(:,1));
        vector=nonzeros(counts(:,2));
        for k=1:size(vector,1)
            entropy=entropy-(vector(k,1)*log2(vector(k,1)));
        end
        PEntropy(i,1)=entropy;

    end
end


%% Correlation between features
CorMatrix=zeros(5,5); pMatrix=zeros(5,5);
[c,p] = corrcoef(PSize,PSize);
CorMatrix(1,1)=c(1,2);
pMatrix(1,1)=p(1,2);

[c,p] = corrcoef(PSize,PMean);
CorMatrix(1,2)=c(1,2);
pMatrix(1,2)=p(1,2);

[c,p] = corrcoef(PSize,PAnomaly);
CorMatrix(1,3)=c(1,2);
pMatrix(1,3)=p(1,2);

[c,p] = corrcoef(PSize,PDeviation);
CorMatrix(1,4)=c(1,2);
pMatrix(1,4)=p(1,2);

[c,p] = corrcoef(PSize,PEntropy);
CorMatrix(1,5)=c(1,2);
pMatrix(1,5)=p(1,2);

[c,p] = corrcoef(PMean,PMean);
CorMatrix(2,2)=c(1,2);
pMatrix(2,2)=p(1,2);

[c,p] = corrcoef(PMean,PAnomaly);
CorMatrix(2,3)=c(1,2);
pMatrix(2,3)=p(1,2);

[c,p] = corrcoef(PMean,PDeviation);
CorMatrix(2,4)=c(1,2);
pMatrix(2,4)=p(1,2);

[c,p] = corrcoef(PMean,PEntropy);
CorMatrix(2,5)=c(1,2);
pMatrix(2,5)=p(1,2);

[c,p] = corrcoef(PAnomaly,PAnomaly);
CorMatrix(3,3)=c(1,2);
pMatrix(3,3)=p(1,2);

[c,p] = corrcoef(PAnomaly,PDeviation);
CorMatrix(3,4)=c(1,2);
pMatrix(3,4)=p(1,2);

[c,p] = corrcoef(PAnomaly,PEntropy);
CorMatrix(3,5)=c(1,2);
pMatrix(3,5)=p(1,2);

[c,p] = corrcoef(PDeviation,PDeviation);
CorMatrix(4,4)=c(1,2);
pMatrix(4,4)=p(1,2);

[c,p] = corrcoef(PDeviation,PEntropy);
CorMatrix(4,5)=c(1,2);
pMatrix(4,5)=p(1,2);

[c,p] = corrcoef(PEntropy,PEntropy);
CorMatrix(5,5)=c(1,2);
pMatrix(5,5)=p(1,2);



%% Saving features 
Features=zeros(UserNumber,5);
Features(:,1)=PSize;
Features(:,2)=PMean;
Features(:,3)=PAnomaly;
Features(:,4)=PDeviation;
Features(:,5)=PEntropy;


return
end