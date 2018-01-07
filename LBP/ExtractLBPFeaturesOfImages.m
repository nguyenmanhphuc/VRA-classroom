function features = ExtractLBPFeaturesOfImages( images )
     image = images(:, 1);
    image2D = reshape(image, 28, 28);
    featureVector = extractLBPFeatures(image2D);
    nSize = length(featureVector);
    nImages = size(images, 2);
    features =zeros(nSize, nImages);
    for i = 1:nImages
        image = images(:, i);
        image2D = reshape(image, 28, 28);
        features(:, i) = extractLBPFeatures(image2D);
    end

end

