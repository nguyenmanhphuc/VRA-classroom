function m = BaiTap014()
    [allTrainImages,allTrainLabels]  = loadData('./train-images.idx3-ubyte', './train-labels.idx1-ubyte');
    [allTestImages, allTestLabels] = loadData('./t10k-images.idx3-ubyte','./t10k-labels.idx1-ubyte');
  
    featuresDataTrain =ExtractHOGFeaturesOfImages(allTrainImages , 2, 2);
   
    mdl = fitcknn(featuresDataTrain', allTrainLabels);
    
    featuresDataTest =ExtractHOGFeaturesOfImages(allTestImages, 2, 2);
    lblResult = predict(mdl, featuresDataTest');
    nCorrect = sum(lblResult==allTestLabels);
    fprintf('Count Correct Prediction: %d\n', nCorrect);
    m = nCorrect;
end

