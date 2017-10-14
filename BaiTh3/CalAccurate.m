function acc = CalAccurate(num, distance)
    allTrainImages = loadMNISTImages('./train-images.idx3-ubyte');
    allTrainLabels = loadMNISTLabels('./train-labels.idx1-ubyte');
    
    mdl = fitcknn(allTrainImages', allTrainLabels, 'Distance', distance, 'NumNeighbors', num);
    
    allTestImages = loadMNISTImages('./t10k-images.idx3-ubyte');
    allTestLabels = loadMNISTLabels('./t10k-labels.idx1-ubyte'); 
  
    countTestImages = size(allTestImages, 2);
    correct = 0;
    predictedLabels = predict(mdl, allTestImages');   
   correct = sum(predictedLabels==allTestLabels);
    acc = correct/countTestImages*100;
end

