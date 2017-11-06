function [featureVector, visulaHOG ] = VisualizeHOG(n)
     [allTrainImages,allTrainLabels]  = loadData('./train-images.idx3-ubyte', './train-labels.idx1-ubyte');
     image2D = reshape(allTrainImages(:,n), 28, 28); 
    
     subplot(1, 5, 1);
     imshow(image2D);
     [featureVector, visulaHOG ] = extractHOGFeatures(image2D, 'CellSize', [2 2]);
     subplot(1, 5, 2);
     plot(visulaHOG);
     [featureVector, visulaHOG ] = extractHOGFeatures(image2D, 'CellSize', [4 4]);
     subplot(1, 5, 3);
     plot(visulaHOG);
     [featureVector, visulaHOG ] = extractHOGFeatures(image2D, 'CellSize', [8 8]);
     subplot(1, 5, 4);
     plot(visulaHOG);
     [featureVector, visulaHOG ] = extractHOGFeatures(image2D, 'CellSize', [7 7]);
     subplot(1, 5, 5);
     plot(visulaHOG);
end

