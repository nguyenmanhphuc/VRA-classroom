function acc = CalAccurate_hist(num, distance)
    [allTrainImages,allTrainLabels]  = loadData('./train-images.idx3-ubyte', './train-labels.idx1-ubyte');
    [allTestImages, allTestLabels] = loadData('./t10k-images.idx3-ubyte','./t10k-labels.idx1-ubyte');
  
    countTestImages = size(allTestImages, 2);
    
    imageTrain_hist = exatracHistFeatures(allTrainImages);
    imageTest_hist = exatracHistFeatures(allTestImages);
   
    mdl = fitcknn(imageTrain_hist', allTrainLabels, 'Distance', distance, 'NumNeighbors', num);
    result = predict(mdl, imageTest_hist');
    count = sum(result==allTestLabels);
    acc = count/countTestImages;
  
end

