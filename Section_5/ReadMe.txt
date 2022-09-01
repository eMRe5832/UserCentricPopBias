Initial Step
Get predictions for ten algorithms on four datasets via ComputePredictions.ipynb and save predicted scores as "Predictions/DatasetName/AlgorithmName.txt" and then transform them as user-rating matrix .mat format and then save them to the RatingMatrix folder. By using such corresponding .mat files, for each algorithm, extract top-10 recommended items for each user as nx10 .mat format in the TopNLists folder. This process is performed via the PlotRecFreq_1.m file, which is also used to sketch figures in Section 5.1.
 
Note that, due to their high size, RatingMatrix and TopNLists folders are not shared, as you first need to extract these files, as explained above. 

In the Data folder, we store the original datasets as .txt files. The datasets are stored as user-item matrix form (userID|itemID|Rating) in nx3 format, where n is the total number of provided ratings.

