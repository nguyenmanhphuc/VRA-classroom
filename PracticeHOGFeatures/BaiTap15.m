function BaiTap15()
     [trainImages, trainLabels] = loadData('train-images.idx3-ubyte','train-labels.idx1-ubyte');
	    
    %%Extract Features
    trainFeatures = ExtractHOGFeaturesOfImages(trainImages, 8, 8);
    
    %%Build model KNN
    Mdl = fitcknn(trainFeatures', trainLabels);
    
  	 [testImages, testLabels] = loadData('t10k-images.idx3-ubyte','t10k-labels.idx1-ubyte');
		 
    
    %%Extract Features
    testFeatures = ExtractHOGFeaturesOfImages(testImages, 8, 8);
    
    %%Save Result
    lblResult = predict(Mdl, testFeatures');
    nCount = sum(lblResult == testLabels);
    fprintf('\nSo luong mau dung: %d\n', nCount);
   
end