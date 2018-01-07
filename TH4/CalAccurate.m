function acc = CalAccurate(num, distance)
    load('Train.mat','trainData', 'trainLabels');
    mdl = fitcknn(trainData, trainLabels, 'Distance', distance, 'NumNeighbors', num);
    load('Test.mat','testData', 'testLabels');

    countTestImages = size(testData, 1);
    predictedLabels = predict(mdl, testData);   
   correct = sum(predictedLabels==testLabels);
    acc = correct/countTestImages*100.0;
end

