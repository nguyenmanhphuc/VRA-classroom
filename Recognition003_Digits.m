function Recognition003_Digits()
    fprintf('\nLoading train data');
    allTrainImages = loadMNISTImages('./train-images.idx3-ubyte');
    allTrainLabels = loadMNISTLabels('./train-labels.idx1-ubyte');
    fprintf('\nLoading test data');
    allTestImages = loadMNISTImages('./t10k-images.idx3-ubyte');
    allTestLabels = loadMNISTLabels('./t10k-labels.idx1-ubyte');
    fprintf('\nCompleted.\n');
    nTrainImages = size(allTrainImages, 2);
   
    figure;
    image = allTrainImages(:,1);
    image2D = reshape(image, 28, 28);
    strImageLabel =  num2str(allTrainLabels(1));
    imshow(image2D);
    title(strImageLabel);
    
    figure;
    lastImage = allTrainImages(:,nTrainImages);
    image2DLast = reshape(lastImage, 28, 28);
    strImageLabel =  num2str(allTrainLabels(nTrainImages));
    imshow(image2DLast);
    title(strImageLabel);
end

