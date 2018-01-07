function BaiTap11()
     [trainImages, trainLabels] = loadData('train-images.idx3-ubyte','train-labels.idx1-ubyte');
	
    nBins = 256;
    
    nNumTrainImages = size(trainImages,2);
    trainHists=zeros(nBins,nNumTrainImages);
    
    for i = 1:nNumTrainImages
        trainHists(:,i) =  imhist(trainImages(:,i),nBins);
    end
    
    Mdl = fitcknn(trainHists',trainLabels);
    
 [testImages, testLabels] = loadData('t10k-images.idx3-ubyte','t10k-labels.idx1-ubyte');
	
    nBins = 256;
    nNumTestImages = size(testImages,2);
    testHist = zeros(nBins,nNumTestImages);
    
    for i = 1:nNumTestImages
        testHist(:,i) = imhist(testImages(:,i),nBins);
    end

    lblResult = predict(Mdl,testHist');
    nCount = sum(lblResult == testLabels);
    fprintf('\nSo luong mau dung: %d\n',nCount); 
end