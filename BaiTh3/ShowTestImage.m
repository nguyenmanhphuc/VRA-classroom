% QA2
function ShowTestImage(n)
    allTestImages = loadMNISTImages('./t10k-images.idx3-ubyte');
    allTestLabels = loadMNISTLabels('./t10k-labels.idx1-ubyte');
    figure;
    image = allTestImages(:, n);
    label = allTestLabels(n);
    image2D = reshape(image, 28, 28);
    label = ['Label: ', num2str( label)];
    imshow(image2D);
    title(label);
end

