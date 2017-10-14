function [ features ] = exatracLocalHistFeatures( images )
     imageCount = size(images, 2);
    features = zeros(1024, imageCount);
     for i = 1:imageCount
           image = reshape(images(:, i), 28,28);
           features(1:256, i) = imhist(image(1:14, 1:14), 256);
           features(257:512, i) = imhist(image(1:14, 15:28), 256);
           features(513:768, i) = imhist(image(15:28, 1:14), 256);
           features(769:1024, i) = imhist(image(15:28, 15:28), 256);
    end

end

