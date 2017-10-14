function count = CountWrongLabelPrediction(n)
    allTrainImages = loadMNISTImages('./train-images.idx3-ubyte');
    allTrainLabels = loadMNISTLabels('./train-labels.idx1-ubyte');
    
    mdl = fitcknn(allTrainImages', allTrainLabels);
    
    allTestImages = loadMNISTImages('./t10k-images.idx3-ubyte');
    allTestLabels = loadMNISTLabels('./t10k-labels.idx1-ubyte'); 
    count = 0;
    countTestImages = size(allTestImages, 2);
    for i = 1: countTestImages
        correctLabel = allTestLabels(i);
        if(correctLabel~=n)
            continue;
        end
        imageTest = allTestImages(:, i);
        predictedLabel = predict(mdl, imageTest');   
       
        if predictedLabel ~= correctLabel
            count = count + 1;
        end
    end
end

