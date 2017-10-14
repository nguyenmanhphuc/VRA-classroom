function m = CountTestImagesByLabel()
    allTrainLabels = loadMNISTLabels('./t10k-labels.idx1-ubyte');
    %Number of images with zero label will be at m(10);
    m = zeros(10, 1);
    numberOfImages = size(allTrainLabels, 1);
    for i = 1: numberOfImages
        label = allTrainLabels(i);
        m(label+1) = m(label+1) +1;
    end
    
    csvwrite('CountTestLabels.csv', m);
    
end

