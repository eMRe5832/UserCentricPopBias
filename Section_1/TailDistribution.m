function TailDistribution(Dataset)

ItemNumber=max(Dataset(:,2));
Pop=zeros(1,ItemNumber);
for i=1:ItemNumber
    Rows=[];
    idx=find(Dataset(:,2)==i);
    if(isempty(idx))
        Pop(1,i)=0;
    else
        Pop(1,i)=size(idx,1);
    end
end

[outPop,idxPop]=sort(Pop,'descend');

plot(outPop);


return
end