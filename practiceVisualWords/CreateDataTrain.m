function CreateDataTrain()
    [trainImages, trainLabels] = loadData('train-images.idx3-ubyte', 'train-labels.idx1-ubyte');
    nTrainImages = size(trainImages, 2);
    for i = 0:9
        mkdir(['DataTrain\\',num2str(i)]);
    end
    
    indexes = zeros(1, 10);
    for i = 1:nTrainImages
        img = reshape(trainImages(:, i), 28, 28);
        label = trainLabels(i);
        strFileName = ['image_',num2str(indexes(label+1), '%05d'), '.jpg'];
        strPath = ['DataTrain\\', num2str(label), '\\',strFileName];
        imwrite(img, strPath);
        indexes(label+1) = indexes(label+1)+1;
    end
end

