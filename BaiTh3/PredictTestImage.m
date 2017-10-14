function label =  PredictTestImage (n)
    allTrainImages = loadMNISTImages('./train-images.idx3-ubyte');
    allTrainLabels = loadMNISTLabels('./train-labels.idx1-ubyte');
    
    mdl = fitcknn(allTrainImages', allTrainLabels);
    
    allTestImages = loadMNISTImages('./t10k-images.idx3-ubyte');
    
    imageTest = allTestImages(:, n);
    label = predict(mdl, imageTest');
end

