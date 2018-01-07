function BaiTap12()
   [trainImages, trainLabels] = loadData('train-images.idx3-ubyte', 'train-labels.idx1-ubyte');
   
  
    trainFeatures = ExtractLBPFeaturesOfImages(trainImages);


    Mdl = fitcknn(trainFeatures',trainLabels);
    
    [testImages, testLabels] = loadData('t10k-images.idx3-ubyte','t10k-labels.idx1-ubyte');
	
    testFeatures = ExtractLBPFeaturesOfImages(testImages);

    lblResult = predict(Mdl,testFeatures');
    nResult = (lblResult == testLabels);
    nCount = sum(nResult);
    fprintf('\nSo luong mau dung: %d\n',nCount); %% 54,39% mau dung
    
end