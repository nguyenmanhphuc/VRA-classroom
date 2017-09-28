function Recognition002_Digits()
    fprintf('\nLoading train data');
    allTrainImages = loadMNISTImages('./train-images.idx3-ubyte');
    allTrainLabels = loadMNISTLabels('./train-labels.idx1-ubyte');
    fprintf('\nLoading test data');
    allTestImages = loadMNISTImages('./t10k-images.idx3-ubyte');
    allTestLabels = loadMNISTLabels('./t10k-labels.idx1-ubyte');
    fprintf('\nCompleted.\n');
    nTrainImages = size(allTrainImages, 2);
    nTrainLabels = size(allTrainLabels, 1);
    nTestImages = size(allTestImages, 2);
    nTestLabels = size(allTestLabels, 1);
    sizeOfImage = size(allTrainImages, 1);
    
    fprintf('\nNumber of images in train data: [%d] .', nTrainImages);
    fprintf('\nNumber of labels in train data: [%d].', nTrainLabels);
    fprintf('\nNumber of images in test data: [%d].', nTestImages);
    fprintf('\nNumber of labels in test data: [%d].', nTestLabels);
    fprintf('\nSize of image: [%d].', sizeOfImage);
end

