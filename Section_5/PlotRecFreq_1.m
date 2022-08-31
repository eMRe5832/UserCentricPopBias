function [TopN,matrix] =PlotRecFreq_1(Data,Predictions,N)
format long g
%% Determine Popularity for each item
Pop=sum(Data~=0,1);
Pop=Pop/size(Data,1);

%% Determine idx for each item
for i=1:size(Data,2)
    idxPop(1,i)=i;
end

%% Construct rating matrix
userNumber=max(Predictions(:,1));
itemNumber=max(Predictions(:,2));
matrix = zeros(userNumber,itemNumber);
for i=1:size(Predictions,1)
    userID=Predictions(i,1);
    itemID=Predictions(i,2);
    rating=Predictions(i,3);
    matrix(userID,itemID)=rating;
end
fprintf('Rating Matrix is constructed - \n');


%% Determine topN lists for each user
for i=1:size(matrix,1)
    [val,idx]=maxk(matrix(i,:),N);
    TopN(i,:)=idx;
end

fprintf('TopN lists are constructed - \n');

%% Merging produced every ranked list
TopnItems=TopN(1,:);
for i=2:size(TopN,1)
    TopnItems = cat(2,TopnItems,TopN(i,:));
end

%% Count the frequency of recommendations for each item
for i=1:size(idxPop,2)
    CountPop(1,i)=nnz(idxPop(1,i)==TopnItems);
end

p = polyfit(Pop,CountPop,1);
f = polyval(p,Pop);
plot(Pop,CountPop,'o',Pop,f,'-')
[c,p]=corrcoef(CountPop, Pop);
title(['(corr = ',sprintf('%.3f',c(1,2)),', p = ', sprintf('%.3f',p(1,2)),')'])
% scatter(Pop,CountPop,'filled')
ylabel('Recommendation Frequency')
xlabel('Item popularity')

return
end