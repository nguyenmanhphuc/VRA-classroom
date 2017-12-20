function BaiTap026()
    [trainImages, trainLabels] = loadData('train-images.idx3-ubyte','train-labels.idx1-ubyte');
    mdl = fitcecoc(trainImages', trainLabels);
    [testImages, testLabels] = loadData('t10k-images.idx3-ubyte','t10k-labels.idx1-ubyte' );
    nResult = predict(mdl, testImages');
    nCount = sum(nResult==testLabels);
    fprintf('\nSo mau dung %d\n', nCount);
end

