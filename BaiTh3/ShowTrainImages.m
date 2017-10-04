function ShowTrainImages(n)
    allTrainImages = loadMNISTImages('./train-images.idx3-ubyte');
    allTrainLabels = loadMNISTLabels('./train-labels.idx1-ubyte');
    nTrain = size(allTrainImages, 2);
    figure;
    image = allTrainImages(:, n);
    label = allTrainLabels(n);
    image = 
end

