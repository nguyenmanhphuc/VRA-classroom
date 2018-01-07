% Q5
function label =  PredictTest (n)
   load('Train.mat','trainData', 'trainLabels');
    
    mdl = fitcknn(trainData, trainLabels);
    
    load('Test.mat','testData', 'testLabels');
    
    imageTest = testData( n,:);
    label = predict(mdl, imageTest);
    label == testLabels(n)
end

