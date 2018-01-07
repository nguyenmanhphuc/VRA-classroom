function matrix = CreateConfusionMatrix()
   load('Train.mat','trainData', 'trainLabels');
    mdl = fitcknn(trainData, trainLabels);
    load('Test.mat','testData', 'testLabels');
    countTestImages = size(testData, 1);
    
    matrix = zeros(40);

    for i = 1: countTestImages
        correctLabel = testLabels(i);
        
        imageTest = testData( i, :);
        predictedLabel = predict(mdl, imageTest); 
       matrix(correctLabel, predictedLabel) = matrix(correctLabel, predictedLabel) + 1;
    end
end

