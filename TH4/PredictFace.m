%Q6*
function [image, correctLabel, predictedLabel] =  PredictFace (n)
    load('Train.mat','trainData', 'trainLabels');
    
    mdl = fitcknn(trainData, trainLabels);
    
    load('Test.mat','testData', 'testLabels');
    
    imageTest = testData( n,:);
    predictedLabel = predict(mdl, imageTest);
    

    correctLabel = testLabels(n);
    image = reshape(imageTest, 112, 92);
end

