function CreateDataTest()
    [testImages, testLabels] = loadData('t10k-images.idx3-ubyte', 't10k-labels.idx1-ubyte');
    nTestImages = size(testImages, 2);
    for i = 0:9
        mkdir(['DataTest\\',num2str(i)]);
    end
    
    indexes = zeros(1, 10);
    for i = 1:nTestImages
        img = reshape(testImages(:, i), 28, 28);
        label = testLabels(i);
        strFileName = ['image_',num2str(indexes(label+1), '%05d'), '.jpg'];
        strPath = ['DataTest\\', num2str(label), '\\',strFileName];
        imwrite(img, strPath);
        indexes(label+1) = indexes(label+1)+1;
    end
end

