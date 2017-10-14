% QA1
function ShowTrainImage(n)
    allTrainImages = loadMNISTImages('./train-images.idx3-ubyte');
    allTrainLabels = loadMNISTLabels('./train-labels.idx1-ubyte');
    figure;
    image = allTrainImages(:, n);
    label = allTrainLabels(n);
    image2D = reshape(image, 28, 28);
    label = ['Label: ', num2str( label)];
    imshow(image2D);
    title(label);
end

