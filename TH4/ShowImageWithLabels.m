%Q6
function ShowImageWithLabels (n)
   load('Train.mat','trainData', 'trainLabels');
    
    mdl = fitcknn(trainData, trainLabels);
    
    load('Test.mat','testData', 'testLabels');
     imageTest = testData(n,:);
   label = predict(mdl, imageTest);
    correctLabel = testLabels(n);
    figure;
    image2D = reshape(imageTest, 112, 92);
    imshow(image2D);
    imageTitle = ['Predicted: ', num2str(label), ' Correct Label: ', num2str(correctLabel), ' => '];
    if label ==correctLabel
        imageTitle = [imageTitle, 'Correct Prediction'];
    else
        imageTitle = [imageTitle, 'Wrong Prediction'];
    end
    title(imageTitle);
end