function Recognition005_Digits_KNN()
    allTrainImages = loadMNISTImages('./train-images.idx3-ubyte');
    allTrainLabels = loadMNISTLabels('./train-labels.idx1-ubyte');
    
    mdl = fitcknn(allTrainImages', allTrainLabels);
    
    allTestImages = loadMNISTImages('./t10k-images.idx3-ubyte');
    allTestLabels = loadMNISTLabels('./t10k-labels.idx1-ubyte');
    
    nTestImages = size(allTestImages, 2);
    nNumber = randi([1 nTestImages]);
    imageTest = allTestImages(:, nNumber);
    lblPredictTest = predict(mdl, imageTest');
    
    lblImageTest = allTestLabels(nNumber);
    figure;
    image2D = reshape(imageTest, 28, 28);
    imshow(image2D);
    strImageLabel = 'Ban dau ';
    strImageLabel =  [strImageLabel, num2str(lblImageTest), '.', ' Du Doan: ', num2str(lblPredictTest), '.'];
    if(lblImageTest==lblPredictTest)
        strImageLabel = [strImageLabel, 'Ket qua dung.'];
    else
        strImageLabel = [strImageLabel, 'Ket qua sai.'];
    end
    title(strImageLabel);
end

