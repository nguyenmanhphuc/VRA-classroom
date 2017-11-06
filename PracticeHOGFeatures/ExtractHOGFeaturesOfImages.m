function features = ExtractHOGFeaturesOfImages( images, m, n )
     image = images(:, 1);
    image2D = reshape(image, 28, 28);
    featureVector = extractHOGFeatures(image2D, 'CellSize', [m n]);
    nSize = length(featureVector);
    nImages = size(images, 2);
    features =zeros(nSize, nImages);
    for i = 1:nImages
        image = images(:, i);
        image2D = reshape(image, 28, 28);
        features(:, i) = extractHOGFeatures(image2D, 'CellSize', [m n]);
    end
end

