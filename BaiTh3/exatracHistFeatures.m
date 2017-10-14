function [ features ] = exatracHistFeatures( images )
    imageCount = size(images, 2);
    features = zeros(256, imageCount);
    for i = 1:imageCount
        features(:, i) = imhist(images(:, i), 256);
    end

end

