function [AllResults] = CompareAlgorithms()

AllResults=zeros(10,8);

[Avg,Results]=MetricALL(MLM, Random);
AllResults(1,:) = Avg;

[Avg,Results]=MetricALL(MLM, ItemAVG);
AllResults(2,:) = Avg;

[Avg,Results]=MetricALL(MLM, MMMF);
AllResults(3,:) = Avg;

[Avg,Results]=MetricALL(MLM, WMF);
AllResults(4,:) = Avg;

[Avg,Results]=MetricALL(MLM, HPF);
AllResults(5,:) = Avg;

[Avg,Results]=MetricALL(MLM, IBPR);
AllResults(6,:) = Avg;

[Avg,Results]=MetricALL(MLM, WBPR);
AllResults(7,:) = Avg;

[Avg,Results]=MetricALL(MLM, SKM);
AllResults(8,:) = Avg;

[Avg,Results]=MetricALL(MLM, NEUMF);
AllResults(9,:) = Avg;

[Avg,Results]=MetricALL(MLM, VAECF);
AllResults(10,:) = Avg;


return
end