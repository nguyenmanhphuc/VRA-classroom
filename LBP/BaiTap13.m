function BaiTap013()

	 [trainImages, trainLabels] = loadData('train-images.idx3-ubyte','train-labels.idx1-ubyte');
	
     featuresDataTrain = extrac(trainImages);

	Mdl = fitcknn(featuresDataTrain', trainLabels);
    
	 [testImages, testLabels] = loadData('t10k-images.idx3-ubyte','t10k-labels.idx1-ubyte');
	

	featuresDataTest = ExtractFeaturesHist(testImages);

	lblResult = predict(Mdl,featuresDataTest');
	nCount = sum(lblResult == testLabels);
	fprintf('\nSo luong mau dung: %d\n',nCount);
end