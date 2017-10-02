function Recognition004_Digits()
    allTrainImages = loadMNISTImages('./train-images.idx3-ubyte');
    allTrainLabels = loadMNISTLabels('./train-labels.idx1-ubyte');
    allTestImages = loadMNISTImages('./t10k-images.idx3-ubyte');
    allTestLabels = loadMNISTLabels('./t10k-labels.idx1-ubyte');
    nTrainImages = size(allTrainImages, 2);
    nNumber = randi([1 nTrainImages]);
    figure;
    image = allTrainImages(:,nNumber);
    image2D = reshape(image, 28, 28);
    strImageLabel =  num2str(allTrainLabels(nNumber));
    strImageLabel = [strImageLabel, '(', num2str(nNumber), ')'];
    imshow(image2D);
    title(strImageLabel);
    
    nTestImages = size(allTestImages, 2);
    nNumber = randi([1 nTestImages]);
    figure;
    image = allTestImages(:,nNumber);
    image2D = reshape(image, 28, 28);
    strImageLabel =  num2str(allTestLabels(nNumber));
    strImageLabel = [strImageLabel, '(', num2str(nNumber), ')'];
    imshow(image2D);
    title(strImageLabel);   
    
end

