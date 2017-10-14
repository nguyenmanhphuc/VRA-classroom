%Q6
function ShowImageWithLabels (n)
    allTrainImages = loadMNISTImages('./train-images.idx3-ubyte');
    allTrainLabels = loadMNISTLabels('./train-labels.idx1-ubyte');
    
    mdl = fitcknn(allTrainImages', allTrainLabels);
    
    allTestImages = loadMNISTImages('./t10k-images.idx3-ubyte');
    allTestLabels = loadMNISTLabels('./t10k-labels.idx1-ubyte'); 
    imageTest = allTestImages(:, n);
    label = predict(mdl, imageTest');
    correctLabel = allTestLabels(n);
    figure;
    image2D = reshape(allTestImages(:,n), 28, 28);
    imshow(image2D);
    imageTitle = ['Predicted: ', num2str(label), ' Correct Label: ', num2str(correctLabel), ' => '];
    if label ==correctLabel
        imageTitle = [imageTitle, 'Correct Prediction'];
    else
        imageTitle = [imageTitle, 'Wrong Prediction'];
    end
    title(imageTitle);
end

