function acc = CalAccurate_hist_local(num, distance)
    [allTrainImages,allTrainLabels]  = loadData('./train-images.idx3-ubyte', './train-labels.idx1-ubyte');
    [allTestImages, allTestLabels] = loadData('./t10k-images.idx3-ubyte','./t10k-labels.idx1-ubyte');
  
    countTestImages = size(allTestImages, 2);
    
    imageTrain_hist = exatracLocalHistFeatures(allTrainImages);
    imageTest_hist = exatracLocalHistFeatures(allTestImages);
   
    mdl = fitcknn(imageTrain_hist', allTrainLabels, 'Distance', distance, 'NumNeighbors', num);
    result = predict(mdl, imageTest_hist');
    count = sum(result==allTestLabels);
    acc = count/countTestImages;
  
end

