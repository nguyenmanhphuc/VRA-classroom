function [images, labels] = loadData( imageFile, labelFile )
    images = loadMNISTImages(imageFile);
    labels = loadMNISTLabels(labelFile);
end

