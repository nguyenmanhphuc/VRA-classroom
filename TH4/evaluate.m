function acc = evaluate(  )
   load('Train.mat', 'trainData', 'trainLabels');
   load('Test.mat', 'testData', 'testLabels');
    mdl = fitcknn(trainData, trainLabels);
    
    countTestImages = size(testData, 1);
 
    predictedLabels = predict(mdl, testData);   
   correct = sum(predictedLabels==testLabels);
    acc = correct/countTestImages*100;
end

