%Q6*
function [image, correctLabel, predictedLabel] =  PredictTest (n)
    allTrainImages = loadMNISTImages('./train-images.idx3-ubyte');
    allTrainLabels = loadMNISTLabels('./train-labels.idx1-ubyte');
    
    mdl = fitcknn(allTrainImages', allTrainLabels);
    
    allTestImages = loadMNISTImages('./t10k-images.idx3-ubyte');
    allTestLabels = loadMNISTLabels('./t10k-labels.idx1-ubyte'); 
    image = allTestImages(:, n);
    predictedLabel = predict(mdl, image');  
    correctLabel = allTestLabels(n);
    image = reshape(image, 28, 28);
end

