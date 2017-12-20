function BaiTap027()
    [trainImages, trainLabels] = loadData('train-images.idx3-ubyte','train-labels.idx1-ubyte');
    nBins = 256;
    [testImages, testLabels] = loadData('t10k-images.idx3-ubyte','t10k-labels.idx1-ubyte' );
    nTrainImages = size(trainImages, 2);
    imgTrainHist = zeros(nBins, nTrainImages);
    for i = 1: nTrainImages
        imgTrainHist(:, i) = imhist(trainImages(:, i), nBins);
    end
    mdl = fitcecoc(imgTrainHist', trainLabels);
    save('model027.mat', 'mdl');
    nTestImages = size(testImages, 2);
    
    imgTestHist = zeros(nBins, nTestImages);
    for i = 1: nTestImages
        imgTestHist(:, i) = imhist(testImages(:, i), nBins);
    end
    
    nResult = predict(mdl, imgTestHist');
    nCount = sum(nResult==testLabels);
    fprintf('\nSo mau dung %d\n', nCount);
end

