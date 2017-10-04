function m = findFirstUncorrectPredict()
    allTrainImages = loadMNISTImages('./train-images.idx3-ubyte');
    allTrainLabels = loadMNISTLabels('./train-labels.idx1-ubyte');
    
    mdl = fitcknn(allTrainImages', allTrainLabels);
    
    allTestImages = loadMNISTImages('./t10k-images.idx3-ubyte');
    allTestLabels = loadMNISTLabels('./t10k-labels.idx1-ubyte');
    nTestImages = size(allTestImages, 2);
    for  i = 1:nTestImages
         imageTest = allTestImages(:, i);
         lblPredictTest = predict(mdl, imageTest');
         lblImageTest = allTestLabels(i);
         if lblImageTest ~= lblPredictTest
             m = i;
     
         end
    end
  
end

