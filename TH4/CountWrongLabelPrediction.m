function count = CountWrongLabelPrediction(n)
    load('Train.mat','trainData', 'trainLabels');
    
    mdl = fitcknn(trainData, trainLabels);
   
    load('Test.mat','testData', 'testLabels');
    
    count = 0;
    countTestImages = size(testData, 1);
    for i = 1: countTestImages
        correctLabel = testLabels(i);
        if(correctLabel~=n)
            continue;
        end
        imageTest = testData(i, :);
        predictedLabel = predict(mdl, imageTest);   
       
        if predictedLabel ~= correctLabel
            count = count + 1;
        end
    end
end

